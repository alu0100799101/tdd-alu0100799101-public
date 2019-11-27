

module Alimentos
	class PlatosN
		attr_reader :nombre,:la,:lg , :proteinas
		def initialize(nombre , la ,lg , proteinas)
		@nombre = nombre
		@lg = lg
		@la = la
		@proteinas = proteinas 
		end
	
	end


	class PlatosA < PlatosN

		def initialize()
	

		end
	end
end	
