import express from 'express';
import * as animalsController from '../controllers/animals-controller.js'

const router = express.Router();
router.get('/api/animals', animalsController.AllAnimals);
router.get('/api/animals/elephants', animalsController.AllElephants);
router.get('/api/animals/giraffes', animalsController.AllGiraffes);
router.get('/api/animals/monkeys', animalsController.AllMonkeys);
router.get('/api/animals/zebras', animalsController.AllZebras);
router.get('/api/animals/turtles', animalsController.AllTurtles);

export default router;