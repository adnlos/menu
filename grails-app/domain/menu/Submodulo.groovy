package menu

class Submodulo {

	String nombre
	String url
	String posicion
	static belongsTo=[modulo: Modulo]
	String estado
	static hasMany=[funciones: Funcion]
	Boolean imagen
    static constraints = {
    	nombre blank:false
    	estado blank:false, inList:["Activo", "Inactivo"]
    }
    
    String toString(){
    	return "Submodulo: ${nombre}"
    }
}
