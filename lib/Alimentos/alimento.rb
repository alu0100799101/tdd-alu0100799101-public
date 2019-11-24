module Alimentos 
	class Alimento 
		include Comparable,Enumerable
		attr_reader :nombre, :proteinas , :carbohidratos , :lipidos, :gei , :terreno
		
		def initialize (nombre, proteinas, carbohidratos, lipidos, gei, terreno)

		@nombre = nombre
		@proteinas = proteinas
		@carbohidratos = carbohidratos
		@lipidos = lipidos
		@gei = gei
		@terreno = terreno

		end
		
		def to_s
   			"(Nombre:#{@nombre},Proteinas:#{@proteinas},Carbohidratos:#{@carbohidratos},Lipidos:#{@Lipidos},Gei:#{@gei},Terreno:#{@terreno})"
    		
		end
	
		def kcalproteinas
			@proteinas * 4
		end
	
		def kcallipidos
			@lipidos * 9
		end
	
		def kcalglucidos
			@carbohidratos * 4
		end
	
		def totalkcal
			kcalproteinas + kcallipidos + kcalglucidos
		end
			
		def <=>(other)
    			gei <=> other.gei 
  		end
	end
end
