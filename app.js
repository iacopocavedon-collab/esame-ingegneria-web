import express from 'express';
import animalsRouter from './routes/animals-router.js'
import dispencersRouter from './routes/dispencers-router.js'

const app = express();
const port = 3000;
app.use(express.static('public'));

app.use(animalsRouter);
app.use(dispencersRouter);


app.use((req,res,next) =>{
    res.setHeader('Content-Type', 'text/plain');
    res.status(404).send('Pagina non trovata'); // Error 404 
})

app.listen(port, () => {
    console.log('Server is running on port '+port); 
})