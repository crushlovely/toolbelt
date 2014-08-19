require 'spec_helper'

describe 'Toolbelt::Service' do
  class CreateWidget < Toolbelt::Service
    def call
      true
    end

    protected

    def required_options
      {
        :object => 'required'
      }
    end
  end

  describe '.call' do
    context 'when interacted with on the base class' do
      it 'raises an exception' do
        expect { Toolbelt::Service.call }
          .to raise_error { Toolbelt::OverrideInSubclassError }
      end
    end

    describe 'when called with missing required options' do
      it 'raises an exception' do
        expect { CreateWidget.call }
          .to raise_error { Toolbelt::RequiredOptionsError }
      end
    end

    describe 'when properly overriden from a subclass' do
      subject { CreateWidget.call(:object => 'mock') }
      it { should eq(true) }
    end
  end
end
