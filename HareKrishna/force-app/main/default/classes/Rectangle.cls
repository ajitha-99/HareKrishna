/*
Top level must be either type public or global type
//object creation  
//classname objname=new constructor name();


Decimal result=rect.area();

system.debug ('Result:' + result);

Rectangle rect2=new Rectangle(10, 20);
system.debug ('Area:' + rect2.area());

//objectname.methodname(parameters/arguments)

system.debug ('Area:' + rect2.area(2,5));
system.debug ('Perimeter:' + rect2.perimeter());
    */
Public class Rectangle implements RectangleInterface{
    
    //class level variables
    @TestVisible Decimal Length=0,Breadth=0; //Default value is null
    
    //constructor executes automatically and only one time it is executed
    
    public Rectangle(){
        showResult();
    
    }
    //parameterised constructor
    Public Rectangle(Decimal Length,Decimal Breadth){
        this.length= length;
        this.breadth=breadth;
         showResult();
      }  
    
    //Method/Actions
    
    Public void showResult(){
        system.debug('Length:' + Length);
        system.debug('Breadth:' + Breadth);
        
        }
        
     public Decimal area() {
         return length*breadth;
         }  
        
        public Decimal area(Decimal len,Decimal brth) {
         return len*brth;
         } 

         public Integer area(Integer len,Integer brth) {
            return len*brth;
            } 

          public Decimal perimeter() {
         return 2*(length+breadth);
         } 
         public Decimal perimeter(Decimal length,Decimal breadth) {
            return 2*(length+breadth);
            } 
         
        }