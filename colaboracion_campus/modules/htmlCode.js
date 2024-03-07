const htmlTargetasCursos =(titulo,urlImagen,nombre_curso)=>{
    return `
        <div class="card" style="width: 18rem;">
            <img src="${urlImagen}" class="card-img-top" alt="...">
            <div class="card-body">
            <h5 class="card-title">${titulo}</h5>
            <p class="card-text">${nombre_curso}</p>
            <a href="../views/template.html" class="btn btn-primary" id="btn_ver_curso">ver curso</a>
            </div>
        </div>
    `

}


const cursos =(urlCurso)=>{
    return `<iframe width="560" height="315" src="${urlCurso}" frameborder="0" allowfullscreen></iframe>`
}


const contenedorCurso = (seccionNombre) => {
    return `
        <button id="targeta">
            ${seccionNombre}
        </button>

    `;
}




export {
    htmlTargetasCursos,
    contenedorCurso,
    cursos
}