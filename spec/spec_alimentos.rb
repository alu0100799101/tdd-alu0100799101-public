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
	@alimento15 = Alimentos::Alimento.neW("Nuez",20.0,21.0,54.0,0.3,7.9)
	
	end
	
	describe "Atributos para alimento" do 
	     it "Existe un nombre para el alimento" do
           expect(@alimento1).to have_attributes(:nombre=>"Carne de Vaca")
	       expect(@alimento2).to have_attributes(:nombre=>"Carne de Cordero")     
         end
    end
end
