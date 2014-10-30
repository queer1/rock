package de.dewarim.rock

import grails.test.mixin.TestFor
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Tuning)
class TuningSpec extends ConstraintUnitSpec {

    def setup() {
        def duplicateTuning = new Tuning(name: 'dup-step')
        duplicateTuning.save()
        mockForConstraintsTests(Tuning, [duplicateTuning])
    }

    def cleanup() {
    }

    @Unroll("test tuning constraints #field is #error")
    void "test constraints Tuning"() {
        when:
        def tuning = new Tuning("$field": val)

        then:
        validateConstraints(tuning, field, error)

        where:
        error      | field  | val
        'valid'    | 'name' | 'E Standard'
        'nullable' | 'name' | null
        'nullable' | 'name' | ' ' // dataBinder turns blank String to null.
        'unique'   | 'name' | 'dup-step'
    }
}
