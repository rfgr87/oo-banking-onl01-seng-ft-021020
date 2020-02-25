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
 
    
  def execute_transaction
    if self.status != "complete"
      if self.sender.balance > self.amount && self.sender.valid? && self.receiver.valid?
        self.receiver.balance += self.amount
        self.sender.balance -= self.amount
        self.status = "complete"
      else 
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end
  
  
  def reverse_transfer
    if self.status == "executed" && self.sender.valid? && self.receiver.valid?
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    else
      "Transaction wasn't executed"
    end
  end

end
