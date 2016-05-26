require 'van'

describe Van do
  
  it '#load_bikes' do
    expect(Van.new.load_bikes).to be_an_instance_of Array
  end


end