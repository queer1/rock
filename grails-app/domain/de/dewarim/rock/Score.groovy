package de.dewarim.rock

class Score {

    static constraints = {
    }
    
    static belongsTo = [song:Song, person:Person]

    Integer points = 0
    Integer ranking = 0
    Date dateCreated

    Integer longestStreak = 0
    Integer precisionTimesTen = 0
    Integer abilityTimesTen = 0
    ScoreType scoreType
    InstrumentType instrumentType

    boolean equals(o) {
        if (this.is(o)) return true
        if (!(o instanceof Score)) return false

        Score score = (Score) o

        if (abilityTimesTen != score.abilityTimesTen) return false
        if (dateCreated != score.dateCreated) return false
        if (id != score.id) return false
        if (longestStreak != score.longestStreak) return false
        if (person != score.person) return false
        if (points != score.points) return false
        if (precisionTimesTen != score.precisionTimesTen) return false
        if (ranking != score.ranking) return false
        if (song != score.song) return false
        if (scoreType != score.scoreType) return false
        if (instrumentType != score.instrumentType) return false

        return true
    }

    int hashCode() {
        int result
        result = (points != null ? points.hashCode() : 0)
        result = 31 * result + (ranking != null ? ranking.hashCode() : 0)
        result = 31 * result + dateCreated.hashCode()
        result = 31 * result + (longestStreak != null ? longestStreak.hashCode() : 0)
        result = 31 * result + (precisionTimesTen != null ? precisionTimesTen.hashCode() : 0)
        result = 31 * result + (abilityTimesTen != null ? abilityTimesTen.hashCode() : 0)
        result = 31 * result + scoreType.hashCode()
        return result
    }


    @Override
    public String toString() {
        return "Score{" +
                "id=" + id +
                ", points=" + points +
                ", ranking=" + ranking +
                ", dateCreated=" + dateCreated +
                ", longestStreak=" + longestStreak +
                ", precisionTimesTen=" + precisionTimesTen +
                ", abilityTimesTen=" + abilityTimesTen +
                ", scoreType=" + scoreType +
                ", instrumentType=" + instrumentType +
                ", song=" + song.name +
                ", person=" + person.username +
                '}';
    }
}
