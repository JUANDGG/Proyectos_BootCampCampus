const htmlCodeRowTable = (...data) => {
    //elements
  
    const creaElementTr = document.createElement("TR");

    data.forEach(e=>creaElementTr.innerHTML+=`<td scope="row">${e}</td>`)
    creaElementTr.innerHTML += `
      
      <td >

    <button id='view_cv' class="btn btn-success">view</button>

      <!--btn edit-->

  
      <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="btn_edit">Edit</button>
        
        <div class="modal fade " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit budget</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
              <form action="#" class="needs-validation"  id="formDataEdit" novalidate>
              <!--personal data-->
              <div class="mb-4 ">
                  <div class="card p-4 ">
                      <div>
                          <h2 class="h3 text-800">personal data</h2>
                      </div>
                      <div class="card-body card-bodyEdit">
  
                        
  
                          <div >
                              <div class="mb-4 border-bottom border-3">
                                  <label class="form-label" >full name</label>
                                  <input type="text" class="form-control" id="validationCustom01"  name="fullNameEdit"  placeholder="Enter full name" required >
                                  <div class="valid-feedback">Looks good!</div>
                              </div>
                          </div>
  
                          <div class="mb-3">
                              <label for="basic-url" class="form-label">Image url</label>
                              <div class="input-group">
                                
                                <input type="text" class="form-control" name="urlImgProfileEdit"  id="basic-url" aria-describedby="basic-addon3 basic-addon4">
                              </div>
                              <div class="form-text" id="basic-addon4">in this input you upload a picture of yourself that we will put on your cv</div>
                              <div class="valid-feedback">Looks good!</div>
  
                            </div>
  
                      </div>
                  </div>
          
              </div>
  
          <!--about-->
              <div class="mb-4 ">
                  <div class="card p-4 ">
                      <div>
                          <h2 class="h3 text-800">About</h2>
                      </div>
                      <div class="card-body card-bodyEdit">
                          <div >
                              <div class="mb-4 border-bottom border-3">
                                  <label class="form-label" >Personal description</label>
                                  <textarea class="form-control" name="aboutPersonEdit"  placeholder="Enter the personal Description" rows="3" required></textarea>
                                  <div class="valid-feedback">Looks good!</div>
                              </div>
                          </div>
                      </div>
                  </div>
          
              </div>
  
  
              
              <!--professions-->
              <div class="mb-4 ">
                  <div class="card p-4 ">
                      <div>
                          <h2 class="h3 text-800">Profession</h2>
                      </div>
                      <div class="card-body">
                          <div >
                              <div class="mb-4 border-bottom border-3">
                                  <label class="form-label" >Profession</label>
                                  <input type="text" class="form-control" id="validationCustom01"  name="professionsEdit"  placeholder="Enter the name of the profession" required>
                                  <div class="valid-feedback">
                                      Looks good!
                                  </div>
                                  
                              </div>
                          </div>
                      </div>
                  </div>        
              </div>
              <!--social netWork-->
              <div class="mb-4 ">
                  <div class="card p-4 ">
                      <div>
                          <h2 class="h3 text-800">Social networks</h2>
                      </div>
      
                      <div class="card-body">                    
                          <div class="mb-4 border-bottom border-3" >
                              <div>
                                  <label class="form-label">Name social network</label>
                                  <input type="text"  name="socialNetworkNameEdit"   class="form-control" placeholder="Enter the name of the social network" required>
                              </div>
                              <div class="mb-3 mt-3">
                                  <label for="basic-url" class="form-label">Social network URL</label>
                                  <div class="input-group">
                                    <input type="url" class="form-control" name="urlSocialNetworkEdit" id="basic-url" aria-describedby="basic-addon3 basic-addon4" >
                                  </div>
                                  <div class="form-text" id="basic-addon4">In this field, you can add the URL of the social network to add to the profile</div>
                              </div>
                          </div>
                          
                          <!--content-->
                      </div>
                      
                  </div>
              </div>
      
              <!--skills-->
              <div class="mb-4 ">
                  <div class="card p-4 ">
                      <div>
                          <h2 class="h3 text-800">Skills</h2>
                      </div>
      
                      <div class="card-body">                    
                          <div  class="mb-4  border-bottom border-3">
                              <div>
                                  <label class="form-label">Name of the skill</label>
                                  <input type="text" class="form-control"  name="nameSkillEdit"  placeholder="Enter the name of the skill" required>
                              </div>
                              <div class="mb-3 mt-3">
                                  <label class="form-label">Level domain</label>
                                  <div class="d-flex justify-content-between ">
                                      <input type="range"  value="0"  name="levelDomainEdit"  class="form-control w-50 inpt_range" required > 
                                      <span><span id="inpt_range_span">0</span> <strong>%</strong></span></span>
                                  </div>
                                  
                              </div>
                          </div>
                          
                          <!--content-->
                      </div>
                      
                  </div>
              </div>
      
              <!--hobbies-->
              <div class="mb-4 ">
                  <div class="card p-4 ">
                      <div>
                          <h2 class="h3 text-800">Hobbies</h2>
                      </div>
      
                      <div class="card-body">                    
                          <div class="mb-4 border-bottom border-3">
                              
                              <label class="form-label">Your hobby</label>
                              <input type="text" class="form-control" name="youHobbieEdit" placeholder="Enter your hobby" required>
                              
                          </div>
                          <!--content-->
                      </div>
                      
                  </div>
              </div>
      
              <!--laboral experience-->
              <div class="mb-4 ">
                  <div class="card p-4 mt-4">
                      <div>
                          <h2 class="h3 text-800">Laboral experience</h2>
                      </div>
                      <div class="card-body">                    
                          <div class="mb-4 border-bottom border-3">
                              <div>
                                  <label class="form-label" >Name of position</label>
                                  <input type="text" class="form-control" placeholder="Enter the name of the position held at the company" name="nameOfPositonCompanyEdit"  required>
                              </div>
      
                              <div class="mb-3 mt-3">
                                  <label class="form-label">Name of company</label>
                                  <input type="text" class="form-control"   name="nameOfCompanyJobEdit"  placeholder="Enter the name of the company you work for" required>
                              </div>
                             
                              <div class="mb-3 mt-3">
                                  <label class="form-label">Role description</label>
                                  <textarea class="form-control" name="roleDescriptionNameEdit"  placeholder="Enter your role in the company" rows="3" required ></textarea>
                              </div>
                          </div>
                          <!--content-->
                      </div>
                      
                  </div>
              </div>
      
              <!--education -->
              <div class="mb-4 ">
                  <div class="card p-4 mt-4">
                      <div>
                          <h2 class="h3 text-800">Education</h2>
                      </div>
      
                      <div class="card-body">                    
                          <div class="mb-4 border-bottom border-3" >
                              <div>
                                  <label class="form-label" >Name of degree or course</label>
                                  <input type="text" class="form-control" placeholder="Enter the name of the degree or course achieved"  name="nameOfdegreeOrCourseEdit"  required>
                              </div>
      
                              <div class="mb-3 mt-3">
                                  <label class="form-label">Name of institution</label>
                                  <input type="text" class="form-control" name="nameOfinstitutionEdit"  placeholder="Enter the name of the institution or site where the degree was obtained" required>
                              </div>
      
                              <div class="mb-3 mt-3">
                                  <label class="form-label">Description of the degree obtained</label>
                                  <textarea class="form-control"  name="descriptionOfTheDegreeEdit"  placeholder="Enter a brief description of what you did in this module" rows="3" required></textarea>
                              </div>
                          </div>
                          <!--content-->
                      </div>
                      
                  </div>
              </div>
      
              <!--services-->
              <div class="mb-4 ">
                  <div class="card p-4 mt-4">
                      <div>
                          <h2 class="h3 text-800">Services</h2>
                      </div>
      
                      <div class="card-body">                    
                          <div class="mb-4 border-bottom border-3">
                              <div class="mb-3 mt-3">
                                  <label class="form-label">Name of the service</label>
                                  <input type="text" class="form-control" name="nameOfServiceEdit"  placeholder="Enter the name of the service" required>
                              </div>
      
                              <div class="mb-3 mt-3">
                                  <label class="form-label">Description of the service</label>
                                  <textarea class="form-control" name="descriptionOfServiceEdit"  placeholder="Enter a brief description of the service" rows="3" required ></textarea>
                              </div>
                          </div>
                          <!--content-->
                      </div>
                      
                  </div>
              </div>
              
              
          </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-success" id='btn_confirm_data_edit' >Confirm</button>
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