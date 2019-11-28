

module Alimentos
	class PlatosN
		attr_reader :nombre,:la,:lg , :proteinas , :carbohidratos , :lipidos , :vct
		def initialize(nombre , la ,lg , proteinas , carbohidratos , lipidos , vct)
		@nombre = nombre
		@la = la
		@lg = lg
		@proteinas = proteinas 
		@carbohidratos = carbohidratos
		@lipidos = lipidos
		@vct = vct
		end
		def to_s
			 "( Nombre:#{@nombre}, Conjunto Alimentos: #{@la} ,Conjunto Gramos: #{@lg} ,Proteinas :#{@proteinas},Carbo :#{@carbohidratos},Lipidos :#{@lipidos},VCT :#{@vct} )"

		end
	end

	
	class PlatosA < PlatosN

		def initialize()
	

		end
	end
end	
