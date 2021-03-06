/* eslint-disable strict */
require('dotenv').config();
const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const helmet = require('helmet');
const { NODE_ENV } = require('./config');
const itemsRouter = require('./items/items-router');
const authRouter = require('./auth/auth-router');
const usersRouter = require('./users/users-router');
const charactersRouter = require('./characters/characters-router');
const anointmentsRouter = require('./anointments/anointments-router');
const inventoryRouter = require('./inventory/inventory-router');

const app = express();

app.use(
  morgan(NODE_ENV === 'production' ? 'tiny' : 'common', {
    skip: () => NODE_ENV === 'test'
  })
);
app.use(cors());
app.use(helmet());

app.use('/api/items', itemsRouter);
app.use('/api/auth', authRouter);
app.use('/api/users', usersRouter);
app.use('/api/characters', charactersRouter);
app.use('/api/anointments', anointmentsRouter);
app.use('/api/inventory', inventoryRouter);

app.use(function errorHandler(error, req, res, next) {
  let response;
  if (NODE_ENV === 'production') {
    response = { error: 'Server error' };
  } else {
    console.error(error);
    response = { error: error.message, object: error };
  }
  res.status(500).json(response);
});

module.exports = app;
