import {getAll,getOne,postOne,deleteOne,putOne} from './request.js'
import {htmlCodeRowTable}from './componets.js'




'use strict';   

//functionality to add more fields and to remove them in html
const addAnotherButtons = document.querySelectorAll("#add_another");
//const inpt_range = document.querySelectorAll(".inpt_range")
let limit =4

const add_another = document.querySelectorAll("#add_another")
add_another.forEach(e =>{
    e.addEventListener('click',(e)=>{
        e.preventDefault()
        let element =e.target.parentElement.firstElementChild.nextElementSibling.firstElementChild.cloneNode(true);      
        
        let elementCardBody =e.target.parentElement.firstElementChild.nextElementSibling.children
        

        if(elementCardBody.length <=limit){
          const div = document.createElement("DIV")
          div.classList.add("container_clone")
  
          
          div.appendChild(element)
          div.innerHTML +=
          `
              <div>
                  <button type="button" class="btn btn-danger mb-4" id="delete_field">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="#fff" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg>
                  </button>
              </div>
          
          `
          
          e.target.parentElement.firstElementChild.nextElementSibling.appendChild(div)

          setTimeout(()=>{
            document.querySelectorAll("#delete_field").forEach(e3=>{
                e3.addEventListener("click",(env)=>{
                    const section = env.target.closest('.container_clone')
                    section.remove()
                    e.target.removeAttribute("disabled");

                })
                
            })
        },500)

        

        }

        else e.target.setAttribute("disabled", "disabled")
        
    })
})



const changeofRank =()=>{
    
    document.querySelectorAll(".inpt_range").forEach(inptRange=>{
        inptRange.addEventListener("change",event=>{
            const closestSpan = event.target.closest('.d-flex').lastElementChild.children
            closestSpan[0].textContent=event.target.value
            
        })
    })


    addAnotherButtons.forEach(button => button.addEventListener("click",()=>{
        document.querySelectorAll(".inpt_range")
            .forEach(inptRange=>{
                inptRange.addEventListener("change",event=>{
                    const closestSpan = event.target.closest('.d-flex').lastElementChild.children
                    closestSpan[0].textContent=event.target.value   
                    
                })
            })
    }));

}

