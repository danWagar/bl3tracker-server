/* eslint-disable strict */
const knex = require('knex');
const app = require('../src/app');
const helpers = require('./test-helpers');

describe.only('Items Endpoints', function() {
  let db;

  before('make knex instance', () => {
    db = knex({
      client: 'pg',
      connection: process.env.TEST_DB_URL
    });
    app.set('db', db);
  });

  after('disconnect from db', () => db.destroy());

  describe(`GET /api/items`, () => {
    context(`Returns items`, () => {
      it(`responds with 200 and the items`, () => {
        return supertest(app)
          .get('/api/items')
          .expect(200);
      });
    });
  });
});
