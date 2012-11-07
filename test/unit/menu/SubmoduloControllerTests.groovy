package menu



import org.junit.*
import grails.test.mixin.*

@TestFor(SubmoduloController)
@Mock(Submodulo)
class SubmoduloControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/submodulo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.submoduloInstanceList.size() == 0
        assert model.submoduloInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.submoduloInstance != null
    }

    void testSave() {
        controller.save()

        assert model.submoduloInstance != null
        assert view == '/submodulo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/submodulo/show/1'
        assert controller.flash.message != null
        assert Submodulo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/submodulo/list'


        populateValidParams(params)
        def submodulo = new Submodulo(params)

        assert submodulo.save() != null

        params.id = submodulo.id

        def model = controller.show()

        assert model.submoduloInstance == submodulo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/submodulo/list'


        populateValidParams(params)
        def submodulo = new Submodulo(params)

        assert submodulo.save() != null

        params.id = submodulo.id

        def model = controller.edit()

        assert model.submoduloInstance == submodulo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/submodulo/list'

        response.reset()


        populateValidParams(params)
        def submodulo = new Submodulo(params)

        assert submodulo.save() != null

        // test invalid parameters in update
        params.id = submodulo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/submodulo/edit"
        assert model.submoduloInstance != null

        submodulo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/submodulo/show/$submodulo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        submodulo.clearErrors()

        populateValidParams(params)
        params.id = submodulo.id
        params.version = -1
        controller.update()

        assert view == "/submodulo/edit"
        assert model.submoduloInstance != null
        assert model.submoduloInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/submodulo/list'

        response.reset()

        populateValidParams(params)
        def submodulo = new Submodulo(params)

        assert submodulo.save() != null
        assert Submodulo.count() == 1

        params.id = submodulo.id

        controller.delete()

        assert Submodulo.count() == 0
        assert Submodulo.get(submodulo.id) == null
        assert response.redirectedUrl == '/submodulo/list'
    }
}
