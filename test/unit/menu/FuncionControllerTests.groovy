package menu



import org.junit.*
import grails.test.mixin.*

@TestFor(FuncionController)
@Mock(Funcion)
class FuncionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/funcion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.funcionInstanceList.size() == 0
        assert model.funcionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.funcionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.funcionInstance != null
        assert view == '/funcion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/funcion/show/1'
        assert controller.flash.message != null
        assert Funcion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/funcion/list'


        populateValidParams(params)
        def funcion = new Funcion(params)

        assert funcion.save() != null

        params.id = funcion.id

        def model = controller.show()

        assert model.funcionInstance == funcion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/funcion/list'


        populateValidParams(params)
        def funcion = new Funcion(params)

        assert funcion.save() != null

        params.id = funcion.id

        def model = controller.edit()

        assert model.funcionInstance == funcion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/funcion/list'

        response.reset()


        populateValidParams(params)
        def funcion = new Funcion(params)

        assert funcion.save() != null

        // test invalid parameters in update
        params.id = funcion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/funcion/edit"
        assert model.funcionInstance != null

        funcion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/funcion/show/$funcion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        funcion.clearErrors()

        populateValidParams(params)
        params.id = funcion.id
        params.version = -1
        controller.update()

        assert view == "/funcion/edit"
        assert model.funcionInstance != null
        assert model.funcionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/funcion/list'

        response.reset()

        populateValidParams(params)
        def funcion = new Funcion(params)

        assert funcion.save() != null
        assert Funcion.count() == 1

        params.id = funcion.id

        controller.delete()

        assert Funcion.count() == 0
        assert Funcion.get(funcion.id) == null
        assert response.redirectedUrl == '/funcion/list'
    }
}
