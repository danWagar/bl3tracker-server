/* eslint-disable strict */
const knex = require('knex');
const app = require('../src/app');
const helpers = require('./test-helpers');

const testUsers = helpers.makeUsersArray();

describe.only('Weapons Endpoints', function() {
  let db;

  before('make knex instance', () => {
    db = knex({
      client: 'pg',
      connection: process.env.TEST_DB_URL
    });
    app.set('db', db);
  });

  after('disconnect from db', () => db.destroy());

  before('cleanup', () => helpers.cleanTables(db));

  afterEach('cleanup', () => helpers.cleanTables(db));

  describe(`GET /api/weapons`, () => {
    beforeEach(() => helpers.seedUsers(db, testUsers));
    context(`Returns weapons`, () => {
      it(`responds with 200 and the weapons`, () => {
        return supertest(app)
          .get('/api/weapons')
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .expect(200);
      });
    });
  });

  describe(`GET /api/weapons/prefixes/:mfr_name`, () => {
    beforeEach(() => helpers.seedUsers(db, testUsers));

    const expectedOutput = [
      {
        mfr_name: 'Atlas',
        title: 'Cost-Effective'
      },
      {
        mfr_name: 'Atlas',
        title: 'Overencumbered'
      }
    ];
    context(`Returns weapon prefixes for specific manufacturer`, () => {
      it(`responds with 200 and the prefixes`, () => {
        return supertest(app)
          .get('/api/weapons/prefixes/1')
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .expect(200, expectedOutput);
      });
    });
  });
});
