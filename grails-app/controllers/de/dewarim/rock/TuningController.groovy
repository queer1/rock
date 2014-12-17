package de.dewarim.rock

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TuningController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tuning.list(params), model:[tuningInstanceCount: Tuning.count()]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def show(Tuning tuningInstance) {
        respond tuningInstance
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Tuning(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
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

    @Secured(['ROLE_ADMIN'])
    def edit(Tuning tuningInstance) {
        respond tuningInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
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
    @Secured(['ROLE_ADMIN'])
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
