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

  before('cleanup', () => helpers.cleanTables(db));

  afterEach('cleanup', () => helpers.cleanTables(db));

  describe(`GET /api/items/weapons`, () => {
    beforeEach(() => helpers.seedUsers(db, testUsers));

    const expectedOutput = [
      {
        id: 1,
        weapon_type: 'assault rifle',
        mfr_id: 1,
        mfr_name: 'Atlas',
        name: 'Rebel Yell',
        rarity: 'Legendary'
      },
      {
        id: 2,
        weapon_type: 'assault rifle',
        mfr_id: 1,
        mfr_name: 'Atlas',
        name: 'Carrier',
        rarity: 'Legendary'
      },
      { id: 3, weapon_type: 'pistol', mfr_id: 1, mfr_name: 'Atlas', name: 'Linc', rarity: 'Legendary' },
      { id: 4, weapon_type: 'launcher', mfr_id: 1, mfr_name: 'Atlas', name: 'Freeman', rarity: 'Legendary' },
      {
        id: 5,
        weapon_type: 'launcher',
        mfr_id: 1,
        mfr_name: 'Atlas',
        name: "Ruby's Wrath",
        rarity: 'Legendary'
      }
    ];

    it(`responds with 200 and the weapons`, () => {
      return supertest(app)
        .get('/api/items/weapons?mfr_id=1')
        .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
        .expect(200, expectedOutput);
    });
  });

  describe(`GET /api/items/shields`, () => {
    beforeEach(() => helpers.seedUsers(db, testUsers));

    const expectedOutput = [
      { id: 17, mfr_id: 4, mfr_name: 'Hyperion', name: 'Front Loader', rarity: 'Legendary' },
      { id: 18, mfr_id: 4, mfr_name: 'Hyperion', name: 'Re-Charger', rarity: 'Legendary' },
      { id: 19, mfr_id: 4, mfr_name: 'Hyperion', name: 'Rectifier', rarity: 'Legendary' },
      { id: 20, mfr_id: 4, mfr_name: 'Hyperion', name: 'Stop-Gap', rarity: 'Legendary' },
      { id: 21, mfr_id: 4, mfr_name: 'Hyperion', name: 'The Transformer', rarity: 'Legendary' },
      { id: 22, mfr_id: 4, mfr_name: 'Hyperion', name: 'Ward', rarity: 'Legendary' }
    ];

    it(`responds with 200 and the shields`, () => {
      return supertest(app)
        .get('/api/items/shields?mfr_id=4')
        .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
        .expect(200, expectedOutput);
    });
  });

  describe(`GET /api/items/weapons/prefixes/:mfr_id`, () => {
    beforeEach(() => helpers.seedUsers(db, testUsers));

    const expectedOutput = [
      {
        id: 1,
        title: 'Cost-Effective'
      },
      {
        id: 2,
        title: 'Overencumbered'
      }
    ];
    it(`responds with 200 and the prefixes`, () => {
      return supertest(app)
        .get('/api/items/weapons/prefixes/1')
        .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
        .expect(200, expectedOutput);
    });
  });
});
