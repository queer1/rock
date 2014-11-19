package de.dewarim.rock

class Band {

    static hasMany = [songs:Song]
    static constraints = {
        name unique: true, blank: false
    }

    String name

    boolean equals(o) {
        if (this.is(o)) return true
        if (!(o instanceof Band)) return false

        Band band = (Band) o

        if (name != band.name) return false

        return true
    }

    int hashCode() {
        return name.hashCode()
    }

    @Override
    public String toString() {
        return "Band{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
