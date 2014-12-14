import com.google.common.primitives.Ints
import de.dewarim.rock.Authority
import de.dewarim.rock.Band
import de.dewarim.rock.Person
import de.dewarim.rock.PersonAuthority
import de.dewarim.rock.Song
import de.dewarim.rock.Tuning

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

            def dataFiles = ['data/rocksmith-tracklist.csv', 'data/rocksmith-dlc.csv', 'data/rocksmith-2014-tracklist.csv']

            dataFiles.each {        filename ->
                new File(filename).eachCsvLine { line ->
                    if(line.length < 3){ // we need at least 3 columns
                        return
                    }
                    def songName = (String) line[0]
                    def bandName = (String) line[1]
                    def songYear = Ints.tryParse(line[2])

                    Tuning tuning = null;
                    if (line.length > 3) {
                        def originalTuning = (String) line[3]
                        tuning = Tuning.findByName(originalTuning)
                    }

                    def band = Band.findByName(bandName)
                    if (!band) {
                        band = new Band(name: bandName)
                        band.save()
                    }
                    def song = Song.findByName(songName)
                    if (song) {
                        log.debug("Song $songName already exists. Skipping.")
                        return
                    }
                    song = new Song(name: songName, year: songYear, band: band, tuning: tuning)
                    song.save()
                    log.debug("Imported song " + song)
                }
            }
        }

        log.debug("Available songs: "+Song.count())
    }
    def destroy = {
    }
}
