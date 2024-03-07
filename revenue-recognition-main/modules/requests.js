class requestss {
    constructor(url) {
      this.url = url;
    }
  
    async get() {
      try {
        const xhttp = await fetch(this.url, {
          headers: {
            "Access-Control-Allow-Origin":
              "http://127.0.0.1:5500/prueba_api1/index.html",
          },
        });
  
        const response = await xhttp.json();
        const response_end = response

        return response_end;


      } catch (error) {
        error = "ups erro 404 not found";
        console.error(error);
      }
    }
    
     async post(cuerpo = {}) {
      const xhttp = await fetch(this.url, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin":
            "http://127.0.0.1:5500/prueba_api1/index.html",
        },
        body: JSON.stringify(cuerpo),
      });
    }
  
    async put(...data) {
      console.log(data)
      const xhttp = await fetch(`${this.url}/${data[0]}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin":
            "http://127.0.0.1:5500/prueba_api1/index.html",
        },
        body: JSON.stringify({
          budget: data[1],
          box: data[2],
        }),
      });
    }
  
    async delete(id) {
      const xhttp = await fetch(`${this.url}/${id}`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin":
            "http://127.0.0.1:5500/prueba_api1/index.html",
        },
      });
    } 
  }
  
  export { requestss };