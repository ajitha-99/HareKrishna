@istest

class teestBmi {

     static testmethod void bmiUnit(){
        Bmi bmiObj = new Bmi();
 
        bmiObj.showBmiResult();
        
         Bmi bmiObj1 = new Bmi(5.8,65);
        

system.debug('getbmi:'+ bmiObj1.getbmi());
     }
  
}