import {uri} from "./config.js"

const config = { headers: { "content-type": "application/json" } };


// validar si existe el endPoint
const validar_endpoint = async (endPoint) => {
    if ((endPoint !== undefined || endPoint !== null) && endPoint !== "") {
        try {
            const respuesta = await (await fetch(uri + endPoint))
            if (respuesta.ok === false) return console.log({ status: 400, message: "no hay infor en el endPoint" })
        } catch (error) { console.error(error) }
        return true
    }
    return console.log({ status: 404, error: "el endPoint especificado es erroneo" })
}

//traer toda la data

const traerTodo = async (endPoint) => {
    let respuesta= await validar_endpoint(endPoint)
    console.log(uri + endPoint)
    //hise esta condiccion ya que me estaba generando problemas con el tipo de dato que me traia por ello lo hize que fuera ===igual 
    if (respuesta === true)  return await (await fetch(uri + endPoint)).json() 
}

//traer la data por piesas
const traerUno = async (id, endPoint) => {
    let validateEndP = await validar_endpoint(endPoint)
    if (validateEndP === true && typeof id === "number") {
        let respuesta = await (await fetch(uri + endPoint + "/" + id)).json()
        return (Object.keys(respuesta).length > 0) ? respuesta : { status: 401, message: "error id no encontrado", id }
    }
}

export {
    traerTodo,
    traerUno
}