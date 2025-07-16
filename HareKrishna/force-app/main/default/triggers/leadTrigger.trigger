trigger leadTrigger on lead (before insert,before update) {
    for(lead le : trigger.new){
        le.FirstName = 'Dr.'+ le.FirstName;
    }

}