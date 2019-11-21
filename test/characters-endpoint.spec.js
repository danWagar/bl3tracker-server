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
});
