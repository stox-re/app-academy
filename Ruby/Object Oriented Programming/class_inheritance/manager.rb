require_relative "./employee.rb"

class Manager < Employee
  def initialize(employees, salary)
    @employees = employees
    super(salary)
  end

  def bonus(multiplier)
    sum = 0
    @employees.each do |employee|
      sum += employee.salary
    end
    sum * multiplier
  end
end

david = Employee.new(10000)
shawna = Employee.new(12000)
darren = Manager.new([david, shawna], 78000)
ned = Manager.new([darren, shawna, david], 1000000)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
