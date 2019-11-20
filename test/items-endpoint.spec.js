/* eslint-disable strict */
const knex = require('knex');
const app = require('../src/app');
const helpers = require('./test-helpers');

const testUsers = helpers.makeUsersArray();

describe('Items Endpoints', function() {
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
    beforeEach(() => helpers.seedUsers(db, testUsers));
    context(`Returns items`, () => {
      it(`responds with 200 and the items`, () => {
        return supertest(app)
          .get('/api/items')
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .expect(200);
      });
    });
  });
});
