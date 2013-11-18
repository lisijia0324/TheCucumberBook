module KnowsTheDomain 
  class UserInterface
    
    include Capybara::DSL

    def withdras_from(account, amount)
      Sinatra::Application.account = account
      visit '/'
      fill_in 'Amount', :with => amount
      click_button 'Withdraw'
    end
  end
  
  def my_account
    @my_account ||= Account.new
  end
  def cash_slot
    @cash_slot ||= CashSlot.new
  end
  def teller
    @teller ||= Teller.new(cash_slot)
  end 
  
  def cash_slot 
    Sinatra::Application.cash_slot
  end
  
  def teller
    @teller ||= UserInterface.new
  end
end

World(KnowTheUserInterface)