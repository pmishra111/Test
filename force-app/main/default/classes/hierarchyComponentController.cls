//--------------------------------------------------------------
//Author- prakhar mishra
//Date - 14 May, 2019
//Purpose - Controller for ComponentHierarchy to generate Data for record Hierarchy 
//-----------------------------------------------------------
public class hierarchyComponentController {
    
    public string recordid{get;set;}
    public String objectAPIName{get;set;}
    public String parentFieldAPIName{get;set;}
    public String columnList{get;set;}
    public String ColumnsLabelList{get;set;}
    public String fieldAPINameForRecordLink{get;set;}
    public hierarchyComponentController(){
        recordid= ApexPages.currentPage().getParameters().get('id');
        
    }
    public PageReference GenerateHierarchy(){
        if(recordid !=null && recordid !=''){
            generateQueryString();
            generateHierarchyData();
        }else{
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Please specify the record id in URL for id parameter.'));
        
        }
        return null;
    }
    
    //Code to generate account hierarchy--start-------------------
    //Method to find Find the top most element in Heirarchy
    public string queryStringForUltimateParent;
    public string queryStringForHierarchy;
    public List<String> fieldAPINameList{get;set;}
    public List<String> ColumnsLabelListForUI{get;set;}
    public void generateQueryString(){
        system.debug('***parentFieldAPIName:'+parentFieldAPIName);
        system.debug('***columnList:'+columnList);
        system.debug('***objectAPIName:'+objectAPIName);
        queryStringForUltimateParent = 'Select id,  ';
        queryStringForHierarchy = 'Select id,  ';
        string fieldQuery = '';
        fieldAPINameList = new List<String>();
        ColumnsLabelListForUI = new List<String>();
        if(ColumnsLabelList!=null){
            List<string> columnlabels= ColumnsLabelList.trim().split(',');
            system.debug('***********columnlabels:'+columnlabels);
            if(columnlabels.size() > 0 ){
                for(string ss : columnlabels){
                    if(ss != null && ss != ''){
                        ColumnsLabelListForUI.add(ss.trim());
                    }
                }
            }
        }
        if(parentFieldAPIName!=null){
            queryStringForUltimateParent = queryStringForUltimateParent + parentFieldAPIName ;  
            queryStringForHierarchy = queryStringForHierarchy + parentFieldAPIName ;
        }
        if(columnList!=null){
            List<string> filedNames = columnList.trim().split(',');
            system.debug('***********filedNames:'+filedNames);
            if(filedNames.size() > 0 ){
                if(fieldAPINameForRecordLink==null || fieldAPINameForRecordLink == ''){
                    fieldAPINameForRecordLink=filedNames[0].trim();
                }
                for(string ss : filedNames){
                    if(ss != null && ss != ''){
                        if(ss != parentFieldAPIName){
                            fieldQuery = fieldQuery + ' , ' + ss.trim();
                        }
                        fieldAPINameList.add(ss.trim());
                    }
                }
            }
            queryStringForHierarchy = queryStringForHierarchy + fieldQuery;
        }
        if(objectAPIName!=null){
            queryStringForUltimateParent = queryStringForUltimateParent + ' from ' + objectAPIName ;
            queryStringForHierarchy = queryStringForHierarchy + ' from ' + objectAPIName ;
        }if(fieldAPINameList.size() != ColumnsLabelListForUI.size()){
            ColumnsLabelListForUI = new List<String>();
            ColumnsLabelListForUI = fieldAPINameList;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Mismatch between number of fields and labels. So System generates table with column label as field API name'));
        }
        system.debug('***queryStringForHierarchy:'+queryStringForHierarchy);  
        system.debug('***ColumnsLabelListForUI:'+ColumnsLabelListForUI); 
        system.debug('***fieldAPINameList:'+fieldAPINameList);
    }
    public String GetUltimateParentId( String queryString ){
        string objId = recordid;
        queryString = queryString +  '  where id =:objId Limit 1';
        
        if(queryString!=null){
            Boolean top = false;
            if(Limits.getLimitQueries()-Limits.getQueries()>0){
                while ( !top ) {
                    try{
                        system.debug('******Limits.getLimitQueries():'+Limits.getLimitQueries());
                        system.debug('******Limits.getQueries():'+Limits.getQueries());
                        system.debug('***queryString:'+queryString);
                        sObject rec = database.query(queryString);
                        if ( rec.get(parentFieldAPIName) != null ) {
                            objId = string.valueof(rec.get(parentFieldAPIName));
                            system.debug('***objId in GetUltimateParentId:'+objId);
                        }
                        else {
                            top = true;
                        }
                    }catch(exception ex){ 
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Something is wrong with either sobject or field API names. Please check and provide correct API names.'+ ex.getmessage()));
                        system.debug('****Exception while finding GetUltimateParentId.'+ ex.getmessage());
                        //top = true;
                    }
                }
            }else{
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Limit reached for number of SOQL Queries.'));
            }
        }
        system.debug('***objId in GetUltimateParentId:'+objId); 
        return objId ;
    }
    
    
    public List<HierarchyWrapper> dataForHierarchy{get;set;}
    
