//Top level must be either public or global

// BMI Class 
/*
    // Object Creation
    Bmi bmiObj = new Bmi(5.7, 67);
    bmiObj.showResult();
    System.debug('BMI: '+bmiObj.getBmi());
*/


public class Bmi{

//class variables
   Decimal height,weight;
   
 //constructor
 
 Public Bmi(){
  height=weight=0;
  }
   // parameterised constructor
   
   Public bmi(Decimal height,Decimal Weight){
       this.height=height;
       this.weight=weight;
       }
  //methods/actions
  
  Public void showBmiResult(){
   system.debug('weight:' + weight);
   system.debug('height:' + height);
   }
   
   Public decimal getBmi(){
       return weight/ (height*height);
      } 
   }