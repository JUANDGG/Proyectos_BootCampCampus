
const componentCard =(imageUrl,name)=>{
    return `
        <div id="card">
            <img src="${imageUrl}"/>
            <p id="namePoke">${name}</p>
        </div>
            
        `
}


const componentCardEstad =(value1,value2)=>{
     return `<h4 >${value1}</h4><label>${value2}</label><input type="range" name="${value1}" value="${value2}">`
} 

export {componentCard,componentCardEstad}