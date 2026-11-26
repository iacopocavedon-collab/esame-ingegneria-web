import express from 'express';
import * as enclosuresController from '../controllers/enclosures-controller.js'

const router = express.Router();
router.get('/api/enclosures', enclosuresController.AllEnclosures);
router.get('/api/enclosures/elephants', enclosuresController.AllElephants);
router.get('/api/enclosures/giraffes', enclosuresController.AllGiraffes);
router.get('/api/enclosures/monkeys', enclosuresController.AllMonkeys);
router.get('/api/enclosures/zebras', enclosuresController.AllZebras);
router.get('/api/enclosures/turtles', enclosuresController.AllTurtles);

export default router;