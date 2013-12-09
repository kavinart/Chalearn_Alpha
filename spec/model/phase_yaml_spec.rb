require 'spec_helper'

describe Phrase do
	it 'should return phase yaml' do
		i = Phrase.new 
		i.phase_yaml.should be_kind_of(Hash)
	end
		
end