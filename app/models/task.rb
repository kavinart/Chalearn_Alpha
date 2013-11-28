class Task < ActiveRecord::Base
  attr_accessible :description, :name, :url
  belongs_to :phrase
end