const getData =()=>{
    //objects 
    let personalInformation =[]
    let objProfession =[]
    let socialNetwork =[]
    let aboutPerson =[]
    let skills =[]
    let hobbies =[]
    let education =[]
    let workExperiense =[]
    let services = []
    let projects = []


    //personaInformation
    const dni = document.getElementsByName('dni')
    const fullName =document.getElementsByName("fullName")
    const urlImgProfile = document.getElementsByName('urlImgProfile')

    //about
    const about =document.getElementsByName("aboutPerson")
  
    //profesions
    const professions = document.getElementsByName('professions')
  
    // social network 
    const socialNetworkName =document.getElementsByName("socialNetworkName")
    const urlSocialNetwork = document.getElementsByName("urlSocialNetwork")
  
    //skills
    const nameSkill = document.getElementsByName("nameSkill")
    const levelDomain =document.getElementsByName("levelDomain")
  
  
    //hobbies
    const youHobbie = document.getElementsByName("youHobbie")
  
   
  
    //education
    const nameOfdegreeOrCourse = document.getElementsByName("nameOfdegreeOrCourse")
    const nameOfinstitution = document.getElementsByName("nameOfinstitution")
    const descriptionOfTheDegree = document.getElementsByName("descriptionOfTheDegree")

    //work experiense
    const nameOfCompanyJob = document.getElementsByName("nameOfCompanyJob")
    const  nameOfPositonCompany = document.getElementsByName("nameOfPositonCompany")
    const roleDescriptionName = document.getElementsByName("roleDescriptionName")

  
    //services
    const nameOfService = document.getElementsByName("nameOfService")
    const descriptionOfService = document.getElementsByName("descriptionOfService")
  
    //projects
    const nameOfProject = document.getElementsByName("nameOfProject")
    const DescriptionOfProject = document.getElementsByName("DescriptionOfProject")
    const imageProject = document.getElementsByName("imageProject")
  
  
    

        //personal information
        console.log(dni[0].value)
        if(dni[0].value !=="" && fullName[0].value !=="" && urlImgProfile[0].value !="" )personalInformation.push({"dni":dni[0].value,"fullName": fullName[0].value,"imageUrlProfile":urlImgProfile[0].value})


        //about
        if(about.value !=="")aboutPerson.push[{"personaDescription":about[0].value}]

        //professions
        
        if(professions[0].value !=='')objProfession.push(professions[0].value)
        

        //social networks
        let socialNetworkCount =0
        console.log(socialNetworkCount)
        socialNetworkName.forEach(e=>{
          if(e.value!=='' && urlSocialNetwork[socialNetworkCount].value !=='')
            socialNetwork.push({
              "social_network_name":e.value,
              "url_social_network":urlSocialNetwork[socialNetworkCount].value
  
          })
            socialNetworkCount+=1;        
        })
  
  
        //skills
        let countSkills =0
        nameSkill.forEach(e=>{
          if(e.value !=='' && levelDomain[countSkills].value !=='0'){
            skills.push({
              "name_skill":e.value,
              "level_skill":levelDomain[countSkills].value
            })
            countSkills+=1;        
          }
        })
        
  
  
        // hobbies
  
        youHobbie.forEach(e=>{
          if(e.value !=='')hobbies.push({"hobbie":e.value})
        })
  
      
    
  
        //education
  
        let educationCount =0
        nameOfdegreeOrCourse.forEach(e=>{
          if(e.value !==''  && nameOfinstitution[educationCount].value  !=='' && descriptionOfTheDegree [educationCount].value !==''){
            education.push({
              "studyName":e.value,
              "institution":nameOfinstitution[educationCount].value,
              "description":descriptionOfTheDegree [educationCount].value
          })
            educationCount+=1
          }
        })

         //workExperiense
  
         let countCompany =0
         nameOfCompanyJob.forEach(e=>{
           if(e.value !=='' && nameOfPositonCompany[countCompany].value !=='' && roleDescriptionName[countCompany].value !==''){
             workExperiense.push({
               "companyName":e.value,
               "positonCompanyName":nameOfPositonCompany[countCompany].value,
               "description":roleDescriptionName [countCompany].value
           })
           countCompany+=1
           }
         })
     
    
  
        //services
  
        let servicesCount =0
        nameOfService.forEach(e=>{
          if(e.value !==''  && descriptionOfService[servicesCount].value !==''){
            services.push({
              "nameOfService":e.value,
              "descriptionOfService":descriptionOfService[servicesCount].value
              
          })
          servicesCount+=1
          }
        })


        
        
      
        //projects 
  
        let projectsCount  =0
        nameOfProject.forEach(e=>{
          if(e.value !==''  && DescriptionOfProject[projectsCount].value !=='' && imageProject[projectsCount].value !==''){
            projects.push({
                "nameOfProject":e.value,
                "DescriptionOfProject":DescriptionOfProject[projectsCount].value,
                "imageProjectUrl":imageProject[projectsCount].value
            })
            projectsCount+=1
          }
        })
        
        let bodyGetData ={
          //"personalInformation":personalInformation,
          "personalInformation":personalInformation,
          "objProfession":objProfession,
          "socialNetwork":socialNetwork,
          "aboutPerson":aboutPerson,
          "skills":skills,
          "hobbies":hobbies,
          "education":education,
          "workExperiense":workExperiense,
          "services":services,
          "statusPage":false
        }
        return bodyGetData
  }
  



document.getElementById("btn_send_data").addEventListener("click", (e)=> {

    

    let dataValidte = validateForm()


    if(dataValidte.value){
        e.preventDefault()
        let data = getData()
        postOne(data)
    }

    ///////
  /*   console.log(e.target)
    let vl = validateForm()
        if(vl){
        e.preventDefault()
        let data = getData()
        postOne(data)
        } */
})
   






const validateForm =() => {
    


    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation');

    // Loop over them and prevent submission
    Array.from(forms).forEach((form) => {
      form.addEventListener('submit', (event) => {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        } else {
          // Custom validation logic here
          const fields = form.querySelectorAll('input[type="text"], input[type="number"]');
          let valid = true;

          fields.forEach((field) => {
            if (field.type === 'text' && !isValidText(field.value)) {
              valid = false;
            }

            if (field.type === 'number' && !isValidNumber(field.value)) {
              valid = false;
            }
          });

          if (!valid) {
            event.preventDefault();
            event.stopPropagation();
            alert('Por favor, complete los campos correctamente.');
          }
        }

        form.classList.add('was-validated');
      }, false);
    });

    // Custom validation functions
    function isValidText(value) {
      // Verifica que el valor solo contenga letras (sin números ni caracteres especiales)
      return /^[a-zA-Z\s]+$/.test(value);
    }

    function isValidNumber(value) {
      // Verifica que el valor sea un número válido
      return !isNaN(value);
    }

    return true;
  };

 
  










//element tbody table
const tbodyTableCv = document.getElementById('tbodyTableCv')


