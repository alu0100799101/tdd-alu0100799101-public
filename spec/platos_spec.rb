require'spec_helper.rb'

RSpec.describe Alimentos::PlatosN do
		before  :each do
		@alimento1 = Alimentos::Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		@alimento2 = Alimentos::Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
		@alimento3 = Alimentos::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
		@la = Alimentos::Lista.new(@alimento1,@alimento2,@alimento3)
		@lg = Alimentos::Lista.new(24.2,35,19.7)
		@plato1 = Alimentos::PlatosN.new("Primer Plato",@la,@lg)
		end









end
