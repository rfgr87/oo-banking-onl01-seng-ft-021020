class Transfer

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end
  
  def valid?
    BankAccount.all.select do |x|
      if x.name == self.sender 
        if x.valid?
          @valid_sender = true 
        end 
      end 
    
    BankAccount.all.select do |x|
      if x.name == self.receiver 
        if x.valid?
          @valid_receiver = true 
        end 
      end 
    end
    if @valide_receiver == true && @valid_sender == true 
      true 
    else 
      false 
    end 
  end
    
  def execute_transaction
    BankAccount.all.select do |x|
      if x.name == self.sender
        if x.balance > self.amount
          x.balance -= @amount
        end
      end 
    end
    BankAccount.all.select do |x|
      if x.name == self.receiver
        x.balance += @amount
      end 
    end
    self.status = "executed"
  end
  
  def reverse_transfer
    BankAccount.all.select do |x|
      if x.name == self.receiver
        if x.balance > self.amount
          x.balance -= @amount
        end
      end 
    end
    BankAccount.all.select do |x|
      if x.name == self.sender
        x.balance += @amount
      end 
    end
  end
    

end
