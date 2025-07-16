@istest
  
  class testCalculation {
    

    static testmethod void caltest(){

        Calculation calc = new Calculation();
        calc.add(20,10);
        calc.substract(20,10);
        calc.multiply(20,10);
       // calc.divide(20,10);
        calc.divide(20,0);

        System.assertEquals(30,calc.add(20,10));

    }
}