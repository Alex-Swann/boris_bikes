require 'garage'

describe Garage do
  
  it '#fix_bikes' do
    expect(Garage.new.fix_bikes).to be_an_instance_of Array
  end

  end