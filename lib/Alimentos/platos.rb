

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
		def suma_gramos
			@proteinas + @carbohidratos + @lipidos
		end
		def por_prote
			(@proteinas/suma_gramos)*100
		end
		def por_carbo
			(@carbohidratos/suma_gramos)*100
		end
		def por_lip
			(@lipidos/suma_gramos)*100
		end
	end

	
	class PlatosA < PlatosN

		def initialize(nombre , la ,lg , proteinas , carbohidratos , lipidos , vct , co2,m2)
			super(nombre , la ,lg , proteinas , carbohidratos , lipidos , vct)
			@co2 = co2
			@m2 = m2
	

		end
	end
end	
