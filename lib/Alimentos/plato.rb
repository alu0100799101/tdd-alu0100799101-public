#DSL CLASS
Module Alimentos
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
	    
	end
end
