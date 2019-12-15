const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

function makeCharactersFixtures() {
  const testUsers = makeUsersArray();
  const testUserCharacters = makeUserCharactersArray(testUsers);
  return { testUsers, testUserCharacters };
}

function makeWeaponsFixtures() {
  const testUsers = makeUsersArray();
  const testUserCharacters = makeUserCharactersArray(testUsers);
  const testUserWeapons = makeUserWeaponsArray(testUsers, testUserCharacters);
  const testUserWeaponsResults = makeUserWeaponsResults(testUserWeapons);
  return { testUsers, testUserCharacters, testUserWeapons, testUserWeaponsResults };
}

function makeShieldsFixtures() {
  const testUsers = makeUsersArray();
  const testUserCharacters = makeUserCharactersArray(testUsers);
  const testUserShields = makeUserShieldsArray(testUsers, testUserCharacters);
  const testUserShieldsResults = makeUserShieldsResults(testUserShields);
  return { testUsers, testUserCharacters, testUserShields, testUserShieldsResults };
}

function cleanTables(db) {
  return db.raw(
    `TRUNCATE
      users, user_characters, user_weapons
      RESTART IDENTITY CASCADE`
  );
}

function seedUsers(db, users) {
  const preppedUsers = users.map(user => ({
    ...user,
    password: bcrypt.hashSync(user.password, 1)
  }));
  return db
    .into('users')
    .insert(preppedUsers)
    .then(() =>
      // update the auto sequence to stay in sync
      db.raw(`SELECT setval('users_id_seq', ?)`, [users[users.length - 1].id])
    );
}

function seedCharactersTables(db, users, characters) {
  return db.transaction(async trx => {
    await seedUsers(trx, users);
    await trx.into('user_characters').insert(characters);
    await trx.raw(`SELECT setval('user_characters_id_seq', ?)`, [characters[characters.length - 1].id]);
  });
}

function seedWeaponsTables(db, users, characters, weapons) {
  for (let i = 0; i < weapons.length; i++) {
    weapons[i] = { user_id: 1, ...weapons[i] };
  }
  return db.transaction(async trx => {
    await seedCharactersTables(trx, users, characters);
    await trx.into('user_weapons').insert(weapons);
  });
}

function seedShieldsTables(db, users, characters, shields) {
  for (let i = 0; i < shields.length; i++) {
    shields[i] = { user_id: 1, ...shields[i] };
  }
  return db.transaction(async trx => {
    await seedCharactersTables(trx, users, characters);
    await trx.into('user_shields').insert(shields);
  });
}

function makeAuthHeader(user, secret = process.env.JWT_SECRET) {
  const token = jwt.sign({ user_id: user.id }, secret, {
    subject: user.user_name,
    algorithm: 'HS256'
  });
  return `Bearer ${token}`;
}

function makeUsersArray() {
  return [
    {
      id: 1,
      user_name: 'test-user-1',
      password: 'password',
      date_created: '2029-01-22T16:28:32.615Z'
    },
    {
      id: 2,
      user_name: 'test-user-2',
      password: 'password',
      date_created: '2029-01-22T16:28:32.615Z'
    },
    {
      id: 3,
      user_name: 'test-user-3',
      password: 'password',
      date_created: '2029-01-22T16:28:32.615Z'
    },
    {
      id: 4,
      user_name: 'test-user-4',
      password: 'password',
      date_created: '2029-01-22T16:28:32.615Z'
    }
  ];
}

function makeUserCharactersArray(users) {
  return [
    {
      id: 1,
      user_id: users[0].id,
      character: 'FL4K',
      character_name: ''
    },
    {
      id: 2,
      user_id: users[1].id,
      character: 'Moze',
      character_name: 'Mozes'
    },
    {
      id: 3,
      user_id: users[0].id,
      character: 'Zane',
      character_name: 'Zaney'
    },
    {
      id: 4,
      user_id: users[3].id,
      character: 'Amara',
      character_name: 'Siren girl'
    }
  ];
}

function makeUserWeaponsArray(characters) {
  return [
    {
      char_id: characters[0].id,
      weapon_id: 1,
      prefix_1: 1,
      prefix_2: 2,
      element: 'fire',
      anointment_id: 6,
      item_score: 621,
      damage: 333,
      accuracy: 88,
      handling: 77,
      reload_time: 3.2,
      fire_rate: 1.5,
      magazine_size: 10
    },
    {
      char_id: characters[0].id,
      weapon_id: 2,
      prefix_1: 1,
      prefix_2: 2,
      element: 'fire',
      anointment_id: 6,
      item_score: 621,
      damage: 333,
      accuracy: 88,
      handling: 77,
      reload_time: 3.2,
      fire_rate: 1.5,
      magazine_size: 10
    },
    {
      char_id: characters[0].id,
      weapon_id: 3,
      prefix_1: 1,
      prefix_2: 2,
      element: 'fire',
      anointment_id: 6,
      item_score: 621,
      damage: 333,
      accuracy: 88,
      handling: 77,
      reload_time: 3.2,
      fire_rate: 1.5,
      magazine_size: 10
    }
  ];
}

