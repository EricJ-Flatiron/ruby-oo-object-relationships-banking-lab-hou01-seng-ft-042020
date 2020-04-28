class BankAccount

    @@all = []
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status  = "open"
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(monies)
        self.balance += monies
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        self.balance > 0 && self.status == "open"
    end

    def close_account
        self.status = "closed"
    end

    def self.get_acc_by_name(n)
        @@all.find{|acc| acc.name == n}
    end
end
