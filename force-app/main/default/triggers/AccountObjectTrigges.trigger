trigger AccountObjectTrigges on Account (after update) {
    
    
     if(trigger.isUpdate){
   
        if(trigger.isAfter){
            accountControllerHandler.updateFieldValues(trigger.new ,trigger.oldMap);
        }
    }
    
}