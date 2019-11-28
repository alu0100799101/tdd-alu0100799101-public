require'spec_helper.rb'

RSpec.describe Alimentos::PlatosN do
		before  :each do
		@la = Alimentos::Lista.new()
		@lg = Alimentos::Lista.new()
		@alimento1 = Alimentos::Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		@alimento2 = Alimentos::Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
		@alimento3 = Alimentos::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
		@plato1 = Alimentos::PlatosN.new("Primer Plato",@la,@lg,56.7,1.5,38.1,419.1)
		@la.push_back(@alimento1)
		@la.push_back(@alimento2)
		@la.push_back(@alimento3)
		@lg.push_back([24.2,35,19.7])
               
		
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
			expect(@plato1.por_prote.round(2)).to eq(58.88)

		end
		it ' Prueba porcentaje carbohidratos' do
			expect(@plato1.por_carbo.round(2)).to eq(1.56)
		end
		it ' Prueba porcentaje lipidos' do
			expect(@plato1.por_lip.round(2)).to eq(39.56)
		

		end
		it ' Valor energetico total plato ' do
		
			expect(@plato1.vct).to eq(419.1)
		end
		it ' Prueba platos formateado ' do
		
		expect(@plato1.to_s) == " Nombre:Primer Plato, Conjunto Alimentos: #<Alimentos::Lista:0x000055989cb20d60> ,Conjunto Gramos: #<Alimentos::Lista:0x000055989cb20d38> ,Proteinas :58.88,Carbo :1.56,Lipidos :39.56,VCT :419.1 "

		end
	end
	describe ' Pruebas herencia y PlatosAmbientales ' do
		before :all do 
			@la2 = Alimentos::Lista.new()
			@lg2 = Alimentos::Lista.new()
			@platoambiental1 = Alimentos::PlatosA.new("Primer Plato",@la2,@lg2,56.7,1.5,38.1,419.1,88,351)
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





	end
end











