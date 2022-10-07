import { LightningElement,wire,track,api } from 'lwc';
import getAllPendingApprovals from '@salesforce/apex/GetPendingApprovalReq.getAllPendingApprovals';
import approvePendingApprovals from '@salesforce/apex/GetPendingApprovalReq.approvePendingApprovals';
import rejectPendingApprovals from '@salesforce/apex/GetPendingApprovalReq.rejectPendingApprovals';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
/*const columns =[
    {label : 'RecordName',fieldName :'RecordName'},   
    {label : 'status',fieldName :'Status'},
    {label : 'ApproverName',fieldName :'ApproverName'},
    {label : 'AssignedToName',fieldName :'AssignedToName'},
    {label : 'recordId',fieldName :'RecordId'},
    {label : 'SubmitterName',fieldName :'Submitter'},
    
    {type: "button",  label :'Approve', typeAttributes: {  
        label :'Approve',
        name: 'Approve',  
        title: 'Approve',    
        value: 'Approve', 
        variant: 'brand', 
        iconPosition: 'left'  
    }}
];*/
export default class CreateRecord extends LightningElement {
    @track pendingApprovals;  
    @track error;  
  //  @track columns = columns;     
    @api recordId;
  
    RecordName;
    status;
    SubmitterName;
        
     
        @wire(getAllPendingApprovals)
        pendingApprovalList({error, data }){
                if (data){
                    console.log('Data \n', data);
                    this.pendingApprovals = data;
                    console.log('Pending Approvals' +JSON.stringify(this.pendingApprovals));
                   /* this.RecordName = this.pendingApprovals?.RecordName;
                    console.log('this.RecordName' +JSON.stringify(this.RecordName));
                    this.status = this.pendingApprovals.Status;
                    this.SubmitterName = this.pendingApprovals.Submitter;*/
                    this.error = undefined;
                }
                else if (error){
                    console.error('Error:', error);
                }
            }
            handleClick(event){
                event.preventDefault();
                console.log('RecordId => ' + event.target.dataset.id);
               const selectedRecord = event.target.dataset.id;
               /*const selectedAction = event.target.value;
                console.log('Selected records',JSON.stringify(selectedAction));
                this.recordId = selectedAction;
                console.log('new recordId' +JSON.stringify(this.recordId));*/
               this.recordId = selectedRecord;
               console.log('this.recordId' +JSON.stringify(this.recordId));
                approvePendingApprovals( { recordId : this.recordId})
                .then(()=>{
                    console.log('Record Id' +this.recordId );
                    this.dispatchEvent(new ShowToastEvent({
                        title: "Success",
                        message: 'Request Approved',
                        variant: "success"
                    })
                    );
                    //return refreshApex(this.pendingApprovals); 
                    window.location.reload();      
                })
                .catch(error=>{
                    this.dispatchEvent(new ShowToastEvent({
                        title: "Error",
                        message: 'Error',
                        variant: "error"
                    })
                    );
                });
            }

            handleRaject(event){
                event.preventDefault();
                console.log('RecordId => ' + event.target.dataset.id);
               const selectedRecord = event.target.dataset.id;
               this.recordId = selectedRecord;
            rejectPendingApprovals( { recordId : this.recordId})
            .then(()=>{
                //console.log('clicked' );
                this.dispatchEvent(new ShowToastEvent({
                    title: "Success",
                    message: 'Request Rejected',
                    variant: "success"
                })
                );
                //return refreshApex(this.pendingApprovals);  
                window.location.reload();     
            })
            .catch(error=>{
                this.dispatchEvent(new ShowToastEvent({
                    title: "Error",
                    message: 'Error',
                    variant: "error"
                })
                );
            });
        }
         
            
        
}