require 'garage'

describe Garage do 

	it { is_expected.to respond_to(:dock).with(1).argument }
	
	it { is_expected.to respond_to(:release_bikes) }

end