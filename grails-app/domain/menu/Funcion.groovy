package menu

class Funcion {

	String nombre
	String url
	String posicion
	static belongsTo = [submodulo: Submodulo]
	String estado

    static constraints = {
    	nombre blank:false
    	estado blank:false, inList:["Activo", "Inactivo"]
    }

    String toString(){
    	return "Funcion: ${nombre}"
    }
    
}
