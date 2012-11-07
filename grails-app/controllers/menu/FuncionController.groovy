package menu

import org.springframework.dao.DataIntegrityViolationException

class FuncionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [funcionInstanceList: Funcion.list(params), funcionInstanceTotal: Funcion.count()]
    }

    def create() {
        [funcionInstance: new Funcion(params)]
    }

    def save() {
        def funcionInstance = new Funcion(params)
        if (!funcionInstance.save(flush: true)) {
            render(view: "create", model: [funcionInstance: funcionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'funcion.label', default: 'Funcion'), funcionInstance.id])
        redirect(action: "show", id: funcionInstance.id)
    }

    def show() {
        def funcionInstance = Funcion.get(params.id)
        if (!funcionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcion.label', default: 'Funcion'), params.id])
            redirect(action: "list")
            return
        }

        [funcionInstance: funcionInstance]
    }

    def edit() {
        def funcionInstance = Funcion.get(params.id)
        if (!funcionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcion.label', default: 'Funcion'), params.id])
            redirect(action: "list")
            return
        }

        [funcionInstance: funcionInstance]
    }

    def update() {
        def funcionInstance = Funcion.get(params.id)
        if (!funcionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcion.label', default: 'Funcion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (funcionInstance.version > version) {
                funcionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'funcion.label', default: 'Funcion')] as Object[],
                          "Another user has updated this Funcion while you were editing")
                render(view: "edit", model: [funcionInstance: funcionInstance])
                return
            }
        }

        funcionInstance.properties = params

        if (!funcionInstance.save(flush: true)) {
            render(view: "edit", model: [funcionInstance: funcionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'funcion.label', default: 'Funcion'), funcionInstance.id])
        redirect(action: "show", id: funcionInstance.id)
    }

    def delete() {
        def funcionInstance = Funcion.get(params.id)
        if (!funcionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcion.label', default: 'Funcion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            funcionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'funcion.label', default: 'Funcion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'funcion.label', default: 'Funcion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
