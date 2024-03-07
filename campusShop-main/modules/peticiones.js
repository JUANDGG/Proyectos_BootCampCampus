
import { uri } from "../config/config.js"





const config = { headers: { "content-type": "application/json" } };


// valido si existe el endpoint
const validar_endpoint = async (endPoint) => {
    if ((endPoint !== undefined || endPoint !== null) && endPoint !== "") {
        try {
            const respuesta = await (await fetch(uri + endPoint))
            if (respuesta.ok === false) return console.log({ status: 400, message: "no se enconro data en el endpoint" })
        } catch (error) { console.error(error) }
        return true
    }
    return console.log({ status: 404, error: "endpoint no encontrado" })
}



const traerXendPoint = async (endPoint) => {
    let validarEndpoint = await validar_endpoint(endPoint)
    if (validarEndpoint===true)return await (await fetch(uri + endPoint)).json() 
}

const traerTodosUrl = async (url) => {
    return await (await fetch(url)).json() 
}



const traerElementoXid = async (id, endPoint) => {
    let validarEndpoint = await validar_endpoint(endPoint)
    if (validarEndpoint === true && typeof id === "number") {
        let request = await (await fetch(uri + endPoint + "/" + id)).json()
        return (Object.keys(request).length > 0) ? request : undefined
    }
}

//post only one piece of information 
const enviarElemento = async (dataUser,endPoint) => {
    let validarEndpoint = await validar_endpoint(endPoint)
    if (validarEndpoint === true) {   
        config.method = 'POST'
        config.body = JSON.stringify(dataUser)
        await (await fetch(uri + endPoint, config))
    }
}


const deleteOne = async (endPoint, id) => {
    let validateEndP = await validate_endpoint(endPoint)
    if (validateEndP === true && typeof id === "number") {
        config.method = "DELETE"
        await (await fetch(uri + endPoint + "/" + id, config))
    }
}

const deleteAll = async (endPoint) => {
    let validateEndP = await validate_endpoint(endPoint)
    if (validateEndP === true){
        config.method ="PUT"
        config.body = JSON.stringify({endPoint :[]})
        await (await fetch (uri + endPoint ,config))
    }

}

const modificar = async (id,endPoint, data) => {
    config.method = 'PATCH'
    config.body = JSON.stringify(data)
    let request = await fetch(uri + endPoint + "/" + id, config)
}

export {
    traerXendPoint,
    traerTodosUrl,
    traerElementoXid,
    enviarElemento,
    modificar
}