package cn.edu.cup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserAppController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserApp.list(params), model:[userAppInstanceCount: UserApp.count()]
    }

    def show(UserApp userAppInstance) {
        respond userAppInstance
    }

    def create() {
        respond new UserApp(params)
    }

    @Transactional
    def save(UserApp userAppInstance) {
        if (userAppInstance == null) {
            notFound()
            return
        }

        if (userAppInstance.hasErrors()) {
            respond userAppInstance.errors, view:'create'
            return
        }

        userAppInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userApp.label', default: 'UserApp'), userAppInstance.id])
                redirect userAppInstance
            }
            '*' { respond userAppInstance, [status: CREATED] }
        }
    }

    def edit(UserApp userAppInstance) {
        respond userAppInstance
    }

    @Transactional
    def update(UserApp userAppInstance) {
        if (userAppInstance == null) {
            notFound()
            return
        }

        if (userAppInstance.hasErrors()) {
            respond userAppInstance.errors, view:'edit'
            return
        }

        userAppInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserApp.label', default: 'UserApp'), userAppInstance.id])
                redirect userAppInstance
            }
            '*'{ respond userAppInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserApp userAppInstance) {

        if (userAppInstance == null) {
            notFound()
            return
        }

        userAppInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserApp.label', default: 'UserApp'), userAppInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userApp.label', default: 'UserApp'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
