public with sharing class LimitOffsetPaginationCtrl {

    Integer LimitSize=5, OffsetSize =0 , totSize =0 ;
    public LimitOffsetPaginationCtrl() {
        totSize = [select count() from Account Limit:Limits.getLimitQueryRows()];
    }

    public List<Account> getAccounts() {
     return [select Id,Name, Rating,Industry from Account Limit :LimitSize OFFSET : OffsetSize ];
    }

    public void first(){
        OffsetSize = 0;
    }
    public void Previous(){
         OffsetSize -= LimitSize; // offset = offset+limitsize
    }
    public void Next(){
        OffsetSize += LimitSize; // offset = offset+limitsize
    }
    public void Last(){
        Integer reminder = Math.mod(totSize,LimitSize);
        if (reminder == 0)
        OffsetSize = totSize - LimitSize;
        else
        OffsetSize = totSize - reminder;
    }
    public Boolean getHasPrevious(){
        if (OffsetSize == 0)
         return false;
        return true;
    }
    public Boolean getHasNext(){
        if(LimitSize + OffsetSize >= totSize)
         return false;
        return true;
    }

}