require 'docking_station'


describe Bike do
  subject(:bike) { described_class.new }
  it 'responds to broken?' do
      expect(bike).to respond_to :broken?
  end

  it '#report_broken logs bike is broken' do
    expect(bike).to_not be_broken
    bike.report_broken
    expect(bike).to be_broken
  end
end
