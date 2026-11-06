const express = require('express');

const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
    res.json({
        message: 'Hello from Docker!',
        node_version: process.version
    });
});

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});