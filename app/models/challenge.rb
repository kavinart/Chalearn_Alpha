class Challenge < ActiveRecord::Base
  attr_accessible :description, :end_time, :start_time, :title, :yamlformat, :webpages_attributes, :user_id, :timestamps
  has_many :webpages, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :webpages, :reject_if => lambda {|web| web[:web_content].blank? }, :allow_destroy => true
end
