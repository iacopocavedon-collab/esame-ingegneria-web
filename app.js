import express from 'express';
import animaliRouter from './routes/animali-router.js'

const app = express();
const port = 3000;
app.use(express.static('public'));

app.use(animaliRouter);

app.use((req,res,next) =>{
    res.setHeader('Content-Type', 'text/plain');
    res.status(404).send('Pagina non trovata'); // Error 404 
})

app.listen(port, () => {
    console.log('Server is running on port '); 
})