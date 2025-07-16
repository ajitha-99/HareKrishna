@istest

 class Test1 {

static testMethod void rectUnit1(){
    Rectangle rect = new Rectangle();
    System.assertEquals(0,rect.Length);
    System.assertEquals(0,rect.Breadth);

    System.assertEquals(0,rect.area());
    System.assertEquals(200,rect.area(10,20));
 
    System.assertEquals(0,rect.perimeter());
    

    Rectangle rect2=new Rectangle(5,10.5);  
    System.assertEquals(5,rect.Length);
    System.assertEquals(10.5,rect.Breadth);

    System.assertEquals(52.5,rect.area());
    System.assertEquals(31,rect2.perimeter());
}
    
}