const getDataTable =async()=>{
    //request get all profile
    let data =await getAll('profile')

    const filteredData = data.map(profile => ({
        id:profile.id,
        basic_information: profile.basic_information,
        profession_user: profile.profession_user
      })).forEach(element => {
            let htmlComponentRow =htmlCodeRowTable(element.id,element.basic_information[0]['dni'],element.basic_information[0]['fullName'],`<img  style='object-fit:container;' width='80'  class='rounded img-fluid' src='${element.basic_information[0]['imageUrlProfile']}'>`,element.profession_user)
            tbodyTableCv.appendChild(htmlComponentRow)
      });
}


//Edit APi
setTimeout(()=>{
    
    const btn_edit = document.querySelectorAll('#btn_edit').forEach(e=>{
        e.addEventListener('mousedown',async(e)=>{
    
            let idField =e.target.parentElement.parentElement.firstElementChild.textContent 
            let data = await getOne(Number(idField),'profile')
            
        
             
            const fullName =document.querySelector('input[name="fullNameEdit"]').value=data.basic_information[0].fullName
            const urlImgProfile = document.querySelector('input[name="urlImgProfileEdit"]').value=data.basic_information[0].imageUrlProfile
            
        
            



            //about
            const about =document.querySelector("textarea[name='aboutPersonEdit']").value=data.about_user
          
            //profesions
            const professions = document.querySelector('input[name="professionsEdit"]').value =data.profession_user
          
            // social network 
           
          
            if(data.social_networks_user.length >1){
                //cloning element
                const socialNetworkName = document.querySelector("input[name='socialNetworkNameEdit']")
                for(let i =1;i<data.social_networks_user.length;i++){
                    let parentt = socialNetworkName.parentElement.parentElement.parentElement
                    let parent = socialNetworkName.parentElement.parentElement.cloneNode(true)
                    parentt.appendChild(parent)
                }


                data.social_networks_user.forEach((e,index)=>{
                    document.querySelectorAll("input[name='socialNetworkNameEdit']")[index].value=e.social_network_name
                    document.querySelectorAll("input[name='urlSocialNetworkEdit']")[index].value=e.url_social_network
                })
                
                
            }
            else{
                document.querySelector("input[name='socialNetworkNameEdit']").value = data.social_networks_user[0].social_network_name
                document.querySelector("input[name='urlSocialNetworkEdit']").value =data.social_networks_user[0].url_social_network
            }




            //skills

            if(data.skills_user.length >1){
                //cloning element
                const nameSkill = document.querySelector("input[name='nameSkillEdit']")
                for(let i =1;i<data.skills_user.length;i++){
                    let parentt = nameSkill.parentElement.parentElement.parentElement
                    let parent = nameSkill.parentElement.parentElement.cloneNode(true)
                    parentt.appendChild(parent)
                }


                data.skills_user.forEach((e,index)=>{
                    document.querySelectorAll("input[name='nameSkillEdit']")[index].value=e.name_skill
                    document.querySelectorAll("input[name='levelDomainEdit']")[index].value=e.level_skill
                })
                
                
            }
            else{
                document.querySelector("input[name='nameSkillEdit']").value = data.skills_user[0].name_skill
                document.querySelector("input[name='levelDomainEdit']").value =data.skills_user[0].level_skill
            }

           
          
          
            //hobbies
            
          
           
            if(data.hobbies_user.length >1){
                //cloning element
                const hobbies_user = document.querySelector("input[name='youHobbieEdit']")
                for(let i =1;i<data.hobbies_user.length;i++){
                    let parentt = hobbies_user.parentElement.parentElement.parentElement
                    let parent = hobbies_user.parentElement.parentElement.cloneNode(true)
                    parentt.appendChild(parent)
                }


                data.hobbies_user.forEach((e,index)=>{
                    document.querySelectorAll("input[name='youHobbieEdit']")[index].value=e.hobbie
                    document.querySelectorAll("input[name='youHobbieEdit']")[index].value=e.hobbie
                })               
                
            }
            else{
                document.querySelector("input[name='youHobbieEdit']").value = data.hobbies_user[0].hobbie
                document.querySelector("input[name='youHobbieEdit']").value =data.hobbies_user[0].hobbie
            }




            //work experiense
            


            if(data.workExperiense_user.length >1){
                //cloning element
                const nameOfCompanyJob = document.querySelector("input[name='nameOfPositonCompanyEdit']")
                for(let i =1;i<data.workExperiense_user.length;i++){
                    let parentt = nameOfCompanyJob.parentElement.parentElement.parentElement
                    let parent = nameOfCompanyJob.parentElement.parentElement.cloneNode(true)
                    parentt.appendChild(parent)
                }


                data.workExperiense_user.forEach((e,index)=>{
                    document.querySelectorAll("input[name='nameOfPositonCompanyEdit']")[index].value=e.companyName
                    document.querySelectorAll("input[name='nameOfCompanyJobEdit']")[index].value=e.positonCompanyName
                    document.querySelectorAll("textarea[name='roleDescriptionNameEdit']")[index].value=e.description
                })               
                
            }
            else{

                document.querySelector("input[name='nameOfPositonCompanyEdit']").value=data.workExperiense_user[0].companyName
                document.querySelector("input[name='nameOfCompanyJobEdit']").value=data.workExperiense_user[0].positonCompanyName
                document.querySelector("textarea[name='roleDescriptionNameEdit']").value=data.workExperiense_user[0].description    
            }


            //education
            if(data.education_user.length >1){
                //cloning element
                const education_user = document.querySelector("input[name='nameOfdegreeOrCourseEdit']")
                for(let i =1;i<data.education_user.length;i++){
                    let parentt = education_user.parentElement.parentElement.parentElement
                    let parent = education_user.parentElement.parentElement.cloneNode(true)
                    parentt.appendChild(parent)
                }


                data.education_user.forEach((e,index)=>{
                    document.querySelectorAll("input[name='nameOfdegreeOrCourseEdit']")[index].value=e.studyName
                    document.querySelectorAll("input[name='nameOfinstitutionEdit']")[index].value=e.institution
                    document.querySelectorAll("textarea[name='descriptionOfTheDegreeEdit']")[index].value=e.description
                })               
                
            }
            else{

                document.querySelector("input[name='nameOfdegreeOrCourseEdit']").value= data.education_user[0].studyName
                document.querySelector("input[name='nameOfinstitutionEdit']").value= data.education_user[0].institution
                document.querySelector("textarea[name='descriptionOfTheDegreeEdit']").value= data.education_user[0].description

            
            }
        
            
        
          
            //services
            
            if(data.services_user.length >1){
                //cloning element
                const nameOfService = document.querySelector("input[name='nameOfServiceEdit']")
                for(let i =1;i<data.services_user.length;i++){
                    let parentt = nameOfService.parentElement.parentElement.parentElement
                    let parent = nameOfService.parentElement.parentElement.cloneNode(true)
                    parentt.appendChild(parent)
                }


                data.services_user.forEach((e,index)=>{
                    document.querySelectorAll("input[name='nameOfServiceEdit']")[index].value=e.nameOfService
                    document.querySelectorAll("textarea[name='descriptionOfServiceEdit']")[index].value=e.descriptionOfService
                    
                })               
            }
            else{
                document.querySelector("input[name='nameOfServiceEdit']").value=data.services_user[0].nameOfService
                document.querySelector("textarea[name='descriptionOfServiceEdit']").value=data.services_user[0].descriptionOfService
                
            }

            document.getElementById("btn_confirm_data_edit").addEventListener('mousedown',()=>{
                
                    //objects 
                    let personalInformation =[]
                    let objProfession =''
                    let socialNetwork =[]
                    let aboutPerson =''
                    let skills =[]
                    let hobbies =[]
                    let education =[]
                    let workExperiense =[]
                    let services = []
                    
                
                
                    //personaInformation
                    const dni = document.getElementsByName('dniEdit')
                    const fullName =document.getElementsByName("fullNameEdit")
                    const urlImgProfile = document.getElementsByName('urlImgProfileEdit')
                
                    //about
                    const about =document.getElementsByName("aboutPersonEdit")
                  
                    //profesions
                    const professions = document.getElementsByName('professionsEdit')
                  
                    // social network 
                    const socialNetworkName =document.getElementsByName("socialNetworkNameEdit")
                    const urlSocialNetwork = document.getElementsByName("urlSocialNetworkEdit")
                  
                    //skills
                    const nameSkill = document.getElementsByName("nameSkillEdit")
                    const levelDomain =document.getElementsByName("levelDomainEdit")
                  
                  
                    //hobbies
                    const youHobbie = document.getElementsByName("youHobbieEdit")
                  
                   
                  
                    //education
                    const nameOfdegreeOrCourse = document.getElementsByName("nameOfdegreeOrCourseEdit")
                    const nameOfinstitution = document.getElementsByName("nameOfinstitutionEdit")
                    const descriptionOfTheDegree = document.getElementsByName("descriptionOfTheDegreeEdit")
                
                    //work experiense
                    const nameOfCompanyJob = document.getElementsByName("nameOfCompanyJobEdit")
                    const  nameOfPositonCompany = document.getElementsByName("nameOfPositonCompanyEdit")
                    const roleDescriptionName = document.getElementsByName("roleDescriptionNameEdit")
                
                  
                    //services
                    const nameOfService = document.getElementsByName("nameOfServiceEdit")
                    const descriptionOfService = document.getElementsByName("descriptionOfServiceEdit")
                  
                   
                  
                  
                    
                
                        //personal information
                        if(dni[0].value !=='' && fullName[0].value !=="" && urlImgProfile[0].value !="" )personalInformation.push({"fullName": fullName[0].value,"imageUrlProfile":urlImgProfile[0].value})

                        
                
                
                        //about
                        if(about.value !=="")aboutPerson =about[0].value
                
                        //professions
                        
                        if(professions[0].value !=='')objProfession =professions[0].value
                        
                
                        //social networks
                        let socialNetworkCount =0
                        console.log(socialNetworkCount)
                        socialNetworkName.forEach(e=>{
                          if(e.value!=='' && urlSocialNetwork[socialNetworkCount].value !=='')
                            socialNetwork.push({
                              "social_network_name":e.value,
                              "url_social_network":urlSocialNetwork[socialNetworkCount].value
                  
                          })
                            socialNetworkCount+=1;        
                        })
                  
                  
                        //skills
                        let countSkills =0
                        nameSkill.forEach(e=>{
                          if(e.value !=='' && levelDomain[countSkills].value !=='0'){
                            skills.push({
                              "name_skill":e.value,
                              "level_skill":levelDomain[countSkills].value
                            })
                            countSkills+=1;        
                          }
                        })
                        
                  
                  
                        // hobbies
                  
                        youHobbie.forEach(e=>{
                          if(e.value !=='')hobbies.push({"hobbie":e.value})
                        })
                  
                      
                    
                  
                        //education
                  
                        let educationCount =0
                        nameOfdegreeOrCourse.forEach(e=>{
                          if(e.value !==''  && nameOfinstitution[educationCount].value  !=='' && descriptionOfTheDegree [educationCount].value !==''){
                            education.push({
                              "studyName":e.value,
                              "institution":nameOfinstitution[educationCount].value,
                              "description":descriptionOfTheDegree [educationCount].value
                          })
                            educationCount+=1
                          }
                        })
                
                         //workExperiense
                  
                         let countCompany =0
                         nameOfCompanyJob.forEach(e=>{
                           if(e.value !=='' && nameOfPositonCompany[countCompany].value !=='' && roleDescriptionName[countCompany].value !==''){
                             workExperiense.push({
                               "companyName":e.value,
                               "positonCompanyName":nameOfPositonCompany[countCompany].value,
                               "description":roleDescriptionName [countCompany].value
                           })
                           countCompany+=1
                           }
                         })
                     
                    
                  
                        //services
                  
                        let servicesCount =0
                        nameOfService.forEach(e=>{
                          if(e.value !==''  && descriptionOfService[servicesCount].value !==''){
                            services.push({
                              "nameOfService":e.value,
                              "descriptionOfService":descriptionOfService[servicesCount].value
                              
                          })
                          servicesCount+=1
                          }
                        })
                
                
                        
                        
                      
                        
                        
                        let bodyGetData ={
                          "basic_information":personalInformation,
                          "profession_user":objProfession,
                          "social_networks_user":socialNetwork,
                          "about_user":aboutPerson,
                          "skills_user":skills,
                          "hobbies_user":hobbies,
                          "education_user":education,
                          "workExperiense_user":workExperiense,
                          "services_user":services,
                          "statusPage":false
                        }
                        console.log(bodyGetData)

                        putOne(Number(idField),'profile',bodyGetData)
                  
                
            })


        })
        
    
    })
   
   
    const btn_delete = document.querySelectorAll('#btn_delete').forEach(e=>{

        e.addEventListener('click',(event)=>{
            let idField =event.target.parentElement.parentElement.firstElementChild.textContent 
            document.getElementById('btn_delete_data').addEventListener('click',()=>{
            deleteOne("profile",Number(idField))
             })
        })
    })


    const view_cv = document.querySelectorAll('#view_cv').forEach(e=>{
        e.addEventListener('click',(event)=>{
            let idField =event.target.parentElement.parentElement.firstElementChild.textContent 
            sessionStorage.setItem('idPorta',idField)
            window.open('../views/template.html')
        })
    })
    

},1000)





getDataTable()