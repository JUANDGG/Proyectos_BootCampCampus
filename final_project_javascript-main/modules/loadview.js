import {
  getAll,
  getOne,
  postOne,
  deleteOne,
  putOne
} from './request.js';


const componentEducation = (nameInstitution,grade,desc) => {
  return `
  <li>
    <h3>${nameInstitution}</h3>
    <p>${grade}</p>
    <p>${desc}</p>
  </li>
  `;
};

const componentWorkExperiense= (nameInstitution,grade,desc) => {
  return `
  <li>
    <h3>${nameInstitution}</h3>
    <p>${grade}</p>
    <p>${desc}</p>
  </li>
  `;
};

const componetSkills =(nameSkill,valueSkill)=>{
  return `
    <<p>${nameSkill}</p>
    <div class="progress" role="progressbar" aria-label="Example with label" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar" style="width: ${valueSkill}">${valueSkill}</div>
    </div>
  
  `
}

const componentHobbie =(nameHobbie)=>{
    return `<li>${nameHobbie}</li>`
}


const componetServices =(nameService,descService)=>{
  return ` 
    <li>
      <p>${nameService}</p>
      <p>${descService}</p>
    </li>
  
  `
}
  

const postDta =async()=>{
  let getDataSeccion = sessionStorage.getItem('idPorta');
  let data = await getOne(Number(getDataSeccion), 'profile');
  document.getElementById('imgPortafol').src = data.basic_information[0].imageUrlProfile
  document.getElementById('namePort').textContent =data.basic_information[0].fullName
  document.getElementById('professionPort').textContent =data.profession_user
  document.getElementById('aboutPort').textContent =data.about_user


  data.education_user.forEach(element => {
    let cp = componentEducation(element.studyName,element.institution,element.description)
    document.getElementById('education').innerHTML +=cp

  });


  data.workExperiense_user.forEach(element => {
    let cp = componentWorkExperiense(element.companyName,element.positonCompanyName,element.description)
    document.getElementById('workExperiense').innerHTML +=cp

  });

  data.skills_user.forEach(element => {
    let cp = componetSkills(element.name_skill,element.level_skill)
    document.getElementById('skillsProfile').innerHTML +=cp

  });


  

  data.hobbies_user.forEach(element => {
    let cp = componentHobbie(element.hobbie)
    document.getElementById('hobbiesPorta').innerHTML +=cp

  });

  data.services_user.forEach(element => {
    let cp = componetServices(element.nameOfService,element.descriptionOfService)
    document.getElementById('servicesPorta').innerHTML +=cp
    
  });



}


postDta()











