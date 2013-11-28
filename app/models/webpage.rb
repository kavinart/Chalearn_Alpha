class Webpage < ActiveRecord::Base
  attr_accessible :title, :web_content, :is_external_url
  belongs_to :challenge
  
  def title_and_html_to_yaml
 	self.title + ': ' + self.title.downcase.gsub(/\s+/,"_") + '.html'
  end

end
