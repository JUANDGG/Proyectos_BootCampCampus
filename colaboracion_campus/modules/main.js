import {traerTodo} from "./request.js"
import {htmlTargetasCursos} from "./htmlCode.js"


//selectores 

const root = document.getElementById("root")


const montar_data =async()=>{
    let dataAPi = await traerTodo("cursos/all")
    dataAPi.forEach(dato => {
        let dataTargeta = htmlTargetasCursos(dato.folder,dato.imagenCourse,dato.nameCourse)
        root.innerHTML +=dataTargeta        
    });

    //cargo la info

    let curso =document.querySelectorAll("#btn_ver_curso")
    curso.forEach(dato =>{
        dato.addEventListener("click",(e)=>{
            
            let hermanoAnterior =e.target.parentElement.firstElementChild.textContent
            sessionStorage.setItem("nombre_curso",hermanoAnterior)
        })
    })
}



montar_data()