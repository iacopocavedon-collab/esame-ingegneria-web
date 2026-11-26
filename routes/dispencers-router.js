import express from 'express';
import * as eventsController from '../controllers/events-controller.js'
import * as dispencersController from '../controllers/dispencer-controller.js'
import * as planning_dispencersController from '../controllers/planning_dispencers-controller.js'
import * as sensorsController from '../controllers/sensors-controller.js'
import * as maintenanceController from '../controllers/maintenance-controller.js'

const router = express.Router();
router.get('/api/dispencers', eventsController.AllEvents, dispencersController.AllDispencer, planning_dispencersController.AllPlanningDispencers,sensorsController.AllSensors, maintenanceController.AllMaintenance);

export default router;