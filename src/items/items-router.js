/* eslint-disable strict */
const express = require('express');
const ItemsService = require('./items-service');
const { requireAuth } = require('../middleware/jwt-auth.js');

const ItemsRouter = express.Router();

ItemsRouter.route('/weapons')
  .all(requireAuth)
  .get((req, res, next) => {
    ItemsService.getAllWeapons(req.app.get('db'), req.query)
      .then(wpns => {
        res.json(ItemsService.serializeWeapons(wpns));
      })
      .catch(next);
  });

ItemsRouter.route('/weapons/prefixes/:mfr_id')
  .all(requireAuth)
  .get((req, res, next) => {
    ItemsService.getPrevixesByMfr(req.app.get('db'), req.params.mfr_id)
      .then(prfxs => {
        res.json(prfxs);
      })
      .catch(next);
  });

ItemsRouter.route('/shields')
  .all(requireAuth)
  .get((req, res, next) => {
    ItemsService.getAllShields(req.app.get('db'), req.query)
      .then(shields => {
        res.json(ItemsService.serializeShields(shields));
      })
      .catch(next);
  });

module.exports = ItemsRouter;
