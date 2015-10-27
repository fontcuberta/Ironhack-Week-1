class Employee
  attr_reader :name

  def initialize name, email
    @name = name
    @email = email
  end

end

class HourlyEmployee < Employee
    def initialize name, email, hourly_rate, hours_worked
        super name, email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      @hourly_rate * @hours_worked
    end
end

class SalariedEmployee < Employee
  def initialize name, email, year_salary
    super name, email
    @year_salary = year_salary
  end

  def calculate_salary
    (@year_salary / 12) / 4
  end
end

class MultiPaymentEmployee < Employee
  def initialize name, email, year_salary, hourly_rate, hours_worked
    super(name, email)
    @year_salary = year_salary
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end

  def calculate_salary
    ((@year_salary / 12) / 4) + (@hourly_rate * @hours_worked)
  end
end

class Payroll
  def initialize employees
    @employees = employees
    @total_payroll = 0
    @output = {}
  end

  def calculate_total
    @employees.each do |e|
      @output[e.name] = e.calculate_salary
    end
    @output["total"] = @employees.reduce(0.0) { |sum, x| sum + (x.calculate_salary * 1.18) }
  end

  def pay_employees
    calculate_total
    @output.each do |name, salary|
      puts "#{name} -> #{salary.round(2)}"
    end
  end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'nizar@example.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
ruben = HourlyEmployee.new('Ruben', 'ruben@example.com', 15, 50)
gonzalo = HourlyEmployee.new('Gonzalo', 'gonzalo@example.com', 15, 50)

employees = [josh, nizar, ted, ruben, gonzalo]

payroll = Payroll.new(employees)
payroll.pay_employees
