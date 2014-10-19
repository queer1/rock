package de.dewarim.rock

class Song {

    static hasMany = [scores:Score]
    static belongsTo = [band:Band]
    static constraints = {
        year nullable:true
    }

    String name
    /**
     * Number of times a user has played this song via "learn a song" mode
     */
    Integer playedNormal = 0
    Integer playedArcade = 0
    Integer year


    @Override
    public String toString() {
        return "Song{" +
                "id=" + id +
                ", band=" + band.name +
                ", name='" + name + '\'' +
                ", playedNormal=" + playedNormal +
                ", playedArcade=" + playedArcade +
                ", year=" + year +
                '}';
    }
}
