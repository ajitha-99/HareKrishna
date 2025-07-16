/*
    Calculation calc = new Calculation();
    System.debug('Add Result: '+calc.add(20, 10));
    System.debug('Substract Result: '+calc.substract(20, 10));
    System.debug('Multiplication Result: '+calc.multiply(20, 10));
    System.debug('Division Result: '+calc.divide(20, 0));
*/
public class Calculation {

    //public calculation(){
      //  system.debug(listusage.count);
        
    //}
  
    public Integer add(Integer num1, Integer num2) {
        return num1 + num2;
    }
    
    public Integer substract(Integer num1, Integer num2) {
        return num1 - num2;
    }
    
    public Integer multiply(Integer num1, Integer num2) {
        return num1 * num2;
    }
    
    public Integer divide(Integer num1, Integer num2) {
        try {
          return num1 / num2;
        }
        catch(Exception e) {
            System.debug('Exception: '+e.getMessage()+' in line number:'+e.getLineNumber());
        }
        return null;
    }
}