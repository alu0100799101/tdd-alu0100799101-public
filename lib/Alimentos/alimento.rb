#Practica6 Desarrollo Dirigido Por Pruebas
#Asignatura: Lenguajes y Paradigma de La Programación
# Centro : Escuela Superior Ingenieria Informatica ULL
#@author Adrián Herrera Darias
module Alimentos 
	#Clase Alimento
	class Alimento 
		#Modulo Comparable
		include Comparable
		# Constructor,Devuel el nombre,proteinas , carbohidratos,lipidos , gei(co2), uso terreno(m2)
		attr_reader :nombre, :proteinas , :carbohidratos , :lipidos, :gei , :terreno
		
		def initialize (nombre, proteinas, carbohidratos, lipidos, gei, terreno)

		@nombre = nombre
		@proteinas = proteinas
		@carbohidratos = carbohidratos
		@lipidos = lipidos
		@gei = gei
		@terreno = terreno

		end
		#Metodo obtener Alimento Formateado
		def to_s
   			"(Nombre:#{@nombre},Proteinas:#{@proteinas},Carbohidratos:#{@carbohidratos},Lipidos:#{@Lipidos},Gei:#{@gei},Terreno:#{@terreno})"
    		
		end
		#Metodo Calcular Kcal de las proteinas
		def kcalproteinas
			@proteinas * 4
		end
		#Metodo Calcular Kcal de los Lipidos
		def kcallipidos
			@lipidos * 9
		end
		#Metodo Calcular Kcal de los Glucidos
		def kcalglucidos
			@carbohidratos * 4
		end
		#Metodo calcula total kcal
	
		def totalkcal
			kcalproteinas + kcallipidos + kcalglucidos
		end
		#Metodo <=> mixin Comparable
		def <=>(other)
    			gei <=> other.gei 
  		end
	end
end
