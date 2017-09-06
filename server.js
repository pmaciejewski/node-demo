'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
    console.log('/ opened\n')
    res.send(`
    <p>Hello PTaQ!</p>
    <iframe 
        src="https://giphy.com/embed/3oriO0OEd9QIDdllqo" 
        width="480" 
        height="477" 
        frameBorder="0" 
        class="giphy-embed" allowFullScreen>
    </iframe>`)
})

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);