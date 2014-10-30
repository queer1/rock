package de.dewarim.rock

import org.springframework.validation.FieldError
import spock.lang.Specification

/**
 * see: http://www.christianoestreich.com/2012/11/domain-constraints-grails-spock-updated/
 */
class ConstraintUnitSpec extends Specification {

    void validateConstraints(obj, field, error) {
        def validated = obj.validate()
        if (error && error != 'valid') {
            assert !validated
            assert obj.errors.hasFieldErrors(field)
            def hasRequiredError = false
            obj.errors.getFieldErrors(field).each { FieldError fieldError ->
                if (fieldError.codes.contains(error)) {
                    hasRequiredError = true
                }
            }
            if (!hasRequiredError) {
                assert obj.errors == "Could not find error type '$error' on field '$field'"
            }
        } else {
            assert !obj.errors[field]
        }
    }
}
