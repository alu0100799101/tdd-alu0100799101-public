

module Alimentos
	include Comparable 
	class PlatosN
		attr_reader :nombre,:la,:lg , :proteinas , :carbohidratos , :lipidos , :vct , :indice_impacto
		def initialize (nombre , la ,lg , proteinas ,carbohidratos , lipidos , vct, indice_impacto )
		@nombre = nombre
		@la = Alimentos::Lista.new()
		la.each{ |x| @la.push_back(x)}
		@lg = Alimentos::Lista.new()
		@proteinas = 0
		@carbohidratos = 0
		@lipidos = 0
		@vct = 0
		@indice_impacto = indice_impacto
		la.each do |x|
			@proteinas += x.proteinas
			@carbohidratos += x.carbohidratos
			@lipidos += x.lipidos
			@vct += x.totalkcal
		end
		#@vct = vct
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
		def <=>(other)
		 indice_impacto <=> other.indice_impacto
		
		end
		def huella_nutricional
		if( (indice_impacto = 1) && (vct < 670) && (suma_gramos < 800))
			huella_nutricional = 'Bajo'
		elsif( (indice_impacto = 2) && ((vct > 670) || (vct < 830)) && ((suma_gramos > 800) || (suma_gramos < 1200)))
			huella_nutricional = 'Regular'
		elsif( ( indice_impacto = 3) && (vct > 830 ) && (suma_gramos > 1200))
			huella_nutricional = 'Alta'
		end
			return huella_nutricional
		end

	end

	
	class PlatosA < PlatosN
		
		attr_reader :co2 , :m2

		def initialize(nombre , la ,lg , proteinas , carbohidratos , lipidos , vct, indice_impacto , co2,m2)
			super(nombre , la ,lg , proteinas , carbohidratos , lipidos ,  vct , indice_impacto)
			@co2 = co2
			@m2 = m2
	

		end
		def to_s
			 "( Nombre:#{@nombre}, Conjunto Alimentos: #{@la} ,Conjunto Gramos: #{@lg} ,Proteinas :#{@proteinas},Carbo :#{@carbohidratos},Lipidos :#{@lipidos},VCT :#{@vct} , CO2 :#{@co2},M2 :#{@m2} )"

		end
		def <=>(other)
			proteinas <=> other.proteinas
		
		end
	end
end	
