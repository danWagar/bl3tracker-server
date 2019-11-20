const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

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

function makeExpectedThing(users, thing, reviews = []) {
  const user = users.find(user => user.id === thing.user_id);

  return {
    id: thing.id,
    image: thing.image,
    title: thing.title,
    content: thing.content,
    date_created: thing.date_created,
    average_review_rating,
    user: {
      id: user.id,
      user_name: user.user_name,
      date_created: user.date_created
    }
  };
}

function makeExpectedThingReviews(users, thingId, reviews) {
  const expectedReviews = reviews.filter(review => review.thing_id === thingId);

  return expectedReviews.map(review => {
    const reviewUser = users.find(user => user.id === review.user_id);
    return {
      id: review.id,
      text: review.text,
      rating: review.rating,
      date_created: review.date_created,
      user: {
        id: reviewUser.id,
        user_name: reviewUser.user_name,
        date_created: reviewUser.date_created
      }
    };
  });
}

function makeMaliciousThing(user) {
  const maliciousThing = {
    id: 911,
    image: 'http://placehold.it/500x500',
    date_created: new Date().toISOString(),
    title: 'Naughty naughty very naughty <script>alert("xss");</script>',
    user_id: user.id,
    content: `Bad image <img src="https://url.to.file.which/does-not.exist" onerror="alert(document.cookie);">. But not <strong>all</strong> bad.`
  };
  const expectedThing = {
    ...makeExpectedThing([user], maliciousThing),
    title: 'Naughty naughty very naughty &lt;script&gt;alert("xss");&lt;/script&gt;',
    content: `Bad image <img src="https://url.to.file.which/does-not.exist">. But not <strong>all</strong> bad.`
  };
  return {
    maliciousThing,
    expectedThing
  };
}

function makeCharactersFixtures() {
  const testUsers = makeUsersArray();
  const testUserCharacters = makeUserCharactersArray(testUsers);
  return { testUsers, testUserCharacters };
}

function cleanTables(db) {
  return db.raw(
    `TRUNCATE
      users, user_characters
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

function seedMaliciousThing(db, user, thing) {
  return seedUsers(db, [user]).then(() => db.into('thingful_things').insert([thing]));
}

function makeAuthHeader(user, secret = process.env.JWT_SECRET) {
  const token = jwt.sign({ user_id: user.id }, secret, {
    subject: user.user_name,
    algorithm: 'HS256'
  });
  return `Bearer ${token}`;
}

module.exports = {
  makeUsersArray,
  makeUserCharactersArray,
  makeExpectedThing,
  makeExpectedThingReviews,
  makeMaliciousThing,

  makeCharactersFixtures,
  cleanTables,
  seedCharactersTables,
  seedMaliciousThing,
  makeAuthHeader,
  seedUsers
};
