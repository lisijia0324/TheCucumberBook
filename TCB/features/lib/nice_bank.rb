set :cash_slot, CashSlot.new 
set :account do
  fail 'account has not been set' 
end

require_relative 'transaction_queue' 
require_relative 'balance_store'

post '/withdraw' do
  teller = Teller.new(settings.cash_slot) 
  teller.withdraw_from(settings.account, params[:amount].to_i)
end

class Teller
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end
  def withdraw_from(account, amount)
    account.debit(amount)
    @cash_slot.dispense(amount)
  end 
end

class Account 

  def initialize
    @queue = TransactionQueue.new 
    @balance_store = BalanceStore.new
  end
  
  def balance 
    @balance_store.balance
  end
  
  def credit(amount) 
    @queue.write("+#{amount}")
  end
  
  def debit(amount) 
    @queue.write("-#{amount}")
  end
  
end
