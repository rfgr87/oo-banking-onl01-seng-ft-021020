class BankAccount
  attr_accessor :name, :balance, :status
  
  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = 1000
    @status = status
  end
  
  def deposit(money)
    @balance += money
  end
  
end
