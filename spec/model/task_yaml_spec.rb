require 'spec_helper'

describe Task do
	it 'should return task yaml' do
		i = Task.new 
		i.task_yaml.should be_kind_of(Hash)
	end
		
end