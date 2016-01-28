package cn.edu.cup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AppRolesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AppRoles.list(params), model:[appRolesInstanceCount: AppRoles.count()]
    }

    def show(AppRoles appRolesInstance) {
        respond appRolesInstance
    }

    def create() {
        respond new AppRoles(params)
    }

    @Transactional
    def save(AppRoles appRolesInstance) {
        if (appRolesInstance == null) {
            notFound()
            return
        }

        if (appRolesInstance.hasErrors()) {
            respond appRolesInstance.errors, view:'create'
            return
        }

        appRolesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'appRoles.label', default: 'AppRoles'), appRolesInstance.id])
                redirect appRolesInstance
            }
            '*' { respond appRolesInstance, [status: CREATED] }
        }
    }

    def edit(AppRoles appRolesInstance) {
        respond appRolesInstance
    }

    @Transactional
    def update(AppRoles appRolesInstance) {
        if (appRolesInstance == null) {
            notFound()
            return
        }

        if (appRolesInstance.hasErrors()) {
            respond appRolesInstance.errors, view:'edit'
            return
        }

        appRolesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AppRoles.label', default: 'AppRoles'), appRolesInstance.id])
                redirect appRolesInstance
            }
            '*'{ respond appRolesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AppRoles appRolesInstance) {

        if (appRolesInstance == null) {
            notFound()
            return
        }

        appRolesInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AppRoles.label', default: 'AppRoles'), appRolesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'appRoles.label', default: 'AppRoles'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
