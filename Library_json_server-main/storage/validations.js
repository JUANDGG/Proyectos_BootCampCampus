//validates the structure so that it accepts no more objects

const structValidate = (object) => {
    if (typeof object !== "object" || Object.keys(object).length === 0) throw { status: 400, message: "Invalid structure" };
    return true;
};



//field validation of the strutur

const validateField = ({ fildNameStruct, valueFieldUser, DatentypStruct }) => {

    if ((valueFieldUser === null || valueFieldUser === "") || (fildNameStruct === undefined)) throw { status: 400, message: "indefinite values" }

    if (Datentyp == "date") {
        //format date
        const dateFormat = /^\d{4}-\d{2}-\d{2}$/
        if (dateFormat.test(valueFieldUser)) {
            valueFieldUser = new Date(valueFieldUser)
            if (isNaN(valueFieldUser.getTime()) || !(valueFieldUser.getFullYear() <= 2040)) throw { status: 400, message: "invalid date" }
        }
        else throw { status: 400, message: "the date format entered only counts with the year, make sure that the date entered has the format yyyy-mm-dd" }
    }

    if (valueFieldUser.constructor.name.toLowerCase() !== DatentypStruct) throw { status: 400, message: "data with data types different from the parent structure" }
    return { [fildNameStruct]: valueFieldUser.constructor.name.toLowerCase() === "date" ? valueFieldUser.toISOString().split('T')[0] : valueFieldUser }
}


export {
    structValidate,
    validateField
}