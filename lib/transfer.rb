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
        if x.balance > self.amount
          @valid_sender = true 
        end 
      end 
    
    BankAccount.all.select do |x|
      if x.name == self.receiver 
        if x.status == "open"
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
    
  

end