    public void generateHierarchyData(){
        system.debug('***recordid:'+recordid);  
        system.debug('***queryStringForHierarchy:'+queryStringForHierarchy);
        dataForHierarchy = new List<HierarchyWrapper>();
        //section to generate query string for account ends--------
        system.debug('*******current recordidid:' + recordid);
        List<String> currentParent      = new List<String>{};
        Integer count               = 0;
        Integer level               = 0;
        Boolean endOfStructure      = false;
        if(GetUltimateParentId(queryStringForUltimateParent)!=null){
            currentParent.add( GetUltimateParentId(queryStringForUltimateParent));
        }else{
            currentParent.add(recordid);
        }
        system.debug('**********ultimateParentId:'+ currentParent);
        //Loop though all children
        List<sobject> sbList            = new List<sobject>{};
        string queryStr = '';
        while ( !endOfStructure ){  
            if( level == 0 ){
                queryStr = queryStringForHierarchy + ' where id IN : CurrentParent ORDER BY '+ parentFieldAPIName +'  Limit 9000';
            } 
            else {
                queryStr = queryStringForHierarchy + ' where ParentID IN : CurrentParent ORDER BY '+ parentFieldAPIName+ ' Limit 9000';
            }
            system.debug('*********queryStr for child records:'+queryStr);
            if(queryStr != null && queryStr !=''){
                try{
                    if(Limits.getLimitQueries()-Limits.getQueries()>0){
                        sbList = database.query(queryStr);
                    }else{
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Limit reached for number of SOQL Queries.'));
                        endOfStructure = true;
                    }
                }catch(exception ex){ 
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Something is wrong with either sobject or field API names. Please check and provide correct API names.'+ex.getmessage()));
                    endOfStructure = true;
                }
            }
            if( sbList.size() == 0 ){
                endOfStructure = true;
            }
            else{
                currentParent.clear();
                for ( Integer i = 0 ; i < sbList.size(); i++ ){
                        //Change below
                        sobject sb = sbList[i];
                        HierarchyWrapper aw = new HierarchyWrapper();
                        aw.recordId =string.valueof(sb.get('id'));
                    if(sb.get('ParentId')!=null){
                        aw.idForNode = 'treegrid-'+ sb.get('id') +' treegrid-parent-'+ sb.get('ParentId');
                    }else{
                        aw.idForNode = 'treegrid-'+ sb.get('id');
                    }
                    for(String ss:FieldAPINameList){
                        try{
                            string colValue ='';
                            system.debug('******column API Name .'+ ss );
                            if(sb.get(ss)!=null){
                                colValue = string.valueof(sb.get(ss));
                                if(ss.trim().equalsignorecase(fieldAPINameForRecordLink.trim())){
                                    aw.hyperlinkColumnValue = colValue;
                                }
                            }
                            system.debug('******colValue .'+ colValue );
                            aw.recordtDetails.add(colValue);
                        }catch(exception ex){ 
                            system.debug('*******Error in some Field API Name.'+ ex.getmessage());
                        }
                    }
                    currentParent.add(string.valueof(sb.get('id')) );
                    dataForHierarchy.add(aw);
                }
            }
            level = level + 1;
        }
        system.debug('**********dataForHierarchy:'+dataForHierarchy);
    }
    
    public class HierarchyWrapper{
        public string idForNode{get;set;}
        public string recordId{get;set;}
        public string hyperlinkColumnValue{get;set;}
        public List<String> recordtDetails{get;set;}
        HierarchyWrapper(){
            idForNode= '';
            recordId='';
            hyperlinkColumnValue='';
            recordtDetails= new List<String>();
        }
    }
    //Code to generate  hierarchy--end-------------------
}