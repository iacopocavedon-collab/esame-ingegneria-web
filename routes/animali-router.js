import express from 'express';
import * as animaliController from '../controllers/animali-controller.js'

const router = express.Router();
router.get('/api/animali', animaliController.AllAnimals);

export default router;