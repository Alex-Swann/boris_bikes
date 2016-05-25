require 'docking_station'
require 'bike'


describe DockingStation do

  bike = Bike.new
  it 'needs to be working' do
    expect(bike.respond_to?(:working?)).to eq true
  end

  it 'shows bikes' do
    expect(subject.bikes.class).to eq Fixnum
  end

  it 'needs to release bike' do
    expect(subject.respond_to?(:release_bike)).to eq true
  end

    it 'releases a working bike' do
      subject.dock(1)
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'should dock bike' do
      expect(subject.dock(1)).to be_an_instance_of(Bike)
    end

    it "doesn't release a bike if station empty" do
      expect{subject.release_bike}.to raise_error 'No bikes available!'
    end

    it "doesn't allow more bikes to be added beyond capacity" do
      subject.dock(1)
      expect{subject.dock(1)}.to raise_error "Dock station at capacity!"
    end
end
