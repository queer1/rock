package de.dewarim.rock

class Tuning {

    static constraints = {
        name unique: true, blank: false
    }

    String name

    boolean equals(o) {
        if (this.is(o)) return true
        if (!(o instanceof Tuning)) return false

        Tuning tuning = (Tuning) o

        if (name != tuning.name) return false

        return true
    }

    int hashCode() {
        return name.hashCode()
    }


    @Override
    public String toString() {
        return "Tuning{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
