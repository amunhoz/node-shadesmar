var ClasseShad = require("../index.js")
let sender = new ClasseShad()
setInterval(()=>{
    sender.publish("xxxx", Buffer.from("aaaaaaaaaaaaa"))    
}, 3000)