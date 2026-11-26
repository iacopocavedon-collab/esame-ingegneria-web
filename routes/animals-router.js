import express from 'express';
import * as animalsController from '../controllers/animals-controller.js'

const router = express.Router();
router.get('/api/animals', animalsController.AllAnimals);

export default router;