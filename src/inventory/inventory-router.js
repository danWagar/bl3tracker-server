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

    const required = { char_id, weapon_id };

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

//Here param id is oveloaded, for get it refers to char_id, otherwise it refers
//to id of user_weapons
inventoryRouter
  .route('/weapons/:id')
  .all(requireAuth)
  .get((req, res, next) => {
    InventoryService.getCharacterWeaponInventory(req.app.get('db'), req.user.id, req.params.id)
      .then(weapons => {
        res.json(InventoryService.serializeWeapons(weapons));
      })
      .catch(next);
  })
  .all((req, res, next) => {
    InventoryService.getWeaponById(req.app.get('db'), req.params.id)
      .then(wpn => {
        if (!wpn) return res.status(404).json({ errors: { message: 'Weapon does not exist' } });

        res.weapon = wpn;
        next();
      })
      .catch(next);
  })
  .patch(bodyParser, (req, res, next) => {
    InventoryService.updateWeapon(req.app.get('db'), req.params.id, req.body)
      .then(() => res.status(204).end())
      .catch(next);
  })
  .delete((req, res, next) => {
    InventoryService.deleteWeapon(req.app.get('db'), req.params.id)
      .then(() => res.status(204).end())
      .catch(next);
  });

inventoryRouter
  .route('/shields')
  .all(requireAuth)
  .post(bodyParser, (req, res, next) => {
    console.log('inserting shield ', req.body);
    const {
      char_id,
      shield_id,
      prefix,
      element,
      anointment_id,
      item_score,
      capacity,
      recharge_delay,
      recharge_rate
    } = req.body;

    const newShield = {
      char_id,
      shield_id,
      prefix,
      element,
      anointment_id,
      item_score,
      capacity,
      recharge_delay,
      recharge_rate
    };

    const required = { char_id, shield_id };

    for (const [key, value] of Object.entries(required))
      if (value == null)
        return res.status(400).json({
          error: `Missing '${key}' in request body`
        });

    newShield.user_id = req.user.id;

    InventoryService.insertShield(req.app.get('db'), newShield)
      .then(shield => {
        res
          .status(201)
          .location(path.posix.join(req.originalUrl, `/${shield[0].id}`))
          .json(InventoryService.serializeShield(shield[0]));
      })
      .catch(next);
  });
//Here param id is oveloaded, for get it refers to char_id, otherwise it refers
//to id of user_shields
inventoryRouter
  .route('/shields/:id')
  .all(requireAuth)
  .get((req, res, next) => {
    InventoryService.getCharacterShieldInventory(req.app.get('db'), req.user.id, req.params.id)
      .then(shields => {
        res.json(InventoryService.serializeShields(shields));
      })
      .catch(next);
  })
  .all((req, res, next) => {
    InventoryService.getShieldById(req.app.get('db'), req.params.id)
      .then(shield => {
        if (!shield) return res.status(404).json({ errors: { message: 'Shield does not exist' } });

        res.shield = shield;
        next();
      })
      .catch(next);
  })
  .patch(bodyParser, (req, res, next) => {
    InventoryService.updateShield(req.app.get('db'), req.params.id, req.body)
      .then(() => res.status(204).end())
      .catch(next);
  })
  .delete((req, res, next) => {
    InventoryService.deleteShield(req.app.get('db'), req.params.id)
      .then(() => res.status(204).end())
      .catch(next);
  });

module.exports = inventoryRouter;
