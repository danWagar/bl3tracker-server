/* eslint-disable strict */
const express = require('express');
const bodyParser = express.json();
const path = require('path');
const InventoryService = require('./inventory-service');
const { requireAuth } = require('../middleware/jwt-auth.js');

const inventoryRouter = express.Router();

inventoryRouter
  .route('/weapons')
  .all(requireAuth)
  /*.get((req, res, next) => {
    InventoryService.getAllWeaponInventory(req.app.get('db'), req.user.id)
      .then(inv => {
        res.json(InventoryService.serializeInventory(inv));
      })
      .catch(next);
  })
  
  */
  .post(bodyParser, (req, res, next) => {
    const {
      char_id,
      weapon_id,
      prefix_1,
      prefix_2,
      element,
      anointment_id,
      item_score,
      damage,
      accuracy,
      handling,
      reload_time,
      fire_rate,
      magazine_size
    } = req.body;

    const newWeapon = {
      char_id,
      weapon_id,
      prefix_1,
      prefix_2,
      element,
      anointment_id,
      item_score,
      damage,
      accuracy,
      handling,
      reload_time,
      fire_rate,
      magazine_size
    };

    const required = {
      weapon_id
    };

    for (const [key, value] of Object.entries(required))
      if (value == null)
        return res.status(400).json({
          error: `Missing '${key}' in request body`
        });

    newWeapon.user_id = req.user.id;

    InventoryService.insertWeapon(req.app.get('db'), newWeapon)
      .then(weapon => {
        res
          .status(201)
          .location(path.posix.join(req.originalUrl, `/${weapon[0].id}`))
          .json(InventoryService.serializeWeapon(weapon[0]));
      })
      .catch(next);
  });

inventoryRouter
  .route('/weapons/:char_id')
  .all(requireAuth)
  .get((req, res, next) => {
    InventoryService.getCharacterWeaponInventory(req.app.get('db'), req.user.id, req.params.char_id)
      .then(weapons => {
        res.json(InventoryService.serializeWeapons(weapons));
      })
      .catch(next);
  });

module.exports = inventoryRouter;
