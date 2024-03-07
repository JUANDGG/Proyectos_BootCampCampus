# **Pokemon front-end application**
this application is responsible for displaying the pokemon so many images, names and statistics of each one, also has the functionality to save your own statistics, it should be noted that this application is brought to all existing pokemon in the pokemon api api in total there are 1300 pokemon.

## technologies used

+ **Html 5**
+ **Css 3**
+ **Javascript**
+ **sweet alert 2**


## **Project objectives**
Display on the client side the pokemon with their stats 

## **Repository content**
+ `img` :is the uploaded folder of the project images
+ `index.html` : this is the script view of the project
+ `style.css` : is the script in charge of the project styles.
+ `components.js` :is a script in charge of generating the html code that will be injected through javaScript to the html.  
+ `app.js` :is a main script on which the whole project depends.


## **how the project works**
the project works as follows :

the project works based on the consumption of the popular api called poke api, which I consume in the `app.js` script so that I bring it to the client view by means of the html code that is injected in the `index.html` script, the code that is injected is in the `components.js` section. 

also the project in this **version** manages pokemon statistics saving queries for this I make use of `mockapi`.

## Apis used
+ `mockAPi` : ```https://6509ceb4f6553137159c0dc7.mockapi.io/api/usuarios/pokeStats```
+ `pokeApi` :```https://pokeapi.co/api/v2/pokemon```

## screenshots of the application
**view Home page**

![Alt text](<./img/homePage.png>)

**view Cards stats**

![Alt text](<./img/card.png>)