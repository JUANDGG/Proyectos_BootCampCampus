


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
  



    document.getElementById("btn_send").addEventListener("click", (e)=> {
      e.preventDefault()
      let data = getData()
      if(data)
        postOne(data)
    })
   




function validateForm() {
    const fields = document.querySelectorAll(
        'input[type="text"], input[type="number"], input[type="url"]'
    );
    let isValid = true;

    fields.forEach((field) => {
        if (field.type === "text" && !isValidText(field.value)) {
            isValid = false;
        } else if (field.type === "number" && !isValidNumber(field.value)) {
            isValid = false;
        } else if (field.type === "url" && !isValidURL(field.value)) {
            isValid = false;
        }

        field.addEventListener("input", function () {
            if (field.type === "text" && !isValidText(field.value)) {
                field.setCustomValidity("Este campo debe contener solo texto.");
            } else if (field.type === "number" && !isValidNumber(field.value)) {
                field.setCustomValidity("Este campo debe contener solo números.");
            } else {
                field.setCustomValidity("");
            }
        });
    });

    if (!isValid) {
        alert("Por favor, complete los campos correctamente.");
    }

    return isValid;
}

function isValidText(value) {
    return /^[a-zA-Z\s]+$/.test(value);
}

function isValidNumber(value) {
    return !isNaN(value);
}

function isValidURL(value) {
    return /^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$/.test(value);
}



 
  


//value post
const postOne = async(data)=>{
  await (await fetch('http://localhost:3000/profile', {
    method:'POST',
    headers: { "content-type": "application/json" },
    body:JSON.stringify(data)
  }))
}
  
  