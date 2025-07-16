public with sharing class GenericPaginationCtrl {

    public List<Sobject> sobjects {get;set;}

    public ApexPages.StandardSetController con {
        get{
            if(con == null){
             con = new ApexPages.StandardSetController(sobjects);

                con.setPageSize(5);
            }
             return con;
        }
        set;
    }


    public List<Sobject> getRows() {
        return con.getRecords();
    }
}