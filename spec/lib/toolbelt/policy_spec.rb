require 'spec_helper'

describe 'Toolbelt::Policy' do
  class ValidWidget < Toolbelt::Policy
    def pass?
      true
    end
  end

  describe '.pass?' do
    context 'when interacted with on the base class' do
      it 'raises an exception' do
        expect { Toolbelt::Policy.pass? }
          .to raise_error { Toolbelt::OverrideInSubclassError }
      end
    end

    describe 'when properly overriden from a subclass' do
      subject { ValidWidget.pass? }
      it { should eq(true) }
    end
  end

  describe '.fail?' do
    describe 'when properly overriden from a subclass' do
      let(:policy) { ValidWidget.new }

      it 'returns the opposite of #pass?' do
        expect(policy.fail?).to eq(!policy.pass?)
      end
    end
  end
end
