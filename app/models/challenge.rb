class Challenge < ActiveRecord::Base
  attr_accessible :description, :end_time, :start_time, :title, :yamlformat, :webpages_attributes, :phrases_attributes, :user_id, :timestamps
  has_many :webpages, :dependent => :destroy
  has_many :phrases, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :webpages, :allow_destroy => true
  accepts_nested_attributes_for :phrases, :allow_destroy => true
end
