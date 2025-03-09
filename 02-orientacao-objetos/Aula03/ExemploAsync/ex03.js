//callback

const fs = require('fs')

fs.readFile(
    'ex01_textoQualquer.txt', 
    (err, buf) => {
        if(err)
            throw err
        else
            console.log(buf.toString())
    })