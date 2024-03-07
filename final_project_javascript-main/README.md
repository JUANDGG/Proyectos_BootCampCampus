# **personal income registration application**

This application is responsible for recording the income and expenses of a person.

## technologies used

+ **Html 5**
+ **Css 3**
+ **Boobstrap 5**
+ **Javascript**
+ **json server**



## **Project objectives**
create a site which serves for the creation of curriculums vitae in a fast and agile way.

## **Repository content**
+ `views/index.html` : this is the script view of the project
+ `modules/components.js` :is a script in charge of generating the html code that will be injected through javaScript to the html.  
+ `modules/app.js` :is a main script on which the whole project depends.


## **how the project works**



the project works based on the consumption of a fake local api created by json server, which I consume in the modules/core.js script so I bring it to the client view through the html code that is injected in the index.html script, the code that is injected is in the modules/components.js. section.

in this version of the project I do not save the data in mockapi, but I do it locally so I use a json script configured with json server to mount a local server in the form of api rest which I consume locally and I define in it the crud operations.


## Api used
 
```
 http://localhost:3000/user 

```


## screenshots of the application
**view Home page**
![Alt text](<Screenshot from 2023-10-12 10-40-17.png>)
**view edit home page**
![Alt text](<Screenshot from 2023-10-12 10-40-58.png>)
**view Delete home page**
![Alt text](<Screenshot from 2023-10-12 10-41-23.png>)
