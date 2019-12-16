require'spec_helper.rb'

RSpec.describe Alimentos::PlatosN do 
		before  :each do
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
		
		@plato1 = Alimentos::PlatosN.new("Primer Plato",[@alimento1,@alimento2,@alimento3],[24.2,35,19.7],0,0,0,0,1)
		@plato2 = Alimentos::PlatosN.new("Queso con Tofu y chocolate",[@alimento5,@alimento13,@alimento4],[33.5,14.7,82.3],0,0,0,0,2)
		@plato3 = Alimentos::PlatosN.new("Parrillada",[@alimento1,@alimento2,@alimento6,@alimento7],[24.2,35,27.8,26.2],0,0,0,0,1)
		@menu1 = [@plato1,@plato2,@plato3]
		#lg.push_back([24.2,35,19.7])
               
		
		end
	describe ' Pruebas para PlatoNutricional' do
		it 'Pruebas para el nombre del plato' do
			expect(@plato1.nombre).to eq("Primer Plato")
			expect(@plato1).to have_attributes(:nombre => "Primer Plato")
		
		end
		it ' Prueba Existe conjunto de alimentos ' do
			
			expect(@plato1).to respond_to(:la)
			
            	end
		it ' Prueba Existe conjunto de alimentos ' do
			expect(@plato1).to respond_to(:lg)
			
		end
		it ' Prueba Porcentaje de Proteinas' do
			expect(@plato1.por_prote.round(2)).to eq(71.86)

		end
		it ' Prueba porcentaje carbohidratos' do
			expect(@plato1.por_carbo.round(2)).to eq(1.9)
		end
		it ' Prueba porcentaje lipidos' do
			expect(@plato1.por_lip.round(2)).to eq(26.24)
		

		end
		it ' Valor energetico total plato ' do
		
			expect(@plato1.vct).to eq(419.1)
			expect(@plato2.vct).to eq(764.0)
			expect(@plato3.vct).to eq(612.8)
		end
		it ' Prueba platos formateado ' do
		
		expect(@plato1.to_s) == " Nombre:Primer Plato, Conjunto Alimentos: #<Alimentos::Lista:0x000055989cb20d60> ,Conjunto Gramos: #<Alimentos::Lista:0x000055989cb20d38> ,Proteinas :58.88,Carbo :1.56,Lipidos :39.56,VCT :419.1 "

		end
	end
	describe ' Pruebas herencia y PlatosAmbientales ' do
		before :all do 
		
			@alimento4 = Alimentos::Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
			@alimento5 = Alimentos::Alimento.new("Salmón",19.9,0.0,13.6,6.0,3.7)
			@alimento6 = Alimentos::Alimento.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
			@platoambiental1 = Alimentos::PlatosA.new("Primer plato",[@alimento4,@alimento5,@alimento6],[82.3,33.5,27.8],46.7,47,49.9,823.9000000000001,1,88,351)
			
		#@platoambiental2 = Alimentos::PlantosA.new("Segundo Plato",)
			end
		it ' Pruebas para comprobar laclasede un objeto, eltipode un objeto y supertenecia a una jerarquia' do
				expect(@platoambiental1).to be_instance_of(Alimentos::PlatosA)
				expect(@platoambiental1.class).to eq(Alimentos::PlatosA)
				 expect(Alimentos::PlatosA.superclass).to eq(Alimentos::PlatosN)
		   		 expect(Alimentos::PlatosA.superclass.superclass).to eq(Object)
		   		 expect(Alimentos::PlatosA.superclass.superclass.superclass).to eq(BasicObject)

				expect(@platoambiental1.respond_to?(:por_prote))
		end
		it 'Prueba C02 platoambietal' do
		
			expect(@platoambiental1.co2).to eq(88)
		end	

		it ' Prueba m2 Plato Ambiental' do

			expect(@platoambiental1.m2).to eq(351)
		end
		it ' Formateo Platos Ambietales ' do
			expect(@platoambiental1.to_s) == "( Nombre:Primer plato, Conjunto Alimentos: #<Alimentos::Lista:0x00005560d9b50b50> ,Conjunto Gramos: ...5560d9b50808> ,Proteinas :46.7,Carbo :47.0,Lipidos :49.9,VCT :823.9000000000001 , CO2 :88,M2 :351 )"

		end
	end
	describe ' Dietas' do
		
	
		it' Pruebas Comparables entre platos 'do
		 #expect(@plato1 > @platoambiental1).to eq(true)
		       # expect(@platoambiental1 < @plato1).to eq(false)
		       # expect(@plato1 == @platoambiental1).to eq(false)
		
	

		end


	end
	describe 'Pruebas Practica 10 ' do
		it ' Prueba huella nutricional de los platos ' do
			expect(@plato2.huella_nutricional).to eq('Regular')
		end
		it ' Prueba max huella nutricional ' do
		expect(@menu1).to respond_to(:max)
		expect(@menu1.max).to eq(@plato2)
		end
		it'Prueba precio menu 1 ' do
		precio_menu = @menu1.map{|i| @menu1.precio}
		total_menu = precio_menu.reduce(:+)
           	 precio_plato = @plato1.precio
            	 precio_plato = precio_plato * 0.10
            	expect(precio_menu >= precio_plato).to eq(true)

			
		end

	

	end


	
end











