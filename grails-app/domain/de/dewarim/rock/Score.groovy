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
    ScoreType type



}
