var ClasseShad = require("../index.js")
let receiver = new ClasseShad()
receiver.onMessage((buff)=>{
    console.log("recebido", buff.toString())
})
receiver.subscribe("xxxx")

setInterval(()=>{
    receiver.spin()
}, 1000)