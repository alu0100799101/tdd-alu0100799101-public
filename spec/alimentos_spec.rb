require 'spec_helper'

RSpec.describe Alimentos::Alimento do 
	before :each do 
	@alimento1 = Alimentos::Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
	@alimento2 = Alimentos::Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
	@alimento3 = Alimentos::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
	@alimento4 = Alimentos::Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
	@alimento5 = Alimentos::Alimento.new("Salmón",19.9,0.0,13.6,6.0,3.7)
	@alimento6 = Alimentos::Alimento.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
	@alimento7 = Alimentos::Alimento.new("Pollo",20.6,0.0,5.6,5.7,7.1)
	@alimento8 = Alimentos::Alimento.new("Queso",25.0,1.3,33.0,11.0,41.0)
	@alimento9 = Alimentos::Alimento.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
	@alimento10 = Alimentos::Alimento.new("Leche Vaca",3.3,4.8,3.2,3.2,8.9)
	@alimento11 = Alimentos::Alimento.new("Huevos",13.0,1.1,11.0,4.2,5.7)
	@alimento12 = Alimentos::Alimento.new("Café",0.1,0.0,0.0,0.4,0.3)
	@alimento13 = Alimentos::Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
	@alimento14 = Alimentos::Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
	@alimento15 = Alimentos::Alimento.new("Nuez",20.0,21.0,54.0,0.3,7.9)
	
	@menu_hombre=[@alimento1,@alimento5,@alimento11]
	@menu_mujer=[@alimento4,@alimento8,@alimento10,@alimento13]
	
	end
	
	describe "Atributos para alimento" do
 
		 it "Existe un nombre para el alimento" do
			 expect(@alimento1).to have_attributes(:nombre=>"Carne de Vaca")
			 expect(@alimento2).to have_attributes(:nombre=>"Carne de Cordero")     
		 end
		
		it "Existe un gei para el alimento " do 
		    	expect(@alimento3).to have_attributes(:gei => 18 )
			expect(@alimento10).to have_attributes(:gei => 3.2)
		end
		it "Existe un ut para el alimento " do 
			expect(@alimento5).to have_attributes(:terreno => 3.7)
			expect(@alimento15).to have_attributes(:terreno => 7.9)
		end
		it "Prueba cantidad de terreno alimento" do
			expect(@alimento5.terreno).to eq(3.7)
			expect(@alimento10.terreno).to eq(8.9)
			
		end
		it "Prueba cantidad de gases(gei) " do
			expect(@alimento3.gei).to eq(18)
			expect(@alimento14.gei).to eq(0.4)
		end
		it "Prueba nombre " do
 		 	expect(@alimento9.nombre).to eq("Cerveza")
			expect(@alimento15.nombre).to eq("Nuez")
		end
		
		
		 it"Prueba para to_s" do
			expect(@alimento1.to_s) == ('Alimento: Nombre:Carne de Vaca, Proteinas:21.1 ,Carbohidratos: 0.0 , Lipidos:3.1 , GEI: 50 , Terreno: 164')
			expect(@alimento15.to_s) == ('Alimento: Nombre:Nuez, Proteinas:20 ,Carbohidratos: 21 , Lipidos: 54 , GEI: 0.3 , Terreno: 7.9')
		end
      end

	describe " Prubas para calcular kcal proteinas,lipidos y glucidos" do
		 it "Cantidad kcal proteinas " do
	
			expect(@alimento1.kcalproteinas).to eq(84.4)
			expect(@alimento7.kcalproteinas).to eq(82.4)
			expect(@alimento10.kcalproteinas).to eq(13.2)
			expect(@alimento13.kcalproteinas).to eq(32)
			
		end
		it"Cantidad kcal lipidos " do

			expect(@alimento2.kcallipidos).to eq(153)
			expect(@alimento4.kcallipidos).to eq(270)
			expect(@alimento6.kcallipidos.round(2)).to eq(56.7)
			expect(@alimento8.kcallipidos).to eq(297)
 
		end
		it"Cantidad kcal glucidos" do
		
			expect(@alimento3.kcalglucidos).to eq(6)
			expect(@alimento14.kcalglucidos).to eq(208)
			expect(@alimento9.kcalglucidos).to eq(14.4)
			expect(@alimento11.kcalglucidos).to eq(4.4)

		end
	
	end
	
	describe "Pruebas para calcular total kcal y saber si el menu con 54 gramos para hombre,41 gramos mujeres,llega a las 3000 kcal o 2300 kcal " do
		it "Prueba total kcal de los alimentos " do

			expect(@alimento1.totalkcal.round(2)).to eq(112.3)
			expect(@alimento10.totalkcal).to eq(61.2)
		
		end
		it "Prueba para un menu adecuado hombre 54 gr y 3000kcal " do

			menucalorias = @menu_hombre.map { |i| i.totalkcal }
			total_calorias = menucalorias.reduce(:+)
			expect(total_calorias <= 3000).to eq(true)
		end
		it "Menu adecuado para mujeres con proteinas 41 y menor igual  2300 kcal " do

			menucalorias = @menu_mujer.map { |i| i.totalkcal}
			total_calorias = menucalorias.reduce(:+)
			expect(total_calorias <= 2300).to eq(true)
		end


	end
	
	#Practica 8 Comparacion de alimentos 
	describe "Pruebas para Comparar alimentos " do
		it "Se comparan correctamente los alimentos"do
		        expect(@alimento1 > @alimento2).to eq(true)
		        expect(@alimento1 < @alimento2).to eq(false)
		        expect(@alimento1 == @alimento2).to eq(false)
			expect(@alimento1 <= @alimento2).to eq(false)
			 expect(@alimento1 >= @alimento2).to eq(true)
		         expect(@alimento3 > @alimento4).to eq(true)
		        expect(@alimento3 < @alimento4).to eq(false)
		        expect(@alimento3 == @alimento4).to eq(false)
			expect(@alimento3 >= @alimento4).to eq(true)
		        expect(@alimento3 <= @alimento4).to eq(false)
           	 end
		it "Un alimento esta entre dos alimentos " do
			expect(@alimento13.between?(@alimento1 , @alimento15)).to eq(false)
		end
	
		


	end
end
