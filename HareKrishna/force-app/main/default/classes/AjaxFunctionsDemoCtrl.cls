public with sharing class AjaxFunctionsDemoCtrl {

    public string selVal {get;set;}
    public string styleInfo{get;set;}

    public AjaxFunctionsDemoCtrl() {

        selVal = 'India';
        styleInfo = 'color:blue;';
}

    public void changeColor(){
        styleInfo ='color:red;';

    }

    public Country_Info__mdt getCountry(){
        // string param = ApexPages.currentPage().getParameters().get('country');
        // if(string.isnotBlank (param)){
        //     selVal = param;
        // }
       return Country_Info__mdt.getAll().get(selVal);
    }

    public List<SelectOption> getOptions() {
        List<SelectOption> options = new List<SelectOption>();
       for(string country: Country_Info__mdt.getAll().keyset()){
           SelectOption option = new SelectOption(country,country);
           Options.add(option);
        }

        // example of using dynamic apex

        // for(Schema.PicklistEntry pe : Utility.getPickVals('Applicant__c','Country__c')){
        //     SelectOption option = new SelectOption(pe.getLabel(),pe.getLabel());
        //     Options.add(option);
        // }
        return options;
    }

}