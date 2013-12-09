require 'spec_helper'


describe Webpage do
	it 'should return webpage yaml url' do
		i = Webpage.new 
		i.title = 'HelloWorld'
		i.url = "http://google.com"
		i.is_external_url = true
		i.webpage_yaml.should == "http://google.com"
	end
	it 'should return internal webpage yaml' do
		i = Webpage.new 
		i.title = 'HelloWorld'
		i.is_external_url = false
		i.webpage_yaml.should == "helloworld.html"
	end
		
end