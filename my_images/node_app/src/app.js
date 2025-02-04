const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

<<<<<<< HEAD
app.use(express.static(path.join(__dirname, 'public')));

=======
// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Default route to serve index.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

>>>>>>> d96b3c10530d1200dc9049368c61f3be60020f37
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});