package de.dewarim.rock

class Score {

    static constraints = {
    }
    
    static belongsTo = [song:Song, person:Person]

    Integer points
    Integer ranking
    Date dateCreated

}
