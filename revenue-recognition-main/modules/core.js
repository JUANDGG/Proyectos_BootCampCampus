//imports
import { requestss } from "./requests.js";
import { htmlCodeRowTable } from "./componets.js";

//elements
const tbody_table = document.getElementById("tbody");
const search_engine = document.getElementById("search_engine");
const formPage = document.getElementById("formPage");
const target_income = document.getElementById("target_income");
const target_egress = document.getElementById("target_egress");
const target_total_amount = document.getElementById("target_total_amount");

//object request
const resquest = new requestss(
  "https://6509ceb4f6553137159c0dc7.mockapi.io/api/usuarios/usuario"
);

//section add  data api localStorage
addEventListener("load", () => {
  resquest
    .get()
    .then((res) =>
      sessionStorage.setItem("data-api-user", JSON.stringify(res))
    );

  setTimeout(() => {
    view_data_target();
  }, 1000);
});

//section search data
const verify_entry = (data) => {
  search_engine.value == ""
    ? ((tbody_table.innerHTML = ""),
      data.forEach((element) => {
        let htmlCode = htmlCodeRowTable(
          element.id,
          element.budget,
          element.box
        );
        return tbody_table.appendChild(htmlCode);
      }))
    : null;
};

const view_data_table = () => {
  setTimeout(() => {
    //get data local storage
    let data = JSON.parse(sessionStorage.getItem("data-api-user"));
    //if outside the event the input is empty
    verify_entry(data);
    //event key
    search_engine.addEventListener("keyup", (e) => {
      if (
        e.key !== "Backspace" &&
        e.key !== "Escape" &&
        e.key !== "Enter" &&
        e.key !== "Shift"
      ) {
        let map_filter = data.filter((element) => {
          if (
            String(element.id).includes(e.target.value) ||
            String(element.budget).includes(e.target.value) ||
            String(element.box).includes(e.target.value)
          )
            return [element];
        });

        if (map_filter == "")
          tbody_table.innerHTML = "<p>there are no coincidences</p>";
        else {
          tbody_table.innerHTML = "";
          map_filter.forEach((element) => {
            let htmlCode = htmlCodeRowTable(
              element.id,
              element.budget,
              element.box
            );
            tbody_table.appendChild(htmlCode);
          });
        }
      }

      //if in the event the input is empty
      verify_entry(data);
    });
  }, 800);
};

//section add data

const view_data_target = () => {
  let countIncome = 0;
  let countEgress = 0;

  let data = JSON.parse(sessionStorage.getItem("data-api-user"));
  for (let i in data) {
    if (data[i].box == "income") countIncome += Number(data[i].budget);
    else {
      countEgress += Number(data[i].budget);
    }
  }

  target_income.textContent = countIncome;
  target_egress.textContent = countEgress;
  target_total_amount.textContent = countIncome + countEgress;
};

const add_data = () => {
  formPage.addEventListener("click", (e) => {
    if (e.target.localName == "button") {
      e.preventDefault();
      let form_data = Object.fromEntries(new FormData(formPage));
      let { budget, box } = form_data;

      //nested tenants
      budget = typeof budget === "string" ? Number(form_data.budget) : null;
      budget == ""
        ? alert("data vacia por favor intentelo de nuevo")
        : resquest.post({ budget: budget, box: box });

      setTimeout(() => {
        window.location.reload();
      }, 1000);
    }
  }); 
};

//section manipulate data
const manipulate_data = () => {
  tbody_table.addEventListener("click", (e) => {
    let target_evt_father = e.target.parentNode.parentNode.children;

    //edit
    if (e.target.localName == "button" && e.target.id == "btn_edit") {
      const staticBackdrop_edit = document.getElementById("staticBackdrop");
      staticBackdrop_edit.addEventListener("focusin", (e) => {
        let arr_temp_data = [
          target_evt_father[0].textContent,
          target_evt_father[1].textContent,
          target_evt_father[2].textContent,
        ];

        //elements temporals
        const input_data_edit = document.getElementById("input_data_edit");
        const flexRadioDefault1 = document.getElementById("flexRadio1");
        const flexRadioDefault2 = document.getElementById("flexRadio2");
        const formEdit = document.getElementById("formEdit");
        const btn_confirm_data_edit =
          document.getElementById("btn_confirm_data");

        //input send placeHolder data

        input_data_edit.placeholder = arr_temp_data[1];
        console.log(input_data_edit);

        //nested tenants
        arr_temp_data[2].toLowerCase().trim() == "income"
          ? flexRadioDefault1.setAttribute("checked", "")
          : arr_temp_data[2].toLowerCase().trim() == "egress"
          ? flexRadioDefault2.setAttribute("checked", "")
          : null;

        btn_confirm_data_edit.addEventListener("click", () => {
          let form_objentries = Object.fromEntries(new FormData(formEdit));
          console.log(form_objentries);
          //send edit
          form_objentries.budget != ""
            ? resquest.put(
                arr_temp_data[0],
                form_objentries.budget,
                form_objentries.box
              )
            : resquest.put(
                arr_temp_data[0],
                input_data_edit.placeholder,
                form_objentries.box
              );

          //reload page 1 second
          setTimeout(() => {
            window.location.reload();
          }, 1000);
        });
      });
    }

    //delete
    else if (e.target.localName == "button" && e.target.id == "btn_delete") {
      document
        .getElementById("btn_delete_data")
        .addEventListener("click", () => {
          //send delete
          resquest.delete(String(target_evt_father[0].textContent));
          //reload page 1 second

          setTimeout(() => {
            window.location.reload();
          }, 1000);
        });
    }
  });
};

view_data_table();
manipulate_data();
add_data();
