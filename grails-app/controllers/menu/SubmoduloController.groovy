package menu

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*
import org.hibernate.criterion.*

class SubmoduloController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [submoduloInstanceList: Submodulo.list(params), submoduloInstanceTotal: Submodulo.count()]
    }

    
    def listEditJSON = {

        def sortIndex = params.sidx ?:'nombre'
        def sortOrder = params.sord ?: 'asc'
        def maxRows = Integer.valueOf(params.rows)
        def currentPage = Integer.valueOf(params.page)

        def rowOffSet = currentPage == 1 ? 0: (currentPage -1) + maxRows

        def modulos = Submodulo.createCriteria().list(max:maxRows, offset:rowOffSet, sort:sortIndex, order:params.sord){
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
                cell:[it.id, it.nombre, it.url, it.estado, it.posicion, it.imagen, it.modulo.nombre],
                id: it.id
            ]
        }

        def jsonDataSubmodulo = [rows: results, page:currentPage, records:totalRows, total: numberOfPages]
        render jsonDataSubmodulo as JSON
    }


    def create() {
        [submoduloInstance: new Submodulo(params)]
    }

    def save() {
        def submoduloInstance = new Submodulo(params)
        if (!submoduloInstance.save(flush: true)) {
            render(view: "create", model: [submoduloInstance: submoduloInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'submodulo.label', default: 'Submodulo'), submoduloInstance.id])
        redirect(action: "show", id: submoduloInstance.id)
    }

    def show() {
        def submoduloInstance = Submodulo.get(params.id)
        if (!submoduloInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'submodulo.label', default: 'Submodulo'), params.id])
            redirect(action: "list")
            return
        }

        [submoduloInstance: submoduloInstance]
    }

    def edit() {
        def submoduloInstance = Submodulo.get(params.id)
        if (!submoduloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'submodulo.label', default: 'Submodulo'), params.id])
            redirect(action: "list")
            return
        }

        [submoduloInstance: submoduloInstance]
    }

    def update() {
        def submoduloInstance = Submodulo.get(params.id)
        if (!submoduloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'submodulo.label', default: 'Submodulo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (submoduloInstance.version > version) {
                submoduloInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'submodulo.label', default: 'Submodulo')] as Object[],
                          "Another user has updated this Submodulo while you were editing")
                render(view: "edit", model: [submoduloInstance: submoduloInstance])
                return
            }
        }

        submoduloInstance.properties = params

        if (!submoduloInstance.save(flush: true)) {
            render(view: "edit", model: [submoduloInstance: submoduloInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'submodulo.label', default: 'Submodulo'), submoduloInstance.id])
        redirect(action: "show", id: submoduloInstance.id)
    }

    def delete() {
        def submoduloInstance = Submodulo.get(params.id)
        if (!submoduloInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'submodulo.label', default: 'Submodulo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            submoduloInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'submodulo.label', default: 'Submodulo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'submodulo.label', default: 'Submodulo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
