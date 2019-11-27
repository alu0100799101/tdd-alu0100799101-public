require'spec_helper.rb'

RSpec.describe Alimentos::PlatosN do
		before  :each do
		@la = Alimentos::Lista.new()
		@lg = Alimentos::Lista.new()
		@plato1 = Alimentos::PlatosN.new("Primer Plato",@la,@lg)
		end
	describe ' Pruebas para PlatoNutricional' do
		it 'Pruebas para el nombre del plato' do
			expect(@plato1.nombre).to eq("Primer Plato")
			expect(@plato1).to have_attributes(:nombre => "Primer Plato")
		
		end
	
	
	end









end
