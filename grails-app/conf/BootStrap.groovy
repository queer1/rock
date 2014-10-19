import de.dewarim.rock.Authority
import de.dewarim.rock.Band
import de.dewarim.rock.Person
import de.dewarim.rock.PersonAuthority
import de.dewarim.rock.Song

class BootStrap {

    def init = { servletContext ->

        if (Person.count() > 0) {
            // do not initialize if user accounts exist.
            return
        }
        def admin = new Person(username: "admin", password: "admin")
        admin.save()
        def rock = new Person(username: "rock", password: "rock")
        rock.save()

        def adminAuthority = new Authority(authority: 'ROLE_ADMIN')
        adminAuthority.save()
        PersonAuthority.create(admin, adminAuthority, true)
        def userAuthority = new Authority(authority: 'ROLE_USER')
        userAuthority.save()
        PersonAuthority.create(admin, userAuthority, true)
        PersonAuthority.create(rock, userAuthority, true)

        // import song lists
        Song.withTransaction {
            def rocksmith1 = new File('data/rocksmith-tracklist.csv').eachCsvLine { line ->
                def songName = (String) line[0]
                def bandName = (String) line[1]
                def songYear = line[2] == null ? null : Integer.parseInt(line[2])
                def band = Band.findByName(bandName)
                if (!band) {
                    band = new
                            Band(name: bandName)
                    band.save()
                }
                def song = Song.findByName(songName)
                if (song) {
                    log.debug("Song $songName already exists. Skipping.")
                    return
                }
                song = new Song(name: songName, year: songYear, band: band)
                song.save()
                log.debug("Imported song "+song)
            }

        }

        log.debug("Available songs: "+Song.count())
    }
    def destroy = {
    }
}
