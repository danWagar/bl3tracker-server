const express = require('express');
const ItemsService = require('./items-service');
const { requireAuth } = require('../middleware/jwt-auth.js');

const ItemsRouter = express.Router();

ItemsRouter.route('/').get((req, res, next) => {
  ItemsService.getAllItems(req.app.get('db'))
    .then(items => {
      res.json(ItemsService.serializeItems(items));
    })
    .catch(next);
});

ItemsRouter.route('/:thing_id')
  .all(requireAuth)
  .all(checkThingExists)
  .get((req, res) => {
    res.json(ItemsService.serializeThing(res.thing));
  });

ItemsRouter.route('/:thing_id/reviews/')
  .all(requireAuth)
  .all(checkThingExists)
  .get((req, res, next) => {
    ItemsService.getReviewsForThing(req.app.get('db'), req.params.thing_id)
      .then(reviews => {
        res.json(ItemsService.serializeThingReviews(reviews));
      })
      .catch(next);
  });

/* async/await syntax for promises */
async function checkThingExists(req, res, next) {
  try {
    const thing = await ItemsService.getById(req.app.get('db'), req.params.thing_id);

    if (!thing)
      return res.status(404).json({
        error: `Thing doesn't exist`
      });

    res.thing = thing;
    next();
  } catch (error) {
    next(error);
  }
}

module.exports = ItemsRouter;
