require 'spec_helper'

describe User do
	it 'should return role correctly' do
		i = User.new 
		i.role == 'organizer'
		i.organizer? == true
	end
		
end