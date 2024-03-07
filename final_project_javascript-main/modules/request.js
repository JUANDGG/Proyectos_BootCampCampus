//imports
//import { structValidate, validateField } from "./validation.js"
import { uri } from "../config/config.js"
//import { structure } from "./struture.js"


//config methods post put

const config = { headers: { "content-type": "application/json" } };


// validate exists endpoint
const validate_endpoint = async (endPoint) => {
    if ((endPoint !== undefined || endPoint !== null) && endPoint !== "") {
        try {
            const requestponse = await (await fetch(uri + endPoint))
            if (requestponse.ok === false) return console.log({ status: 400, message: "nothing found at endpoint" })
        } catch (error) { console.error(error) }
        return true
    }
    return console.log({ status: 404, error: "ups you are lost, the specified endpoint was not found" })
}

//bring all dataUserUser

const getAll = async (endPoint) => {
    let validateEndP = await validate_endpoint(endPoint)
    if (validateEndP === true)  return await (await fetch(uri + endPoint)).json() 
}

//bring only one piece of information
const getOne = async (id, endPoint) => {
    let validateEndP = await validate_endpoint(endPoint)
    if (validateEndP === true && typeof id === "number") {
        let request = await (await fetch(uri + endPoint + "/" + id)).json()
        return (Object.keys(request).length > 0) ? request : { status: 401, message: "error id no encontrado", id }
    }
}

//post only one piece of information 
const postOne = async (dataUser, endPoint) => {
    let validateEndP = await validate_endpoint(endPoint)
    if (validateEndP === true) {
        //hash mapa for bring structure related to the endpoint
        let tableStructure = structure[endPoint]
        let body = {}
        let structValidatee = structValidate(dataUser)

        if (structValidatee === true) {
            try {
                if (Object.keys(tableStructure).length == Object.keys(dataUser).length) {
                    Object.entries(tableStructure).forEach(e => {
                        Object.assign(body, validateField({ fildNameStruct: e[0], valueFieldUser: dataUser[e[0]], DatentypStruct: e[1] }))
                    });
                    config.method = 'POST'
                    config.body = JSON.stringify(body)
                    await (await fetch(uri + endPoint, config))
                }
                else throw { status: 400, message: "the structures do not match" }
            } catch (error) { console.error(error) }
        }
        else console.error({ status: 400, message: "the structures is not an object" })
    }
}


const deleteOne = async (endPoint, id) => {
    let validateEndP = await validate_endpoint(endPoint)
    if (validateEndP === true && typeof id === "number") {
        config.method = "DELETE"
        await (await fetch(uri + endPoint + "/" + id, config))
    }
}

const putOne = async (id,endPoint, data) => {
    config.method = 'PATCH'
    config.body = JSON.stringify(data)
    let request = await fetch(uri + endPoint + "/" + id, config)
}

export {
    getAll,
    getOne,
    postOne,
    deleteOne,
    putOne
}