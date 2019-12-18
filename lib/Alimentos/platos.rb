#Practica 8 Herencia 
#Practica 9 Programacion Fucional
#Asignatura: Lenguajes y Paradigma de La Programación
# Centro : Escuela Superior Ingenieria Informatica ULL
#@author Adrián Herrera Darias

module Alimentos
	#Modulo Comparable
	include Comparable 
	#Clase Plato Nutricional 
	class PlatosN
		#@return nombre del plato,lista alimentos,lista gramos, proteinas, carbohidratos , lipidos , valor calorico total, indice_impacto,precio
 
		attr_reader :nombre,:la,:lg , :proteinas , :carbohidratos , :lipidos , :vct , :indice_impacto , :precio
		def initialize (nombre , la ,lg , proteinas ,carbohidratos , lipidos , vct, indice_impacto, precio)
		@nombre = nombre
		@la = Alimentos::Lista.new()
		la.each{ |x| @la.push_back(x)}
		@lg = Alimentos::Lista.new()
		@proteinas = 0
		@carbohidratos = 0
		@lipidos = 0
		@vct = 0
		@indice_impacto = indice_impacto
		@precio=[]
		la.each do |x|
			@proteinas += x.proteinas
			@carbohidratos += x.carbohidratos
			@lipidos += x.lipidos
			@vct += x.totalkcal
		end
		
		end
		#Metodo obtener formateado el Plato
		def to_s
			 "( Nombre:#{@nombre}, Conjunto Alimentos: #{@la} ,Conjunto Gramos: #{@lg} ,Proteinas :#{@proteinas},Carbo :#{@carbohidratos},Lipidos :#{@lipidos},VCT :#{@vct} )"

		end
		
		#Metodo para obtener cantidad gramos de un plato
		def suma_gramos
			@proteinas + @carbohidratos + @lipidos
		end
		#Metodo para obtener la porcion de proteinas(gramos) de un plato
		def por_prote
			(@proteinas/suma_gramos)*100
		end
		#Meto obtener la porcion de carbohidratos de un plato
		def por_carbo
			(@carbohidratos/suma_gramos)*100
		end
		#Metodo obtener la porcion de Lipidos de un plato
		def por_lip
			(@lipidos/suma_gramos)*100
		end
		 # Método <=> del mixin Comparable
		def <=>(other)
		 indice_impacto <=> other.indice_impacto
		
		end
		 # Método + del mixin Comparable
		def + (other)
			precio + other.precio 
		end
		
		#Metodo Para Obtener la Huella Nutricional
		def huella_nutricional
		if( (indice_impacto == 1) && (vct < 670) && (suma_gramos < 800))
			huella_nutricional = 'Bajo'
		elsif( (indice_impacto == 2) && ((vct > 670) || (vct < 830)) && ((suma_gramos > 800) || (suma_gramos < 1200)))
			huella_nutricional = 'Regular'
		elsif( ( indice_impacto == 3) && (vct > 830 ) && (suma_gramos > 1200))
			huella_nutricional = 'Alta'
		end
			return huella_nutricional
		end

	end

	#Clase Plato Ambiental que hereda de Nutricional
	class PlatosA < PlatosN
		
		attr_reader :co2 , :m2

		def initialize(nombre , la ,lg , proteinas , carbohidratos , lipidos , vct, indice_impacto , precio, co2,m2)
			super(nombre , la ,lg , proteinas , carbohidratos , lipidos ,  vct , indice_impacto, precio)
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
