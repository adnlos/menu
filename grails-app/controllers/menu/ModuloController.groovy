package menu

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*
import org.hibernate.criterion.*

class ModuloController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }


    def list() {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [moduloInstanceList: Modulo.list(params), moduloInstanceTotal: Modulo.count()]
    }

    def listJSON = {

        def sortIndex = params.sidx ?: 'nombre'
        def sortOrder = params.sord ?: 'asc'
        def maxRows = Integer.valueOf(params.rows)
        def currentPage = Integer.valueOf(params.page) ?:1
        def rowOffSet = currentPage == 1 ? 0:  (currentPage-1) * maxRows

        def modulos = Modulo.list(max:maxRows, offset: rowOffSet, sort:sortIndex ,order:params.sord)

        def totalRows = modulos.size()
        def numberOfPages = Math.ceil(totalRows / maxRows)

        def results = modulos?.collect {
            [
                cell: [it.id, it.nombre, it.url, it.estado, it.posicion , it.imagen],
                id: it.id
            ]
        }

        def jsonData = [rows: results, page: currentPage, records:totalRows, total: numberOfPages]
        render jsonData as JSON

    }

    //JSON para editar el Grid
    def listEditJSON = {

        def sortIndex = params.sidx ?:'nombre'
        def sortOrder = params.sord ?: 'asc'
        def maxRows = Integer.valueOf(params.rows)
        def currentPage = Integer.valueOf(params.page)

        def rowOffSet = currentPage == 1 ? 0: (currentPage -1) + maxRows

        def modulos = Modulo.createCriteria().list(max:maxRows, offset:rowOffSet, sort:sortIndex, order:params.sord){
            if(params.id) eq('id', params.id.toLong())
            if(params.nombre) eq('nombre', "${params.nombre}")
            if(params.url) eq('url', "${params.url}")
            if(params.estado) eq('estado', "${params.estado}")
            if(params.posicion) eq('posicion', params.posicion)
            if(params.imagen) eq('imagen', params.imagen.toBoolean())
        }

        def totalRows = modulos.size()
        def numberOfPages = Math.ceil(totalRows/maxRows)

        def results = modulos?.collect{
            [
                cell:[it.id, it.nombre, it.url, it.estado, it.posicion, it.imagen],
                id: it.id
            ]
        }

        def jsonData = [rows: results, page:currentPage, records:totalRows, total: numberOfPages]
        render jsonData as JSON
    }


    def saveJson = {
        def moduloInstance = new Modulo(params)
        moduloInstance.save(flush: true)
        render ""
    }

        
    def updateJson = {
        def moduloInstance = Modulo.get(params.id)
        if (moduloInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (moduloInstance.version > version) {
                    render "error"
                }
            }
            moduloInstance.properties = params
            if (!moduloInstance.hasErrors() && moduloInstance.save(flush: true)) {
                render "success"
            }
            else {
                render "error"
            }
        }
        else {
            render "error"
        }
    }

    
    
    def deleteJson = {
        println "delete json> " + params.id
        println "params> " + params
        def moduloInstance = Modulo.get(params.id)
        if (moduloInstance) {
            try {
                moduloInstance.delete(flush: true)
                render "${message(code: 'default.deleted.message', args: [message(code: 'Modulo.label', default: 'Modulo'), params.id])}"
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                render "${message(code: 'default.not.deleted.message', args: [message(code: 'Modulo.label', default: 'Modulo'), params.id])}"
            }
        }
        else {
            render "${message(code: 'default.not.found.message', args: [message(code: 'Modulo.label', default: 'Modulo'), params.id])}"
        }
    }


    def create() {
        [moduloInstance: new Modulo(params)]
    }

    def save() {
        def moduloInstance = new Modulo(params)
        if (!moduloInstance.save(flush: true)) {
            render(view: "create", model: [moduloInstance: moduloInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'modulo.label', default: 'Modulo'), moduloInstance.id])
        redirect(action: "show", id: moduloInstance.id)
    }

    def show() {
        def moduloInstance = Modulo.get(params.id)
        if (!moduloInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'modulo.label', default: 'Modulo'), params.id])
            redirect(action: "list")
            return
        }

        [moduloInstance: moduloInstance]
    }

    def edit() {
        def moduloInstance = Modulo.get(params.id)
        if (!moduloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modulo.label', default: 'Modulo'), params.id])
            redirect(action: "list")
            return
        }

        [moduloInstance: moduloInstance]
    }

    def update() {
        def moduloInstance = Modulo.get(params.id)
        if (!moduloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modulo.label', default: 'Modulo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (moduloInstance.version > version) {
                moduloInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'modulo.label', default: 'Modulo')] as Object[],
                          "Another user has updated this Modulo while you were editing")
                render(view: "edit", model: [moduloInstance: moduloInstance])
                return
            }
        }

        moduloInstance.properties = params

        if (!moduloInstance.save(flush: true)) {
            render(view: "edit", model: [moduloInstance: moduloInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'modulo.label', default: 'Modulo'), moduloInstance.id])
        redirect(action: "show", id: moduloInstance.id)
    }

    def delete() {
        println "delete"
        def moduloInstance = Modulo.get(params.id)
        if (!moduloInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'modulo.label', default: 'Modulo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            moduloInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'modulo.label', default: 'Modulo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'modulo.label', default: 'Modulo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
