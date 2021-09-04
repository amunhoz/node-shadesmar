var ClasseShad = require("../index.js")
let sender = new ClasseShad()
let receiver = new ClasseShad()
receiver.onMessage((buff)=>{
    console.log(buff.toString())
})
receiver.subscribe("xxxx")

setInterval(()=>{
    sender.publish("xxxx", Buffer.from("aaaaaaaaaaaaa"))    
}, 3000)
setInterval(()=>{
    receiver.spin()
}, 1000)