const express = require('express');
const WeaponsService = require('./weapons-service');
const { requireAuth } = require('../middleware/jwt-auth.js');

const WeaponsRouter = express.Router();

WeaponsRouter.route('/')
  .all(requireAuth)
  .get((req, res, next) => {
    WeaponsService.getAllWeapons(req.app.get('db'))
      .then(weapons => {
        res.json(WeaponsService.serializeWeapons(weapons));
      })
      .catch(next);
  });

WeaponsRouter.route('/prefixes/:mfr_id')
  .all(requireAuth)
  .get((req, res, next) => {
    WeaponsService.getPrevixesByMfr(req.app.get('db'), req.params.mfr_id)
      .then(result => {
        res.json(result);
      })
      .catch(next);
  });

WeaponsRouter.route('/:thing_id/reviews/')
  .all(requireAuth)
  .all(checkThingExists)
  .get((req, res, next) => {
    WeaponsService.getReviewsForThing(req.app.get('db'), req.params.thing_id)
      .then(reviews => {
        res.json(WeaponsService.serializeThingReviews(reviews));
      })
      .catch(next);
  });

/* async/await syntax for promises */
async function checkThingExists(req, res, next) {
  try {
    const thing = await WeaponsService.getById(req.app.get('db'), req.params.thing_id);

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

module.exports = WeaponsRouter;
