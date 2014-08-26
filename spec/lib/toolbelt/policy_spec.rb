require 'spec_helper'

describe 'Toolbelt::Policy' do
  class ValidWidgetPolicy < Toolbelt::Policy
    def pass?
      true
    end
  end

  class PassingStudentPolicy < Toolbelt::Policy
    def pass?
      true
    end

    protected

    def required_options
      {
        :grade => 'required'
      }
    end
  end

  it_behaves_like 'an object with required options' do
    let(:callable) { PassingStudentPolicy.pass? }
  end

  describe '.pass?' do
    context 'when interacted with on the base class' do
      it 'raises an exception' do
        expect { Toolbelt::Policy.pass? }
          .to raise_error { Toolbelt::OverrideInSubclassError }
      end
    end

    describe 'when properly overriden from a subclass' do
      subject { ValidWidgetPolicy.pass? }
      it { should eq(true) }
    end
  end

  describe '.fail?' do
    describe 'when properly overriden from a subclass' do
      let(:policy) { ValidWidgetPolicy.new }

      it 'returns the opposite of #pass?' do
        expect(policy.fail?).to eq(!policy.pass?)
      end
    end
  end
end
