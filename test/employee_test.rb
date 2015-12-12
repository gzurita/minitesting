require 'minitest/autorun'
require './employee'

class EmployeeTest < Minitest::Test

  def setup
    @e = Employee.new("Juan", "Perez")
    @test_monday = DateTime.new(2016, 1, 4)
    @tuesday = DateTime.new(2016, 1, 5)
    @test_sunday = DateTime.new(2016, 1, 10)
  end

  def test_employee_has_initial_names
    assert @e.first_name == "Juan"
    assert @e.last_name == "Perez"
  end

  def test_create_assignment
    assert @e.number_of_assignments == 0, "Number of assignments != 0"
    
    @e.assign_to "Project 1", @test_monday, @test_sunday, 1.0
    
    assert @e.number_of_assignments == 1, "Number of assignments != 1"
    assert @e.get_assignment(0).project_name == "Project 1"
  end

  def test_exception_when_start_date_is_greater_than_end_date
    assert_raises Exception do
      @e.assign_to "Project 1", @test_monday + 7, @test_sunday, 1.0
    end
  end

  def test_assigment_starts_on_monday
    @e.assign_to "Project 1", @test_monday, @test_sunday, 1.0
    assert @e.number_of_assignments == 1

    
    assert_raises Exception do
      @e.assign_to "Project 1", @test_tuesday, @test_sunday, 1.0
    end
  end

  
  def test_assignment_end_on_sunday
    @e.assign_to "Project 1", @test_monday, @test_sunday, 1.0
    assert @e.number_of_assignments == 1

    assert_raises Exception do
      @e.assign_to "Project 1", @test_monday, @test_tuesday, 1.0
    end
  end


  def test_employee_knows_assignments_by_week
    week_number = @test_monday.strftime("%W")
    assert @e.assignments_for_week(week_number).length == 0
    
    @e.assign_to "Project 1", @test_monday, @test_sunday, 1.0
    assert @e.assignments_for_week(week_number).length == 1, "assignments_for_week != 1"
  end


end
