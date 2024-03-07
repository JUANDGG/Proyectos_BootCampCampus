import { traerXendPoint,traerTodosUrl,traerElementoXid,enviarElemento,modificar} from "./peticiones.js";
import { htmlTargetas } from "./codigoHtml.js";


////////////////////////////////endPoints :
const endPoints = {
    PRODUCTOS: "productos",
    ENDPABRIGO: "abrigo",
    ENDPCAMISETA: "camiseta",
    ENDPPANTALON: "pantalon",
    CARRITO:"carrito"    
}

///////////////////////////////////selectores :

const ROOT =document.getElementById("root");

const TODOS_LOS_PRODUCTOS = document.getElementById("todoslosProductos");
const ABRIGOS = document.getElementById("abrigos");
const CAMISETAS = document.getElementById("camisetas");
const PANTALONES = document.getElementById("pantalones"); ///
const CARRITO = document.getElementById("carrito")


///////////////////////////////////eventos :


    
//////////////////////////////// traer todos los productos
async function crearVariosCampos(){
    let temporalUrl = []

    const datos_endpoint = await traerXendPoint(endPoints.PRODUCTOS)
    for(let i in datos_endpoint[0])temporalUrl.push(datos_endpoint[0][i])
    
     temporalUrl.forEach( async url =>{
        const datosTemporales =await traerTodosUrl(url)
        datosTemporales.forEach(datos =>{
            let targeta = htmlTargetas(datos.imagen,datos.nombre,datos.precio);
            ROOT.innerHTML +=targeta
        })
    })  
}


TODOS_LOS_PRODUCTOS.addEventListener("click",crearVariosCampos)




////////////////////////////////////////// productos en general


const botonClickProducto =(endPoint)=>{
    
    setTimeout(()=>{
        
        const BOTON_AGREGAR_PRODUCTO =document.querySelectorAll("#btnAgregar")
        
        BOTON_AGREGAR_PRODUCTO.forEach(boton => {
            boton.addEventListener("mousedown",async (e)=>{
                
                let productoCLickeadosTemp =[]
                let id =e.target.parentElement.parentElement.firstElementChild
                let nombre =id.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild
                
                let data =await traerElementoXid(Number(id.textContent),endPoint)
                
                if(data ===undefined || data.nombre !==nombre.textContent)return alert("estas intentado alterar la pagina")

            
                
                let data2  =await traerXendPoint(endPoints.CARRITO)
                
                
                let ff = data2.some(element =>element[endPoint+"Id"] ==Number(id.textContent))
                if(ff !=true){      
                    let cuerpo ={}
                    cuerpo[endPoint+"Id"] = Number(id.textContent)
                    cuerpo["cantidad"] =1            
                    enviarElemento(cuerpo,endPoints.CARRITO)
                }

                 else {

                    data2.forEach(element => {
                        let idEndPoint =element.id
                        let cuerpoEdit ={}
                        cuerpoEdit["cantidad"]=element.cantidad +1
                        modificar(element.id,endPoints.CARRITO,cuerpoEdit)
                    })
                    
                }
 





                
                    
            

                
                
            })
        })

        

    },1000)

    
}




const crearCampos =async (endPointCampo)=>{
    ROOT.innerHTML =""
    const datos_endpoint = await traerXendPoint(endPointCampo)
    datos_endpoint.forEach(datos=>{
        let targeta = htmlTargetas(datos.id,datos.imagen,datos.nombre,datos.precio);
        ROOT.innerHTML +=targeta
    })
}

//abrigos
function crearCampoAbrigo(){
    crearCampos(endPoints.ENDPABRIGO)
    botonClickProducto(endPoints.ENDPABRIGO)
    

}

ABRIGOS.addEventListener("click",crearCampoAbrigo)


//camisetas
function crearCampoCamiseta(){
    crearCampos(endPoints.ENDPCAMISETA)
    botonClickProducto(endPoints.ENDPCAMISETA)
}


CAMISETAS.addEventListener("click",crearCampoCamiseta)

//pantalones

function crearCampoPantalones(){
    crearCampos(endPoints.ENDPPANTALON)
    botonClickProducto(endPoints.ENDPPANTALON)
}

PANTALONES.addEventListener("click",crearCampoPantalones)



///////////////////////////////ver carrito

async function crearCampoCarrito (){
    let data = await traerXendPoint(endPoints.CARRITO)

    data.forEach(element =>{
        console.log(element.join(","))
    })


}

CARRITO.addEventListener("click",crearCampoCarrito)