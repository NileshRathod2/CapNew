trigger AvoidAccountDeletion on Account (before delete) {
    for(Account A:trigger.old){ /*for every record */
        if(A.rating=='hot'){  /*check rating is hot*/
            A.adderror('you can not delete this field because it is profitable ');/*add error to thise recor*/
        }
    }
}