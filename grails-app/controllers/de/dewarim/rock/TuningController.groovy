package de.dewarim.rock

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class TuningController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tuning.list(params), model:[tuningInstanceCount: Tuning.count()]
    }

    def show(Tuning tuningInstance) {
        respond tuningInstance
    }

    def create() {
        respond new Tuning(params)
    }

    @Transactional
    def save(Tuning tuningInstance) {
        if (tuningInstance == null) {
            notFound()
            return
        }

        if (tuningInstance.hasErrors()) {
            respond tuningInstance.errors, view:'create'
            return
        }

        tuningInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tuning.label', default: 'Tuning'), tuningInstance.id])
                redirect tuningInstance
            }
            '*' { respond tuningInstance, [status: CREATED] }
        }
    }

    def edit(Tuning tuningInstance) {
        respond tuningInstance
    }

    @Transactional
    def update(Tuning tuningInstance) {
        if (tuningInstance == null) {
            notFound()
            return
        }

        if (tuningInstance.hasErrors()) {
            respond tuningInstance.errors, view:'edit'
            return
        }

        tuningInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tuning.label', default: 'Tuning'), tuningInstance.id])
                redirect tuningInstance
            }
            '*'{ respond tuningInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tuning tuningInstance) {

        if (tuningInstance == null) {
            notFound()
            return
        }

        tuningInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tuning.label', default: 'Tuning'), tuningInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tuning.label', default: 'Tuning'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
