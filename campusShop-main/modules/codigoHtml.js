const htmlTargetas =(id,urlImagen, nombre,precio)=>{
    return `
    <div class="card" style="width: 18rem;" id="targeta">
        <span hidden id="idTargeta">${id}</span>
        <img   src="${urlImagen}" class="card-img-top" alt="...">
        <div class="card-body">
            <div>
                <h6 class="card-title">${nombre}</h6>
                <p class="card-text text-success mt-3 ">${precio}</p>
            </div>
                      
        </div>
        <div class=" d-flex  justify-content-end p-1">
                <button href="#" class="btn btn-dark" id="btnAgregar" >Agregar</button>
        </div>  
    </div>`
}

const htmlCarritoFilas =(id,urlImagen, nombre,precio)=>{
    return `
    <div class="card" style="width: 18rem;" id="targeta">
        <span hidden id="idTargeta">${id}</span>
        <img   src="${urlImagen}" class="card-img-top" alt="...">
        <div class="card-body">
            <div>
                <h6 class="card-title">${nombre}</h6>
                <p class="card-text text-success mt-3 ">${precio}</p>
            </div>
                      
        </div>
        <div class=" d-flex  justify-content-end p-1">
                <button href="#" class="btn btn-dark" id="btnELiminar" >Eliminar</button>
        </div>  
    </div>`
}


export {
    htmlTargetas
}