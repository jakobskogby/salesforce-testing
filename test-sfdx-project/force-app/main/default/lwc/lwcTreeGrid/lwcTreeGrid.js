import { LightningElement, track } from 'lwc';
import {
    EXAMPLES_COLUMNS_DEFINITION_BASIC,
    EXAMPLES_DATA_BASIC,
} from './sampleData';

export default class TreeGridBasic extends LightningElement {
    // definition of columns for the tree grid
    gridColumns = EXAMPLES_COLUMNS_DEFINITION_BASIC;

    // data provided to the tree grid
    @track gridData = EXAMPLES_DATA_BASIC;

    @track columnList;  // set by apex wire service using field set
    @track projectListObj;  // the data as returned by the apex wire service
    @track projectList;  // wire service data required modification for correct display
    @track selectedRows = [];
    //currentSelectedRows = [];  // used to track changes
    @track dataObj = [];



    setSelectedRows(){
             var selectRows = this.template.querySelector('lightning-tree-grid').getSelectedRows();
             
   
             if(selectRows.length > 0){
                 var currentSelectedRows = [];
                  var tempList = [];
                  selectRows.forEach(function (record){
                            tempList.push(record.name);
                  })
                  this.gridData.forEach(function (record){
                    console.log('record');
                      console.log(record);
                           if(tempList.includes(record.name)){
                            console.log('y');
                            var x = currentSelectedRows.includes(record.name);
                            console.log('x');
                            console.log(x);

                            if(x === false){
                                record._children.forEach(function (item){
                                    if(!tempList.includes(item.name)) {
                                        tempList.push(item.name);
                                    }
                                   })
                            }

                               
                           }

                           

                           if(!tempList.includes(record.name)){

                            console.log('test1');
                            var x = currentSelectedRows.includes(record.name);
                            if(x === true){
                                console.log('test2');
                                record._children.forEach(function(item){
                                    console.log('test3');
                                    const index = tempList.indexOf(item.name);
                                    if(index > -1){
                                        console.log('test4');
                                        tempList.splice(index, 1);
                                    }
                                })
                            }
                               
                           }
/*                           

                           var allSelected = true;
                           record._children.forEach(function(item){
                            var b = tempList.includes(item.name);


                               if(b === false){
                                   allSelected = false;
                               }
                           })

                           

                           if(allSelected){
                                var y = tempList.includes(record.name);
                               if(y === false ){
                                tempList.push(record.name);
                               }
                               
                           } 
                           
                           else if (allSelected === false){
                             var l = tempList.includes(record.name);
                             if(l === true){
                                const index = tempList.indexOf(record.name);
                                if(index > -1){
                                    tempList.splice(index, 1);
                                }
                             }
                             
                               
                           }
                           */
                            

                       })
                  this.selectedRows = tempList;
                  currentSelectedRows = tempList;
                  console.log(this.selectedRows);
             }
         }
    
}