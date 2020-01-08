#Clase Menu
#Asignatura LPP
# Alumno : Adrián Tomás Herrera Darias
# Practica 10 : DSL
require 'spec_helper'

module Alimentos
	class Menu
		attr_accessor	:nombre,:descripcion,:componente,:precio,:total_kcal
	
	    def initialize(nombre, &block)
	    @nombre = nombre
	    @descripcion = ""
	    @componente = []
	    @precio =[]
	    @total_kcal=[]
	
		 if block_given?  
		      if block.arity == 1
			yield self
		      else
		       instance_eval(&block) 
		      end
		    end
  	    end
	    
		def descripcion(nombre,options = {})
			  descripcion = nombre
			  @descripcion << descripcion
		end
		
		def componente(name,options={})
			componente = name
			componente << " (#{options[:descripcion]})" if options[:descripcion]
			    componente << " (#{options[:precio]})" if options[:porcion]
			    componente << " (#{options[:gramos]})" if options[:gramos]
			    componente << " (#{options[:grasas]})" if options[:grasas]
			    componente << " (#{options[:carbohidratos]})" if options[:carbohidratos]
			    componente << " (#{options[:proteinas]})" if options[:proteinas]
			    componente << " (#{options[:c02]})" if options[:c02]
			    componente << " (#{options[:m2]})" if options[:m2]
			@componente << componente
		end

		def precio(nombre,options = {})
			  precio = nombre
			  @precio << precio
		end
		
		def to_s
		    output = @nombre
		    output << "\n#{'=' * @nombre.size}\n\n"
		    output << "descripcion: #{@descripcion}\n\n"
		    @componente.each do |i|
			output << "\n Descripcion:#{i[:descripcion]}"
			output << "\n Precio:#{i[:precio]}"
			output << "\n Gramos:#{i[:gramos]}"
			output << "\n Lipidos:#{i[:lipidos]}"
			output << "\n Carbohidratos#{i[:carbohidratos]}"
			output << "\n Proteinas:#{i[:proteinas]}"
			output << "\n C02:#{i[:c02]}"
			output << "\n M2:#{i[:m2]}"
			#@total_kcal= [i[:grasas]*9,i[:proteinas]*4,i[:carbohidratos]*4]
			#output << "\n Total Kcal: #{@total_kcal.inject{|i,sum| sum+i}}"
			
			
			end
			output<< " \n Precio:#{@precio}"
			 output		
	    	end

	   
	 
	


	end
end
