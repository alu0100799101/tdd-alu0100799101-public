#Clase Menu
#Asignatura LPP
# Alumno : Adrián Tomás Herrera Darias
# Practica 10 : DSL

module Alimentos
	Class Menu
		attr_accessor	:descripcion,:precio
	
	  def initialize(name, &block)
	    @name = name
	    @precio = []
	    

		if block_given?  
		      if block.arity == 1
			yield self
			      else
			       instance_eval(&block) 
			      end
			end
	  	end


	end
end
