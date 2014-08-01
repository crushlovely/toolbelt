require 'spec_helper'

describe 'Toolbelt::VERSION' do
  it 'should be the correct version' do
    expect(Toolbelt::VERSION).to eq('0.0.1.pre')
  end
end
