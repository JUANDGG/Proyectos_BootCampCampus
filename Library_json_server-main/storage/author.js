import {getAll} from "./request.js"
import  {htmlCodeRowTable}from "../util/componets.js"
import {TABLE,FORM} from "../util/selectors.js"
const getData =async()=>{
    let getd = await getAll("author")
    if (getd.length ==0)return undefined
    getd.forEach(element => {
        let html =htmlCodeRowTable(element.name, element.last_name,element.nacionality)
         TABLE.appendChild(html)
    });
    
}

/* const postData = async()=>{
    
}
 */

getData()