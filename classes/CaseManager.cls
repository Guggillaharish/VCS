@RestResource(urlMapping='/cases/*')
global with sharing class CaseManager {
   @HttpGet
    Global Static Case getCaseById(){
        RestRequest request= RestContext.request;
        String caseId=request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
        System.debug('CaseId' + CaseID);
       Case result=[select CaseNumber,Subject,Status,Origin,Priority from Case where id=:caseId];
        return result;
    }
    @HttpPost
    global static ID createCase(String subject,String status,String origin,String priority){
        case thiscase= new case(
            subject=subject,
            status=status,
            origin=origin,
            priority=priority);
        insert thiscase;
        System.debug(thiscase);
         System.debug(thiscase.Id);
        return thiscase.id;
        
        
    }
}