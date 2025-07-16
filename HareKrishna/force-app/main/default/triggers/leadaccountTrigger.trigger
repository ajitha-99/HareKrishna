trigger leadaccountTrigger on Lead (after insert){
   List<Lead> leads = [select Leadsource,Rating from Lead where Leadsource='Local'];
       
}