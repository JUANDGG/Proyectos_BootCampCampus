
//selectores para el codigo html : lo separe aparte por que se ve mucho mejor la modularacion por que esto hacer referencia a que estamos usando

//estos selectores hacen parte   de views/index.html

const ROOT =document.getElementById("root");

const TODOS_LOS_PRODUCTOS = document.getElementById("todoslosProductos");
const ABRIGOS = document.getElementById("abrigos");
const CAMISETAS = document.getElementById("camisetas");
const PANTALONES = document.getElementById("pantalones");


export {
    ROOT,
    TODOS_LOS_PRODUCTOS,
    ABRIGOS,
    CAMISETAS,
    PANTALONES
}