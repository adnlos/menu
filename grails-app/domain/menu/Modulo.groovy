package menu

class Modulo {

	String nombre
	String url
	String posicion
	String estado
	Boolean imagen
	static hasMany = [submodulos: Submodulo]

    static constraints = {
    	nombre blank:false
    	estado blank:false, inList:["Activo", "Inactivo"]
    }

    String toString(){
    	return "Modulo: ${nombre}"
    }
}
