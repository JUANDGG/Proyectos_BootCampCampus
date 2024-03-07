//import ccomponentCards html code
import { componentCard, componentCardEstad } from "./components.js";

//root content send data
const root = document.getElementById("root");
//content buttons
const cont_buttons = document.getElementById("cont_buttons");
//url pokemon api
let urlPokemon = "https://pokeapi.co/api/v2/pokemon";

/*pokemon loading section*/

////////////////////////////////////////////////////////////////////////////////////
const display_pokemon = async (urlPoke) => {
  //delete counter
  root.innerHTML = "";
  try {
    const request = await (await fetch(urlPoke + "/?limit=5&offset=0")).json();
    const btnNext = request.next
      ? `<button class="btn"  id="btnNext" next_url=${request.next}>></button>`
      : "";
    const btnPrevious = request.previous
      ? `<button class="btn"  id="btnPrevius"  previus-url=${request.previous}><</button>`
      : "";
    cont_buttons.innerHTML = `${btnPrevious} ${btnNext}`;
    for (let i of request.results) {
      const request = await (await fetch(i.url)).json();
      //get ccomponentCard
      let componentCardt = componentCard(
        request.sprites.other.dream_world.front_default,
        request.name
      );
      //send ccomponentCard to dom
      root.innerHTML += componentCardt;
    }
  } catch (error) {
    console.log(error);
  }
};

//event click button send and previus
async function eventContButtons(e) {
  if (e.target.id == "btnNext")
    display_pokemon(e.target.getAttribute("next_url"));
  else if (e.target.id == "btnPrevius")
    display_pokemon(e.target.getAttribute("previus-url"));
}

cont_buttons.addEventListener("click", eventContButtons);

display_pokemon(urlPokemon);

////////////////////////////////////////////////////////////////////////////////////

/*section view pokemon*/

/////events view pokemon

//event send range value label sibling input type range
function rangeInputValue(e) {
  let siblingLabel = e.target.previousElementSibling;
  siblingLabel.textContent = e.target.value;
}

//event send data
async function sendDataApi(e) {
  //get the form  data
  let objectFormData = Object.fromEntries(new FormData(formDataStats));
  try {
    const request = await fetch(
      "https://6509ceb4f6553137159c0dc7.mockapi.io/api/usuarios/pokeStats",
      {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          //request to obtain the image of the pokemon
          "img-poke-url": (
            await (
              await fetch(
                `${urlPokemon}/${document.querySelector("h2").textContent}`
              )
            ).json()
          ).sprites.other.dream_world.front_default,
          "name-poke": document.querySelector("h2").textContent,
          hp: Number(objectFormData.hp),
          attack: Number(objectFormData.attack),
          defense: Number(objectFormData.defense),
          special_attack: Number(objectFormData.special_attack),
          special_defense: Number(objectFormData.special_defense),
          speed: Number(objectFormData.speed),
        }),
      }
    );

    //send window when statistics are sent to the api
    Swal.fire("modified statistics", "You clicked the button!", "success");
  } catch (error) {
    console.error(error);
  }
}

function changeInputRange(e) {
  document.getElementById("sendInfo").addEventListener("click", sendDataApi);
}

//function to load the statistics of the card

const viewCardPokemon = async (endpoint) => {
  try {
    //request for api where statistics are stored
    const request = await (
      await fetch(
        "https://6509ceb4f6553137159c0dc7.mockapi.io/api/usuarios/pokeStats"
      )
    ).json();

    //checks if the pokemon exists in the statistics database
    let checkPokemon = request.some((res) => res["name-poke"] == endpoint);

    ////habilitis form
    let abilitiesHTML = document.createElement("FORM");
    abilitiesHTML.setAttribute("id", "formDataStats");

    //if it is not loaded by default the card with the statistics of the poke api
    if (!checkPokemon) {
      //request to poke api
      const resquest = await (await fetch(`${urlPokemon}/${endpoint}`)).json();
      console.log(resquest);
      let statistics_mapping = resquest.stats
        .map((element) => {
          return [element.stat.name, element.base_stat];
        })
        .forEach((element) => {
          let componentCardEstadd = componentCardEstad(element[0], element[1]);
          abilitiesHTML.innerHTML += componentCardEstadd;
        });

      //window pokemon
      Swal.fire({
        title: resquest.name,
        heigth: 200,
        imageUrl: resquest.sprites.other.dream_world.front_default,
        imageHeight: 200,
        html: abilitiesHTML,
        showCancelButton: true,
        confirmButtonText: "Save",
        cancelButtonText: "Cancel",
        customClass: "custom-swal",
        didRender: () => {
          // Selecciona el botón por su clase y asigna un ID personalizado
          const customButton = document.querySelector(".swal2-confirm");
          if (customButton) {
            customButton.id = "sendInfo";
          }
        },
      });
    } else {
      //I am looking for my pokemon's data
      let checkPokemon = request.filter((res) => res["name-poke"] == endpoint);
      // I create a new array which has all the statistics structure in an organized way.
      console.log(checkPokemon[checkPokemon.length - 1]);

      let statistics_mappings = Object.entries(
        checkPokemon[checkPokemon.length - 1]
      ).map(([key, value]) => {
        return [key, value];
      });

      let latestCardStatistics = Object.entries(
        checkPokemon[checkPokemon.length - 1]
      )
        .map(([key, value]) => {
          return [key, value];
        })
        .slice(1, 7)
        .forEach((element) => {
          let componentCardEstadd = componentCardEstad(element[0], element[1]);
          abilitiesHTML.innerHTML += componentCardEstadd;
        });

      //window pokemon
      Swal.fire({
        title: checkPokemon[0]["name-poke"],
        imageUrl: checkPokemon[0]["img-poke-url"],
        html: abilitiesHTML,
        customClass: "custom-swal",
        showCancelButton: true,
        confirmButtonText: "Save",
        cancelButtonText: "Cancel",
        didRender: () => {
          // Selecciona el botón por su clase y asigna un ID personalizado
          const customButton = document.querySelector(".swal2-confirm");
          if (customButton) {
            customButton.id = "sendInfo";
          }
        },
      });
    }

    //event change input range
    document
      .querySelectorAll("input[type='range']")
      .forEach((input) => input.addEventListener("change", rangeInputValue));
    //event change input range send data
    document
      .getElementById("formDataStats")
      .addEventListener("change", changeInputRange);
  } catch (error) {
    console.log(error);
  }
};
////////////////////////////////////////////////////////////////////////////////////

//event click cards pokemon
function clickCard(e) {
  if (e.target.nodeName == "IMG" || e.target.nodeName == "DIV") {
    const parent_label = e.target.parentElement;
    viewCardPokemon(parent_label.lastElementChild.textContent);
  }

  if (e.target.nodeName == "DIV") {
    console.log(e.target.lastElementChild.textContent);
    viewCardPokemon(e.target.lastElementChild.textContent);
  }
}

root.addEventListener("click", clickCard);

////////////////////////////////////////////////////////////////////////////////////
