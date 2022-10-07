import { LightningElement } from 'lwc';

export default class Feb02LWC extends LightningElement {

FirstNumber = 0;
SecondNumber = 0 ;
 result = 0;
handleClick(event){
    if(event.target.label == 'Addition'){

        this.result = this.FirstNumber + this.SecondNumber ;
       alert(result);
    }
    if(event.target.label == 'Substraction'){

        this.result = this.FirstNumber - this.SecondNumber ;
        alert(result);
    }
    if(event.target.label == 'Multiply'){

        this.result = this.FirstNumber * this.SecondNumber ;
        alert(result);
    }

}
CaptureNumber(event){

    if(event.target.name == ' input1 '){
        this.FirstNumber = parseInt(event.target.value);
        
    }
    if(event.target.name == ' input2 '){
        this.SecondNumber = parseInt(event.target.value);
    }

}


}