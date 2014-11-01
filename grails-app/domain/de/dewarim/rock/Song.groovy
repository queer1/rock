package de.dewarim.rock

class Song {

    static hasMany = [scores:Score]
    static belongsTo = [band:Band]
    static constraints = {
        year nullable:true
        tuning nullable: true
    }

    String name
    /**
     * Number of times a user has played this song via "learn a song" mode
     */
    Integer playedNormal = 0
    Integer playedArcade = 0
    Integer year
    Tuning tuning


    @Override
    public String toString() {
        return "Song{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", playedNormal=" + playedNormal +
                ", playedArcade=" + playedArcade +
                ", year=" + year +
                ", tuning=" + tuning +
                ", band=" + band +
                '}';
    }

    boolean equals(o) {
        if (this.is(o)) return true
        if (!(o instanceof Song)) return false

        Song song = (Song) o

        if (band != song.band) return false
        if (name != song.name) return false
        if (playedArcade != song.playedArcade) return false
        if (playedNormal != song.playedNormal) return false
        if (tuning != song.tuning) return false
        if (year != song.year) return false

        return true
    }

    int hashCode() {
        int result
        result = name.hashCode()
        result = 31 * result + playedNormal.hashCode()
        result = 31 * result + playedArcade.hashCode()
        result = 31 * result + (year != null ? year.hashCode() : 0)
        return result
    }
}
