require'spec_helper.rb'

RSpec.describe Alimentos::PlatosN do
		before  :each do
		@la = Alimentos::Lista.new()
		@lg = Alimentos::Lista.new()
		@alimento1 = Alimentos::Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		@alimento2 = Alimentos::Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
		@alimento3 = Alimentos::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
		@plato1 = Alimentos::PlatosN.new("Primer Plato",@la,@lg,4.21,13.13,42.7,419.1)
		@la.push_back(@alimento1)
		@la.push_back(@alimento2)
		@la.push_back(@alimento3)
		@lg.push_back([24.2,35,19.7])
               # Las cantidades de proteinas,glucidos,carbohidratos son calculados a mano sumando los gramos y dividiendolo por el porcentaje que se quiere obtener
		
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
			expect(@plato1.proteinas).to eq(4.21)

		end
		it ' Prueba porcentaje carbohidratos' do
			expect(@plato1.carbohidratos).to eq(13.13)
		end
		it ' Prueba porcentaje lipidos' do
			expect(@plato1.lipidos).to eq(42.7)
		

		end
		it ' Valor energetico total plato ' do
		
			expect(@plato1.vct).to eq(419.1)
		end
		it ' Prueba platos formateado ' do
		
		expect(@plato1.to_s) == " Nombre:Primer Plato, Conjunto Alimentos: #<Alimentos::Lista:0x000055989cb20d60> ,Conjunto Gramos: #<Alimentos::Lista:0x000055989cb20d38> ,Proteinas :4.21,Carbo :13.13,Lipidos :42.7,VCT :419.1 "

		end
		
	
	end
end











