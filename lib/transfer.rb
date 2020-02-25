class Transfer

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end
  
  def sender
    @sender
  end
  
  def receiver
    @receiver
  end
  
  def status
    @status
  end
  
  def status=(status)
    @status = status
  end
    
  
  def amount
    @amount
  end
  
  def valid?
   if self.sender.valid? && self.receiver.valid?
     true
   else
     false
   end
 end
   
    # BankAccount.all.select do |x|
    #   if x.name == self.sender 
    #     if x.valid?
    #       @valid_sender = true
    #     else 
    #       @valid_sender = false
    #     end 
    #   end
    # end
    
    # BankAccount.all.select do |x|
    #   if x.name == self.receiver 
    #     if x.valid?
    #       @valid_receiver = true 
    #     else 
    #       @valid_receiver = false
    #     end 
    #   end 
    # end
    # if @valide_receiver == true && @valid_sender == true 
    #   return true 
    # else 
    #   return false 
    # end 
    
  def execute_transaction
    if self.sender.balance > self.amount
      self.receiver.balance += self.amount
      self.status = "executed"
    else 
      "Transaction rejected. Please check your account balance."
    end
  end
    
    # BankAccount.all.select do |x|
    #   if x.name == self.sender
    #     if x.balance > self.amount
    #       x.balance -= @amount
    #       self.status = "executed"
    #       return "Transaction was executed"
    #     else 
    #       return "Transaction rejected. Please check your account balance."
    #     end
    #   end 
    # end
    # BankAccount.all.select do |x|
    #   if x.name == self.receiver
    #     x.balance += @amount
    #   end 
    # end
  
  def reverse_transfer
    if self.status == "executed"
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

end
