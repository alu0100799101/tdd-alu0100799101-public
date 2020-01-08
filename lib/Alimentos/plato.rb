#DSL CLASS
module Alimentos
	class Plato
		attr_accessor :titulo,:nombre,:alimento

		def initialize(titulo, &block)
	   		@titulo = titulo
			@nombre = ""
			@alimento = []
			 if block_given?  
			      if block.arity == 1
				yield self
			      else
			       instance_eval(&block) 
			      end
			    end
  	      	end
		def nombre(titulo,options = {})
			  nombre = titulo
			  @nombre << nombre
		end
	    	def alimento(titulo,options ={})
			alimento = titulo
			alimento << " (#{options[:descripcion]})" if options[:descripcion]
			alimento << " (#{options[:gramos]})" if options[:gramos]
			@alimento << alimento 
		end
		def to_s
			output = @titulo
		    output << "\n#{'=' * @titulo.size}\n\n"
		    output << "Nombre: #{@nombre}\n\n"
		    @alimento.each do |i|
			output << "\n Descripcion:#{i[:descripcion]}"
			output << "\n Gramos:#{i[:gramos]}"
			end	
			output
		end
	end
end
