class Task < ActiveRecord::Base
  attr_accessible :description, :name, :url
  belongs_to :phrase

  def task_yaml
  	yaml_task_attr = Hash.new()
    self.attributes.each do |attr_name, attr_value|
    	yaml_task_attr[attr_name] = attr_value
    end
    return yaml_task_attr
  end
end
