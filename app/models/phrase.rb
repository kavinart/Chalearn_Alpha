class Phrase < ActiveRecord::Base
  attr_accessible :end_date, :label, :max_submissions, :numeric_format, :tasks_attributes, :start_date, :submissions_per_day, :task_averaging
  has_many :tasks, :dependent => :destroy
  belongs_to :challenge
  accepts_nested_attributes_for :tasks, :allow_destroy => true
end