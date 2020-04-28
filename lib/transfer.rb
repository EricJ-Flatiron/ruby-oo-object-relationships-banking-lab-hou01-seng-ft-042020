class Transfer
  
  @@all = []
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def reject
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def valid?
    #(BankAccount.get_acc_by_name(n1).valid? && BankAccount.get_acc_by_name(n2).valid?) ? true : false
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? && sender.balance > self.amount && self.status == "pending"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      reject
    end
  end
  

  def reverse_transfer
    if valid? && receiver.balance > self.amount && self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    else
      reject
    end
  end





end
