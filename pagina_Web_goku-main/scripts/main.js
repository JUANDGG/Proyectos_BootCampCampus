/*funcionalidad de  cambio de color de cabecero cuando se hace scroll*/ 

addEventListener("scroll" ,(e) =>{
    const header = document.getElementById("cabecero");
    header.classList.toggle("cabercero-scroll" ,scrollY >0)
})




/*funcionalidad de cambio de forma del icono del menu hamburguesa*/
const btnMenuAmb =document.getElementById("btnMenuAmb")
const btnCerrar=document.getElementById("btnCerrar")
const cabeceroNav =document.getElementById("cabeceroNav")
btnMenuAmb.addEventListener("click",()=>{
    btnMenuAmb.classList.add("btnNoDisplay")
    cabeceroNav.classList.add("despNavMovil")
    btnCerrar.addEventListener("click",()=>{
        cabeceroNav.classList.remove("despNavMovil")
        btnMenuAmb.classList.remove("btnNoDisplay")
    })
})