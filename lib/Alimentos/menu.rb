#Clase Menu
#Asignatura LPP
# Alumno : Adrián Tomás Herrera Darias
# Practica 10 : DSL

module Alimentos
	Class Menu
		attr_accessor	:descripcion,:precio,:platos,:total_kcal
	
	  def initialize(descripcion, &block)
	    @descripcion = descripcion
	    @precio = []
	    @platos = []
	    @total_kcla=[]
	
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
	    @platos.each do
		output << "\n #{i[:descripcion]}"
		output << "\n #{i[:gramos]}"
		output << "\n #{i[:lipidos]}"
		output << "\n #{i[:carbohidratos]}"
		output << "\n #{i[:proteinas]}"
		output << "\n #{i[:vct]}"
		output << "\n #{i[:c02]}"
		output << "\n #{i[:m2]}"
		@total_kcal= [i[:grasas]*9,i[:proteinas]*4,i[:carbohidratos]*4]
		output << "\n Total Kcal: #{@total_kcal.inject{|i,sum| sum+i}}"
	end		
	    end

	    output
	 
	end


	end
end
