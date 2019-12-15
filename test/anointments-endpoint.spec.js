/* eslint-disable strict */
const knex = require('knex');
const app = require('../src/app');
const helpers = require('./test-helpers');

const testUsers = helpers.makeUsersArray();

describe('Anointments Endpoints', function() {
  let db;

  const testUsers = helpers.makeUsersArray();
  const testUser = testUsers[0];

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

  describe('GET /api/anointments', () => {
    beforeEach('insert users', () => helpers.seedUsers(db, testUsers));

    const expectedOutput = [
      {
        id: 1,
        class: 'Universal',
        description: 'On Action Skill End, The next 2 magazines will have 50% additional bonus fire damage.'
      },
      {
        id: 2,
        class: 'Universal',
        description: 'On Action Skill End, The next 2 magazines will have 50% additional bonus shock damage.'
      },
      {
        id: 3,
        class: 'Universal',
        description:
          'On Action Skill End, The next 2 magazines will have 50% additional bonus corrosive damage.'
      },
      {
        id: 4,
        class: 'Universal',
        description: 'On Action Skill End, The next 2 magazines will have 50% additional bonus cryo damage.'
      },
      {
        id: 5,
        class: 'Universal',
        description:
          'On Action Skill End, The next 2 magazines will have 50% additional bonus radiation damage.'
      },
      {
        id: 6,
        class: 'Universal',
        description:
          'On Action Skill End, Weapon Status Effect Damage & Chance are increased by 75% for a short time.'
      },
      {
        id: 7,
        class: 'Universal',
        description: 'On Action Skill End, Splash Damage is increased by 125% for a short time.'
      },
      {
        id: 8,
        class: 'Universal',
        description: 'On Action Skill End, Weapon Damage is increased by 100% for a short time.'
      },
      {
        id: 9,
        class: 'Universal',
        description:
          'On Action Skill End, Deal 125% more Weapon Damage to Badass, Named, and Boss enemies for a short time.'
      },
      {
        id: 10,
        class: 'Universal',
        description: 'On Action Skill End, Melee Damage is increased by 100% for a short time. [shield]'
      },
      {
        id: 11,
        class: 'Universal',
        description: 'On Action Skill End, Critical Damage is increased by 25% for a short time.'
      },
      {
        id: 12,
        class: 'Universal',
        description: 'On Action Skill End, Gain 15% Life Steal for a short time.'
      },
      {
        id: 13,
        class: 'Universal',
        description: 'On Action Skill End, Regenerate 5% max health per second for a short time. [shield]'
      },
      {
        id: 14,
        class: 'Universal',
        description: 'On Action Skill End, Damage taken is reduced by 13% for a short time. [shield]'
      },
      {
        id: 15,
        class: 'Universal',
        description: 'On Action Skill End, Weapon Accuracy & Handling are greatly increased for a short time.'
      },
      {
        id: 16,
        class: 'Universal',
        description: 'On Action Skill End, Projectile Speed is increased by 100% for a short time.'
      },
      {
        id: 17,
        class: 'Universal',
        description: 'On Action Skill End, Movement speed is increased by 5% for a short time. [shield]'
      },
      {
        id: 18,
        class: 'Universal',
        description:
          'On Action Skill End, Fire rate is increased by 11%, & reload speed by 26% for a short time.'
      },
      {
        id: 19,
        class: 'Universal',
        description:
          'On Action Skill End, Action skill cooldown rate is increased by 20% for a short time. [shield]'
      },
      { id: 20, class: 'Universal', description: 'On Action Skill Start, Regenerate 1 grenade. [grenade]' },
      {
        id: 21,
        class: 'Siren',
        description: 'On Action Skill End, deal 20% bonus radiation damage for a short time.'
      },
      {
        id: 22,
        class: 'Siren',
        description:
          'On Action Skill End, 30% of damage taken is returned to the attacker for a short time. [shield]'
      },
      {
        id: 23,
        class: 'Siren',
        description: 'After using Phasecast, Weapon Damage is increased by 250% for a short time.'
      },
      {
        id: 24,
        class: 'Siren',
        description: 'After using Phasecast, Status Effect Chance is increased by 50% for a short time.'
      },
      {
        id: 25,
        class: 'Siren',
        description: 'After using Phaseslam, Weapon Damage is increased by 300% for a short time.'
      },
      {
        id: 26,
        class: 'Siren',
        description: 'After using Phaseslam, Melee Damage is increased by 200% for a short time. [shield]'
      },
      {
        id: 27,
        class: 'Siren',
        description:
          'While Phasegrasp is active, Amara constantly triggers novas that deal 3718 damage. (lvl 50) [shield]'
      },
      {
        id: 28,
        class: 'Siren',
        description:
          'While Phasegrasp is active, Weapon charge time is decreased by 71% and Fire Rate is increased by 12%.'
      },
      {
        id: 29,
        class: 'Siren',
        description:
          'After using Phaseslam, damage taken is reduced by 20% and movespeed is increased by 12%. [shield]'
      },
      {
        id: 30,
        class: 'Siren',
        description: 'After using Phasegrasp, Weapon Accuracy and Handling are greatly increased.'
      },
      {
        id: 31,
        class: 'Beastmaster',
        description: 'After using Rakk Attack!, gain 25% critical hit damage for a short time.'
      },
      {
        id: 32,
        class: 'Beastmaster',
        description: 'Enemies damaged by Rakk Attack! take 50% increased damage for a short time.'
      },
      { id: 33, class: 'Beastmaster', description: 'Grants an extra charge of Rakk Attack!' },
      {
        id: 34,
        class: 'Beastmaster',
        description: 'When exiting Fade Away, create a nova that deals 13013 damage. (lvl 50)'
      },
      {
        id: 35,
        class: 'Beastmaster',
        description: 'While Gamma Burst is active, gain 65% bonus radiation damage.'
      },
      {
        id: 36,
        class: 'Beastmaster',
        description: 'After using Attack Command, gain 30% lifesteal for a short time.'
      },
      {
        id: 37,
        class: 'Beastmaster',
        description: 'After issuing an Attack Command, gain 8% Movement Speed for a short time.'
      },
      {
        id: 38,
        class: 'Beastmaster',
        description: 'While Fade Away is active, gain greatly increased Accuracy and Handling.'
      },
      {
        id: 39,
        class: 'Gunner',
        description: 'When entering and exiting Iron Bear, create a nova that deals 13013 damage. (lvl50)'
      },
      {
        id: 40,
        class: 'Gunner',
        description:
          'After exiting Iron Bear, the next 2 magazines will have 10% increased fire rate and 20% critical damage.'
      },
      {
        id: 41,
        class: 'Gunner',
        description: 'After exiting Iron Bear, the next 2 magazines will have 40% bonus incendiary damage.'
      },
      {
        id: 42,
        class: 'Gunner',
        description: 'After exiting Iron Bear, gain 120% increased Splash damage for 18 seconds.'
      },
      {
        id: 43,
        class: 'Gunner',
        description: 'While Auto Bear is active, deals 20% bonus incendiary damage'
      },
      {
        id: 44,
        class: 'Gunner',
        description: 'While Auto Bear is active, taking damage has 20% chance to spawn a grenade. [grenade]'
      },
      {
        id: 45,
        class: 'Gunner',
        description: 'After exiting Iron Bear, gain 75% increased shields and health for 25 seconds. [shield]'
      },
      {
        id: 46,
        class: 'Gunner',
        description:
          'After exiting Iron Bear, the next 3 magazines will have 33% incrased reload speed and 67% increased handling'
      },
      {
        id: 47,
        class: 'Gunner',
        description: "After exiting Iron Bear, kills increase Iron Bear's cooldown rate by 30%. [shield]"
      },
      { id: 48, class: 'Gunner', description: 'After exiting Iron Bear, do not consume ammo for 5 seconds.' },
      {
        id: 49,
        class: 'Gunner',
        description:
          'While Auto Bear is active, constantly regenerate 8% of magazine size per second. [shield]'
      },
      {
        id: 50,
        class: 'Operative',
        description:
          'After swapping places with your Digi-Clone, Weapon Damage is increased by 75% for a short time.'
      },
      {
        id: 51,
        class: 'Operative',
        description: 'While Barrier is active, Status Effect Chance is increased by 50%'
      },
      {
        id: 52,
        class: 'Operative',
        description:
          'While Barrier is active, Accuracy is increased by 60%, and Critical Hit damage is increased by 30%'
      },
      {
        id: 53,
        class: 'Operative',
        description: 'While SNTNL is active, Gain 50% of damage as bonus Cryo damage.'
      },
      {
        id: 54,
        class: 'Operative',
        description: 'When Barrier is Deployed, instantly start recharging your shields. [shield]'
      },
      {
        id: 55,
        class: 'Operative',
        description: 'While Digi-Clone is active, regenerate 3% max health per second. [shield]'
      },
      {
        id: 56,
        class: 'Operative',
        description: 'While SNTNL is active, Fire Rate is increased by 9% and Reload Speed by 23%.'
      },
      {
        id: 57,
        class: 'Operative',
        description: 'While SNTNL is active, Movespeed is increased by 15%. [shield]'
      },
      {
        id: 58,
        class: 'Operative',
        description: 'After swapping places with your Digi-Clone, your weapon is reloaded.'
      },
      {
        id: 59,
        class: 'Operative',
        description: 'While Digi-Clone is active, regenerate 12% of magazine ammo per second.'
      },
      {
        id: 60,
        class: 'Universal',
        description:
          'While Terrified, gain increased crit damage. The more Terror you have, the higher the bonus.'
      },
      {
        id: 61,
        class: 'Universal',
        description:
          'While Terrified, gain increased damage and fire rate. The more Terror you have, the higher the bonus.'
      },
      {
        id: 62,
        class: 'Universal',
        description:
          'While Terrified, gain ammo regeneration. The more Terror you have, the higher the bonus. '
      },
      {
        id: 63,
        class: 'Universal',
        description:
          'While Terrified, gain health regeneration. The more Teror you have, the higher the bonus.'
      },
      { id: 64, class: 'Universal', description: 'While Terrified, deal 50% bonus cryo damage.' },
      {
        id: 65,
        class: 'Universal',
        description:
          'While Terrified, you have a chance to fire an extra projectile per shot. The more Terror you have, the higher the bonus.'
      },
      {
        id: 66,
        class: 'Universal',
        description:
          'While Terrified, enemy bullets have a chance to reflect off of you. The more Terror you have, the higher the bonus.'
      },
      {
        id: 67,
        class: 'Universal',
        description:
          'While Terrified, reduce all incoming damage by a small amount. The more Terror you have, the higher the bonus.'
      },
      {
        id: 68,
        class: 'Universal',
        description:
          'On Action Skill End, heal 25% max health, effect is increased by 15% per terror stack. Consumes all Terror. '
      },
      {
        id: 69,
        class: 'Universal',
        description: 'On Action Skill End, apply Terror to yourself every 5 seconds for the next 18 seconds.'
      },
      {
        id: 70,
        class: 'Universal',
        description: 'Melee Attacks have a 25% chance to apply Terror to yourself.'
      },
      {
        id: 71,
        class: 'Siren',
        description:
          'After Phasegrasping an enemy, Amara fires Terror skulls at the grasped target dealing 3718 damage. (lvl 50)'
      },
      {
        id: 72,
        class: 'Beastmaster',
        description:
          "After Using Attack Command, consume all Terror and Fl4K's Pet gains 50% bonus fire damage for a short time."
      },
      {
        id: 73,
        class: 'Operative',
        description: 'While SNTNL is active, SNTNL gains 100% lifesteal while you are affected by Terror. '
      },
      {
        id: 74,
        class: 'Gunner',
        description: 'After Reloading, consume all Terror and create a nova that deals cryo damage.'
      }
    ];

    it(`responds with the anointments`, () => {
      return supertest(app)
        .get('/api/anointments')
        .set('Authorization', helpers.makeAuthHeader(testUser))
        .expect(200, expectedOutput);
    });
  });
});
