#Clase Menu
#Asignatura LPP
# Alumno : Adrián Tomás Herrera Darias
# Practica 10 : DSL

module Alimentos
	Class Menu
		attr_accessor	:descripcion,:precio
	
	  def initialize(descripcion, &block)
	    @descripcion = descripcion
	    @precio = []
	    

		if block_given?  
		      if block.arity == 1
			yield self
			      else
			       instance_eval(&block) 
			      end
			end
	  	end
	def to_s
	    output = @descripcion
	    output << "\n#{'=' * @descripcion.size}\n\n"
	    output << "precio: #{@precio.join(', ')}\n\n"
	    end

	    output
	 
	end


	end
end
