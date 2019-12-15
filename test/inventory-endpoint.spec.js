/* eslint-disable strict */
const knex = require('knex');
const app = require('../src/app');
const helpers = require('./test-helpers');

describe('Inventory Endpoints', function() {
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

  describe('/inventory/weapons endpoints', () => {
    const {
      testUsers,
      testUserCharacters,
      testUserWeapons,
      testUserWeaponsResults
    } = helpers.makeWeaponsFixtures();

    describe(`POST /api/inventory/weapons`, () => {
      beforeEach(() => helpers.seedWeaponsTables(db, testUsers, testUserCharacters, testUserWeapons));

      let newWeapon = testUserWeapons[0];
      let expectedWpn = testUserWeaponsResults[0];

      it('responds with 201 and the new weapon', () => {
        supertest(app)
          .post('/api/inventory/weapons')
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .expect(201, expectedWpn);
      });
    });

    describe(`GET /api/inventory/weapons/:charId`, () => {
      beforeEach(() => helpers.seedWeaponsTables(db, testUsers, testUserCharacters, testUserWeapons));

      let expectedWeapons = testUserWeaponsResults;

      it(`responds with 200 and the weapons`, () => {
        return supertest(app)
          .get(`/api/inventory/weapons/${testUserCharacters[0].id}`)
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .expect(200, expectedWeapons);
      });
    });

    describe(`DELETE /api/inventory/weapons/:userWpnId`, () => {
      beforeEach(() => helpers.seedWeaponsTables(db, testUsers, testUserCharacters, testUserWeapons));

      let expectedWeapons = testUserWeaponsResults;

      it('responds with 204 and removes the weapon from user inventory', () => {
        const removeId = 1;
        expectedWeapons = expectedWeapons.filter(wpn => wpn.user_weapon_id !== removeId);
        return supertest(app)
          .delete(`/api/inventory/weapons/${removeId}`)
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .expect(204)
          .then(res =>
            supertest(app)
              .get(`/api/inventory/weapons/${testUserCharacters[0].id}`)
              .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
              .expect(expectedWeapons)
          );
      });
    });

    describe(`PATCH /api/inventory/weapons/:userWpnId`, () => {
      beforeEach(() => helpers.seedWeaponsTables(db, testUsers, testUserCharacters, testUserWeapons));

      const wpn_id = 1;
      console.log(wpn_id);
      let change = { element: 'corrosive', item_score: 555 };
      let expectedResults = { ...testUserWeaponsResults[2], ...change };

      it('responds with 200 and updates the given user weapon', () => {
        return supertest(app)
          .patch(`/api/inventory/weapons/${wpn_id}`)
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .send(change)
          .expect(200, expectedResults);
      });
    });
  });

  describe('/inventory/shields endpoints', () => {
    const {
      testUsers,
      testUserCharacters,
      testUserShields,
      testUserShieldsResults
    } = helpers.makeShieldsFixtures();

    describe(`POST /api/inventory/shields`, () => {
      beforeEach(() => helpers.seedShieldsTables(db, testUsers, testUserCharacters, testUserShields));

      let newShield = testUserShields[0];
      let expectedShield = testUserShieldsResults[0];

      it('responds with 201 and the new shield', () => {
        supertest(app)
          .post('/api/inventory/shields')
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .expect(201, expectedShield);
      });
    });

    describe(`GET /api/inventory/shields/:charId`, () => {
      beforeEach(() => helpers.seedShieldsTables(db, testUsers, testUserCharacters, testUserShields));

      let expectedShields = testUserShieldsResults;

      it(`responds with 200 and the shields`, () => {
        return supertest(app)
          .get(`/api/inventory/shields/${testUserCharacters[0].id}`)
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .expect(200, expectedShields);
      });
    });

    describe(`PATCH /api/inventory/shields/:userShieldId`, () => {
      beforeEach(() => helpers.seedShieldsTables(db, testUsers, testUserCharacters, testUserShields));

      const shield_id = 2;
      let change = { element: 'corrosive', item_score: 555 };
      let expectedShield = { ...testUserShieldsResults[1], ...change };
      let expectedShields = [expectedShield, testUserShieldsResults[0], testUserShieldsResults[2]];

      it('responds with 204 and updates the given user shield', () => {
        return supertest(app)
          .patch(`/api/inventory/shields/${shield_id}`)
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .send(change)
          .expect(204)
          .then(res =>
            supertest(app)
              .get(`/api/inventory/shields/${testUserCharacters[0].id}`)
              .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
              .expect(expectedShields)
          );
      });
    });

    describe(`DELETE /api/inventory/shields/:userWpnId`, () => {
      beforeEach(() => helpers.seedShieldsTables(db, testUsers, testUserCharacters, testUserShields));

      let expectedShields = testUserShieldsResults;

      it('responds with 204 and removes the shield from user inventory', () => {
        const removeId = 1;
        expectedShields = expectedShields.filter(shield => shield.user_shield_id !== removeId);
        return supertest(app)
          .delete(`/api/inventory/shields/${removeId}`)
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .expect(204)
          .then(res =>
            supertest(app)
              .get(`/api/inventory/shields/${testUserCharacters[0].id}`)
              .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
              .expect(expectedShields)
          );
      });
    });
  });
});
