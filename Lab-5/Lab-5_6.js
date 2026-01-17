// 6) Create an EventEmitter instance, Register an event "greet" and print a message when 
// triggered. Fire that event manually using .emit().(B) 
const EventEmitter = require('events');
const emitter = new EventEmitter();
emitter.on('greet',(data)=>{
    console.log(data);
})
setInterval(()=>{

    setTimeout((e)=>{
        emitter.emit('greet','Vidit',5000);
    },5000);
})