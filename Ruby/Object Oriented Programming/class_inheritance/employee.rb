class Employee
  attr_reader :salary

  def initialize(salary)
    @salary = salary
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end