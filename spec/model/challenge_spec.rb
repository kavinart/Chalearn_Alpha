require 'spec_helper'

describe Challenge do
	it 'should return phase yaml' do
		@fake_zip = double('zip')
		@fake_zip.stub(:add)

		@fake_zip_list = [@fake_zip, @fake_zip]

		Zip::File.stub(:open).and_return(@fake_zip_list)

		i = Challenge.new 
		web = Webpage.new
		web.title = ""
		i.appendWebpage(web,@fake_zip).should == false

		j = Challenge.new 
		web = Webpage.new
		web.title = "NotEmpty"
		i.appendWebpage(web,@fake_zip).should == true
	end
		
end