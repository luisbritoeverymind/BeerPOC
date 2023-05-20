public class DataTable {
    
    @AuraEnabled(cacheable=true)
    Public Static List<wrapper> getContacts(){
        List<wrapper> wrapperList = new List<wrapper>();
        Integer count =0;
        for(Contact con:[Select Id, FirstName, LastName ,Email, Phone from contact Limit 10  ]){
           wrapper wr = new wrapper();
            wr.Id = con.Id;
            wr.FirstName = con.FirstName;
            wr.LastName = con.LastName;
            if(Count < 2){
            wr.isSelected = true;    
            }
            else{
                wr.isSelected = false;
            }
            wrapperList.add(wr);
            Count++;
            
        }
        return wrapperList;
    }
    
    
    Public class wrapper{
         @AuraEnabled
        public String Id;
        @AuraEnabled
        public String FirstName;
        @AuraEnabled
        public String LastName;
        @AuraEnabled
        public Boolean isSelected;
        
    }

}