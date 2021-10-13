const chmodr = require("chmodr");

chmodr(__dirname, 0o777, (err) => {
    if (err){
        console.log("Failed to execute chmod", err);
    } else {
        console.log("Success");
    }
})