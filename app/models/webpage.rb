class Webpage < ActiveRecord::Base
  attr_accessible :title, :web_content
  belongs_to :challenge
end
