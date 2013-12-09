class Phrase < ActiveRecord::Base
  attr_accessible :end_date, :label, :max_submissions, :numeric_format, :tasks_attributes, :start_date, :submissions_per_day, :task_averaging
  has_many :tasks, :dependent => :destroy
  belongs_to :challenge
  accepts_nested_attributes_for :tasks, :allow_destroy => true

  def phase_yaml
	yaml_phase_attr = Hash.new()
	self.attributes.each do |attr_name, attr_value|
		yaml_phase_attr[attr_name] = attr_value
	end
	yaml_task = Hash.new()
	self.tasks.each_with_index do |task, task_index|
		yaml_task[task_index + 1] = task.task_yaml if task.name != ''
    end
	yaml_phase_attr["tasks"] = yaml_task
	return yaml_phase_attr
  end
end