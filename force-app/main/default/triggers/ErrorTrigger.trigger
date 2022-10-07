trigger ErrorTrigger on Account (after insert, after update) {
        ErrorHandler.sendApiRequest(trigger.oldMap, trigger.newMap);
}