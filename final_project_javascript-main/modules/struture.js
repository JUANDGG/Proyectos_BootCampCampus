const structure={
    book:{
        "title_book":"string",
        "number_pages":"number",
        "isbn":"string",
        "date":"date",
        //foreign keys
        "categoryId":"number",
        "authorId":"number",
        "book_statusId":"number",    
        "publisherId":"number"
    },

    
    book_status:{
        "name":"string",
        "description": "string"
    },

    category:{
        "name":"string"
    },

    publisher:{
        "name":"string",
        "address":"string",
        "phone":"string"
    }
    ,
    loan :{
        //foreign keys
        "userId":"number",
        "bookId":"number",
        "loan_date":"string",
        "return_date":"string",
        "status":"string"

    },
    
    reservation :{
        //foreign keys
        "userId":"number",
        "bookId":"number",
        "reservation_date":"string",
        "reservation_date_end":"string",
        "status":"string"

    },

    author :{   
        "name":"string",
        "last_name":"string",
        "nacionality":"string"
    },

    user :{   
        "name":"string",
        "last_name":"string",
        "address":"string",
        "phone":"string",
        "email":"string"
    }
}


export{structure}