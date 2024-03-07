const uriComponente ={
    ssl:"http://",
    nombre_host :"192.168.110.249",
    puerto :":5010"
}



let uri = `${uriComponente.ssl + uriComponente.nombre_host + uriComponente.puerto}/`

export {uri}