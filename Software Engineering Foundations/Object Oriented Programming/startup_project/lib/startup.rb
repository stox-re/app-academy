require_relative "./employee.rb"

class Startup
    attr_accessor :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "ERR: Title is invalid"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        current_pay_required = @salaries[employee.title]
        if @funding >= current_pay_required
            employee.pay(current_pay_required)
            @funding -= current_pay_required
        else
             raise "ERR: Funding insufficient"
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |key, value|
            if !@salaries.has_key?(key)
                @salaries[key] = value
            end
        end
        startup.employees.each do |startup_employee|
            @employees.push(startup_employee)
        end
        startup.close
    end
end
