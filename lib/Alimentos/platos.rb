

module Alimentos
	class PlatosN
		attr_reader :nombre,:la,:lg , :proteinas , :carbohidratos , :lipidos , :vct
		def initialize(nombre , la ,lg , proteinas , carbohidratos , lipidos , vct)
		@nombre = nombre
		@lg = lg
		@la = la
		@proteinas = proteinas 
		@carbohidratos = carbohidratos
		@lipidos = lipidos
		@vct = vct
		end
	
	end


	class PlatosA < PlatosN

		def initialize()
	

		end
	end
end	
