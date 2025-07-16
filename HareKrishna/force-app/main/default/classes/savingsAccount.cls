public  class savingsAccount extends bankAccount{

    public override Integer deposit(Integer amount){
        balance += amount ;//balance=balance+amount;
        return balance;
    }
    
}