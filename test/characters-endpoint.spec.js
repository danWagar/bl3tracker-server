/* eslint-disable strict */
const knex = require('knex');
const app = require('../src/app');
const helpers = require('./test-helpers');

describe('Characters Endpoints', function() {
  let db;

  const { testUsers, testUserCharacters } = helpers.makeCharactersFixtures();

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

  describe(`GET /api/characters`, () => {
    beforeEach(() => helpers.seedCharactersTables(db, testUsers, testUserCharacters));

    context(`Given there is character data`, () => {
      it(`responds with 200 and the characters`, () => {
        return supertest(app)
          .get(`/api/characters`)
          .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
          .expect(200, [testUserCharacters[0], testUserCharacters[2]]);
      });
    });
  });

  describe(`POST /api/characters`, () => {
    beforeEach(() => helpers.seedCharactersTables(db, testUsers, testUserCharacters));

    const newChar = {
      user_id: 2,
      character: 'FL4K',
      character_name: 'beastmaster'
    };

    it('responds 201, serialized character', () => {
      return supertest(app)
        .post(`/api/characters`)
        .set('Authorization', helpers.makeAuthHeader(testUsers[1]))
        .send(newChar)
        .expect(res => {
          expect(res.body).to.have.property('id');
          expect(res.body.user_id).to.eql(newChar.user_id);
          expect(res.body.character).to.eql(newChar.character);
          expect(res.body.character_name).to.eql(newChar.character_name);
          expect(res.headers.location).to.eql(`/api/characters/${res.body.id}`);
        })
        .expect(res =>
          db
            .from('user_characters')
            .select('*')
            .where({ user_id: testUsers[1].id, character_name: 'beastmaster' })
            .first()
            .then(row => {
              expect();
              expect(row.user_id).to.eql(newChar.user_id);
              expect(row.character).to.eql(newChar.character);
              expect(row.character_name).to.eql(newChar.character_name);
            })
        );
    });
  });

  describe(`PATCH /api/characters/:id`, () => {
    beforeEach(() => helpers.seedCharactersTables(db, testUsers, testUserCharacters));

    const updatedChar = {
      character_name: 'testing'
    };

    let charToUpdate = 1;

    it(`responds 204, it updated character`, () => {
      return supertest(app)
        .patch(`/api/characters/${charToUpdate}`)
        .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
        .send(updatedChar)
        .expect(204)
        .expect(res =>
          db
            .from('user_characters')
            .select('*')
            .where({ id: `${charToUpdate}` })
            .first()
            .then(row => {
              expect();
              expect(row.character_name).to.eql(updatedChar.character_name);
            })
        );
    });
  });

  describe('DELETE /api/characters/:id', () => {
    beforeEach(() => helpers.seedCharactersTables(db, testUsers, testUserCharacters));
    it('responds with 204 and removes the character', () => {
      const removeId = 2;
      const expectedChars = testUserCharacters.filter(
        char => char.id !== removeId && char.user_id === testUsers[0].id
      );
      return supertest(app)
        .delete(`/api/characters/${removeId}`)
        .set('Authorization', helpers.makeAuthHeader(testUsers[1]))
        .expect(204)
        .then(res =>
          supertest(app)
            .get('/api/characters')
            .set('Authorization', helpers.makeAuthHeader(testUsers[0]))
            .expect(expectedChars)
        );
    });
  });
});
