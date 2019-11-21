/* eslint-disable strict */
const express = require('express');
const AnointmentsService = require('./anointments-service');
const { requireAuth } = require('../middleware/jwt-auth.js');

const anointmentsRouter = express.Router();

anointmentsRouter
  .route('/')
  .all(requireAuth)
  .get((req, res, next) => {
    AnointmentsService.getAllAnointments(req.app.get('db'), req.query)
      .then(result => {
        res.json(result);
      })
      .catch(next);
  });

module.exports = anointmentsRouter;
