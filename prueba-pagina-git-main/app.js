//se agregan a cache los archivos principales de la pagina

caches.open("db-principal") //creo un almacen cache llamado db-princiapal
    //lo anterior devuelve una promesa asi que uso el metodo addAll para agregar varios archivos ala vez 
    .then(caches => caches.addAll(["app.js","index.html","style.css"])) 