require'spec_helper.rb'

RSpec.describe Alimentos::PlatosN do
		before  :each do
		@la = Alimentos::Lista.new()
		@lg = Alimentos::Lista.new()
		@alimento1 = Alimentos::Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		@alimento2 = Alimentos::Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
		@alimento3 = Alimentos::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
		@plato1 = Alimentos::PlatosN.new("Primer Plato",@la,@lg,56)
		
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
			@la.push_back(@alimento1)
			@la.push_back(@alimento2)
			@la.push_back(@alimento3)
			expect(@la.n_nodos).to eq(3)
			expect(@plato1.(@la.pop_back.proteinas)).to eq()
			expect(@la.n_nodos).to eq(0)

		end
	
	end
end











