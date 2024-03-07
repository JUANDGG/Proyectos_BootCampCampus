import { traerTodo } from "./request.js";
import {contenedorCurso,cursos} from "./htmlCode.js"




const root = document.getElementById("root")
const videos = document.getElementById("videos")

let nombreCurso =sessionStorage.getItem("nombre_curso")


let dataAPi = await traerTodo(`cursos/v2?course=${nombreCurso}`)


sessionStorage.setItem("curso",JSON.stringify(dataAPi))







let hijos =root.children

const crearCurso =()=>{
    
    
    let dataSeccion =JSON.parse(sessionStorage.getItem("curso"))
    
    
        let count =0    
        let agrupacion ={} 
        dataSeccion.secciones.forEach(element => {
            if(element.sectionName){
                count +=1        

                agrupacion[element.sectionName] =[]
                

                element.videos.forEach(e=>{
                    agrupacion[element.sectionName].push(` http://192.168.110.249:5010/cursos/play?course=${nombreCurso}&seccion=${count}&video=${e.video}`)

                })

                

            }
            
        });  
        sessionStorage.setItem("videos",JSON.stringify(agrupacion))
}


const crearTargeta =()=>{
    let dataSeccion =JSON.parse(sessionStorage.getItem("videos"))
    let entradas = Object.entries(dataSeccion)
    entradas.forEach(e=>{
        let ct = contenedorCurso(e[0])
        root.innerHTML +=ct
        
    })
}  


const verContenidoTargeta =()=>{
    const targeta = document.querySelectorAll("#targeta")
    targeta.forEach(element =>{
        element.addEventListener("click",(e)=>{
            let data = JSON.parse(sessionStorage.getItem("videos"))
            

            if(data[e.target.textContent.trim()]){

                let hash =data[e.target.textContent.trim()]

                for(let i in hash){
                    let cu = cursos(hash[i])
                    videos.innerHTML +=cu
                }

                
                
            }


        })
    })
}





crearCurso()
crearTargeta()
verContenidoTargeta()