function makeUserWeaponsResults(wpns) {
  const userWeaponsResults = [];

  additionalWeaponResponseValues = [
    {
      anointment:
        'On Action Skill End, Weapon Status Effect Damage & Chance are increased by 75% for a short time.',
      mfr_id: 1,
      mfr_name: 'Atlas',
      name: 'Rebel Yell',
      pre_title_1: 'Cost-Effective',
      pre_title_2: 'Overencumbered',
      rarity: 'Legendary',
      user_weapon_id: 1,
      weapon_id: 1,
      weapon_type: 'assault rifle'
    },
    {
      anointment:
        'On Action Skill End, Weapon Status Effect Damage & Chance are increased by 75% for a short time.',
      mfr_id: 1,
      mfr_name: 'Atlas',
      name: 'Carrier',
      pre_title_1: 'Cost-Effective',
      pre_title_2: 'Overencumbered',
      rarity: 'Legendary',
      user_weapon_id: 2,
      weapon_id: 2,
      weapon_type: 'assault rifle'
    },
    {
      anointment:
        'On Action Skill End, Weapon Status Effect Damage & Chance are increased by 75% for a short time.',
      mfr_id: 1,
      mfr_name: 'Atlas',
      name: 'Linc',
      pre_title_1: 'Cost-Effective',
      pre_title_2: 'Overencumbered',
      rarity: 'Legendary',
      user_weapon_id: 3,
      weapon_id: 3,
      weapon_type: 'pistol'
    }
  ];

  for (let i = 0; i < wpns.length; i++) {
    userWeaponsResults.unshift({ ...wpns[i], ...additionalWeaponResponseValues[i] });
  }

  return userWeaponsResults;
}

function makeUserShieldsArray(characters) {
  return [
    {
      char_id: characters[0].id,
      shield_id: 1,
      prefix: 'Absorb',
      element: 'fire',
      anointment_id: 6,
      item_score: 621,
      capacity: 10000,
      recharge_rate: 1000,
      recharge_delay: 3.2
    },
    {
      char_id: characters[0].id,
      shield_id: 2,
      prefix: 'Absorb',
      element: 'fire',
      anointment_id: 6,
      item_score: 621,
      capacity: 10000,
      recharge_rate: 1000,
      recharge_delay: 3.2
    },
    {
      char_id: characters[0].id,
      shield_id: 3,
      prefix: 'Absorb',
      element: 'fire',
      anointment_id: 6,
      item_score: 621,
      item_score: 621,
      capacity: 10000,
      recharge_rate: 1000,
      recharge_delay: 3.2
    }
  ];
}

function makeUserShieldsResults(shields) {
  const userShieldsResults = [];

  additionalShieldResponseValues = [
    {
      anointment:
        'On Action Skill End, Weapon Status Effect Damage & Chance are increased by 75% for a short time.',
      mfr_name: 'Anshin',
      name: 'Deluxe Badass Combustor',
      rarity: 'Legendary',
      user_shield_id: 1
    },
    {
      anointment:
        'On Action Skill End, Weapon Status Effect Damage & Chance are increased by 75% for a short time.',
      mfr_name: 'Anshin',
      name: 'Frozen Heart',
      rarity: 'Legendary',
      user_shield_id: 2
    },
    {
      anointment:
        'On Action Skill End, Weapon Status Effect Damage & Chance are increased by 75% for a short time.',
      mfr_name: 'Anshin',
      name: 'Messy Breakup',
      rarity: 'Legendary',
      user_shield_id: 3
    }
  ];

  for (let i = 0; i < shields.length; i++) {
    userShieldsResults.unshift({ ...shields[i], ...additionalShieldResponseValues[i] });
  }

  return userShieldsResults;
}

module.exports = {
  makeUsersArray,
  makeUserCharactersArray,
  makeCharactersFixtures,
  makeWeaponsFixtures,
  makeShieldsFixtures,
  cleanTables,
  seedCharactersTables,
  seedWeaponsTables,
  seedShieldsTables,
  makeAuthHeader,
  seedUsers
};
