require 'spec_helper'

describe 'Toolbelt::Presenter' do
  class DummyPresenter < Toolbelt::Presenter
    def present
      true
    end

    protected

    def required_options
      {
        :object => 'required'
      }
    end
  end

  it_behaves_like 'an object with required options' do
    let(:callable) { DummyPresenter.present }
  end

  context 'when interacted with on the base class' do
    it 'raises an exception' do
      expect { Toolbelt::Presnter.present }
        .to raise_error { Toolbelt::OverrideInSubclassError }
    end
  end

  describe 'when properly overriden from a subclass' do
    subject { DummyPresenter.present(:object => 'mock') }
    it { should eq(true) }
  end
end
