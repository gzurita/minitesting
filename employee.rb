require 'date'


class Employee

  attr_accessor :first_name
  attr_accessor :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @assignments = []
  end


  def assign_to project_name, start_date, end_date, percentage
    @assignments << Assignment.new(project_name, start_date, end_date, percentage)
  end

  def number_of_assignments
    @assignments.length
  end

  def get_assignment index
    @assignments[index]
  end

  def assignments_for_week week_number
    result = []
    result
  end

end



class Assignment

  attr_accessor :project_name
  attr_accessor :start_date
  attr_accessor :end_date
  attr_accessor :percentage
  
  def initialize project_name, start_date, end_date, percentage
    
    raise "Start date cannot be greater than End date" if start_date > end_date
    raise "Start date must be on Monday" if !start_date.monday?
    
    @project_name = project_name
    @start_date = start_date
    @end_date = end_date
    @percentage = percentage
  end

end