**Semana 04 - Aula 01**

const express = require ('express');
const server = express();

server.get ("/boas tardes", (req,res) =>{
res.send('servidor funcionando')

})
server.listen(3000,() => {
console.log('servidor "ta legal" na porta 3000')
})