class BankAccount
  @@all = []
  attr_accessor :name, :balance, :status
  
  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = 1000
    @status = status
    @@all << self
  end
  
  def deposit(money)
    @balance += money
  end
  
  def display_balance
    @balance
  end
  
  def valid?
    if @balance > 0 && @status == "open"
      true 
    else 
      false 
    end
  end
  
  def close_account
    @status = "closed"
  end
  
  
      
  
end
