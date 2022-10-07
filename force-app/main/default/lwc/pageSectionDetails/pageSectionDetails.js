import { LightningElement,track , api} from 'lwc';
import Object_Name from '@salesforce/schema/Contact';
import getlstsections from '@salesforce/apex/sectionDetailsController.getlstsections';
import generatePDF from '@salesforce/apex/sectionDetailsController.generatePDF';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class PageSectionDetails extends LightningElement {
    @track ContactDetails = [];
    attachment;

  @api recordId='0035g00000DkxsxAAB';
  Object=Object_Name;
  ActiveSession=['Contact Information', 'Address Information', 'Additional Information',
                'Account Information','System Information', 'Description Information', 'Custom Links', ];
handelClick(){
  const editor = this.template.querySelector('lightning-accordion');
        
        //implicit calling apex method
        generatePDF({recordId :this.recordId})
        .then((result)=>{
            this.attachment = result;
                console.log('attachment id=' + this.attachment.Id);
                //show success message
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'PDF generated successfully with Id:' + this.attachment.Id,
                        variant: 'success',
                    }),
                );
        })
        .catch(error=>{
            //show error message
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating Attachment record',
                    message: error.body.message,
                    variant: 'error',
                }),
            );
        })

                }
connectedCallback(){
    getlstsections()
  .then(result =>{
    this.ContactDetails = result;
    console.log('result' +JSON.stringify(this.ContactDetails));
    })
  .catch(error=>{
    console.log(error);
    })
  }
}