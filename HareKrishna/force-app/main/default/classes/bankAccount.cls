/*
    Account acc = new Account();
    System.debug('Balance after deposit:' + acc.deposit(45000));
    System.debug('Balance after deposit:' + acc.deposit(15000));
    System.debug('Balance after withdrawn:' + acc.withdraw(150000));

    -- Types of Classes ---
    1. final 
    2. virtual --> All methods in the virtual class should have the body
    3. abstract --> It can have methods with body or without body
*/
public virtual class bankAccount {
    
  @TestVisible protected  Integer balance=5000;

       //protected Integer balance=5000;

    public virtual Integer deposit(Integer amount){
        balance += amount ;//balance=balance+amount;
        return balance;
    }
    public Integer withdraw(Integer amount){
     try{
       if (amount>balance)
       throw new MyException('Insufficient Funds.');
        balance -= amount; //balance=balance-amount;
        }
        catch(MyException e) {
            System.debug('MyException: '+e.getMessage()+ ' in line number: '+e.getLineNumber());
        }
        return balance;
    }
}