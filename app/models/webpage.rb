class Webpage < ActiveRecord::Base
  attr_accessible :title, :web_content, :url, :is_external_url
  belongs_to :challenge
  
end
