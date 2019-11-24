/* eslint-disable strict */
const express = require('express');
const bodyParser = express.json();
const path = require('path');
const CharactersService = require('./characters-service');
const { requireAuth } = require('../middleware/jwt-auth.js');

const charactersRouter = express.Router();

charactersRouter
  .route('/')
  .all(requireAuth)
  .get((req, res, next) => {
    console.log(req.user.id);
    CharactersService.getAllUserCharacters(req.app.get('db'), req.user.id)
      .then(chars => {
        res.json(CharactersService.serializeCharacters(chars));
      })
      .catch(next);
  })
  .post(bodyParser, (req, res, next) => {
    const { character, character_name } = req.body;
    const newChar = { character, character_name };

    for (const [key, value] of Object.entries(newChar))
      if (value == null)
        return res.status(400).json({
          error: `Missing '${key}' in request body`
        });

    newChar.user_id = req.user.id;

    CharactersService.insertCharacter(req.app.get('db'), newChar)
      .then(char => {
        res
          .status(201)
          .location(path.posix.join(req.originalUrl, `/${char[0].id}`))
          .json(CharactersService.serializeCharacter(char[0]));
      })
      .catch(next);
  });

module.exports = charactersRouter;
