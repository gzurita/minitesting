
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