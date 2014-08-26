shared_examples_for 'an object with required options' do
  let(:validator) { double('hash_validator', :valid? => true) }

  it 'validates the options passed in against #required_options' do
    expect(HashValidator).to receive(:validate).and_return(validator)
    callable
  end

  it 'validates the options passed in against #required_options' do
    allow(HashValidator).to receive(:validate).and_return(validator)
    expect(validator).to receive(:valid?)
    callable
  end

  context 'when missing required options' do
    it 'raises an exception' do
      expect { callable }
        .to raise_error { Toolbelt::RequiredOptionsError }
    end
  end
end
