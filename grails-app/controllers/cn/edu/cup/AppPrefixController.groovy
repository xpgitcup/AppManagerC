package cn.edu.cup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AppPrefixController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AppPrefix.list(params), model:[appPrefixInstanceCount: AppPrefix.count()]
    }

    def show(AppPrefix appPrefixInstance) {
        respond appPrefixInstance
    }

    def create() {
        respond new AppPrefix(params)
    }

    @Transactional
    def save(AppPrefix appPrefixInstance) {
        if (appPrefixInstance == null) {
            notFound()
            return
        }

        if (appPrefixInstance.hasErrors()) {
            respond appPrefixInstance.errors, view:'create'
            return
        }

        appPrefixInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'appPrefix.label', default: 'AppPrefix'), appPrefixInstance.id])
                redirect appPrefixInstance
            }
            '*' { respond appPrefixInstance, [status: CREATED] }
        }
    }

    def edit(AppPrefix appPrefixInstance) {
        respond appPrefixInstance
    }

    @Transactional
    def update(AppPrefix appPrefixInstance) {
        if (appPrefixInstance == null) {
            notFound()
            return
        }

        if (appPrefixInstance.hasErrors()) {
            respond appPrefixInstance.errors, view:'edit'
            return
        }

        appPrefixInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AppPrefix.label', default: 'AppPrefix'), appPrefixInstance.id])
                redirect appPrefixInstance
            }
            '*'{ respond appPrefixInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AppPrefix appPrefixInstance) {

        if (appPrefixInstance == null) {
            notFound()
            return
        }

        appPrefixInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AppPrefix.label', default: 'AppPrefix'), appPrefixInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'appPrefix.label', default: 'AppPrefix'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
