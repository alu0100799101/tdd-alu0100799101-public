require'spec_helper.rb'

RSpec.describe Alimentos::PlatosN do
		before  :each do
		@la = Alimentos::Lista.new()
		@lg = Alimentos::Lista.new()
		@alimento1 = Alimentos::Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		@alimento2 = Alimentos::Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
		@alimento3 = Alimentos::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
		@plato1 = Alimentos::PlatosN.new("Primer Plato",@la,@lg,19) 
               # Las cantidades de proteinas,glucidos,carbohidratos son calculados a mano multiplicando por 0.33 las proteinas/glucidos/carbohidratos y sumando cada alimento
		
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
			expect(@plato1.proteinas).to eq(19)

		end
		
	
	end
end











