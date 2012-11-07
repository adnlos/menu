package menu



import org.junit.*
import grails.test.mixin.*

@TestFor(ModuloController)
@Mock(Modulo)
class ModuloControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/modulo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.moduloInstanceList.size() == 0
        assert model.moduloInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.moduloInstance != null
    }

    void testSave() {
        controller.save()

        assert model.moduloInstance != null
        assert view == '/modulo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/modulo/show/1'
        assert controller.flash.message != null
        assert Modulo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/modulo/list'


        populateValidParams(params)
        def modulo = new Modulo(params)

        assert modulo.save() != null

        params.id = modulo.id

        def model = controller.show()

        assert model.moduloInstance == modulo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/modulo/list'


        populateValidParams(params)
        def modulo = new Modulo(params)

        assert modulo.save() != null

        params.id = modulo.id

        def model = controller.edit()

        assert model.moduloInstance == modulo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/modulo/list'

        response.reset()


        populateValidParams(params)
        def modulo = new Modulo(params)

        assert modulo.save() != null

        // test invalid parameters in update
        params.id = modulo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/modulo/edit"
        assert model.moduloInstance != null

        modulo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/modulo/show/$modulo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        modulo.clearErrors()

        populateValidParams(params)
        params.id = modulo.id
        params.version = -1
        controller.update()

        assert view == "/modulo/edit"
        assert model.moduloInstance != null
        assert model.moduloInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/modulo/list'

        response.reset()

        populateValidParams(params)
        def modulo = new Modulo(params)

        assert modulo.save() != null
        assert Modulo.count() == 1

        params.id = modulo.id

        controller.delete()

        assert Modulo.count() == 0
        assert Modulo.get(modulo.id) == null
        assert response.redirectedUrl == '/modulo/list'
    }
}
