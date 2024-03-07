# **personal income registration application**

This application is responsible for recording the income and expenses of a person.

## technologies used

+ **Html 5**
+ **Css 3**
+ **Boobstrap 5**
+ **Javascript**



## **Project objectives**
add modify delete and search for income or expenses of a person

## **Repository content**
+ `img` :is the uploaded folder of the project images
+ `index.html` : this is the script view of the project
+ `style.css` : is the script in charge of the project styles.
+ `modules/components.js` :is a script in charge of generating the html code that will be injected through javaScript to the html.  
+ `modules/app.js` :is a main script on which the whole project depends.


## **how the project works**

the project works as follows :

the project works based on the consumption of an api which is a free api called ` mock api ` , which I consume in the script `modules/app.js` and later I store in the localStorage so that I can have the `crud ` functions thanks to the consumption of the same one, I bring the stored data to the client view by means of the html code that is injected in the script `index.html`, the code that is injected is in the section `modules/components.js` 

## Api used
+ `mockAPi` : 
```
https://6509ceb4f6553137159c0dc7.mockapi.io/api/usuarios/usuario

```


## screenshots of the application
**view Home page**

![Alt text](<./img/imgAFF.jpg>)

