package de.dewarim.rock

class Band {

    static hasMany = [songs:Song]
    static constraints = {
    }

    String name
}
