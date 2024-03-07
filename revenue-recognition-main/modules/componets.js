const htmlCodeRowTable = (id, budget, box,valueEdit=null) => {
  //elements

  const creaElementTr = document.createElement("TR");
  creaElementTr.innerHTML = `
    <td scope="row">${id}</td>
    <td >${budget}</td>
    <td >${box}</td>
    <td >


    <!--btn edit-->

    <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="btn_edit">
        Edit
    </button>
      
      <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit budget</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formEdit" action="#" >
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label ">budget</label>
                      <input type="number" class="form-control" placeholder="Enter your budget" name="budget" id="input_data_edit"  required>
                    </div>
                    <div class="form-check ">
                        <input class="form-check-input" type="radio" name="box" value="income" id="flexRadio1"   >
                        <label class="form-check-label " for="flexRadioDefault1" >
                            income
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="box"  value="egress" id="flexRadio2" >
                        <label class="form-check-label "  for="flexRadioDefault2">
                            egress
                        </label>
                      </div>
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
              <button type="button" class="btn btn-success" id='btn_confirm_data' >Confirm</button>
            </div>
          </div>
        </div>
      </div>



      <!--btn delete-->

      <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" id="btn_delete">
      Delete
    </button>
    
    
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">You want to delete the user</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-danger" id="btn_delete_data">Confirm</button>
          </div>
        </div>
      </div>
    </div>
    </td>

    `;

  return creaElementTr;
};

export { htmlCodeRowTable };
