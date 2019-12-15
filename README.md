# Borderlands 3 Gear Tracker Server

## What is Borderlands 3 Gear Tracker?

Borderlands 3 Gear Tracker is a platform that allows users to track their inventory at any time for all characters as well as the shared 'Vault' inventory, which can not be accomplished in-game in most scenarios

## Setting Up

- Install dependencies: `npm install`
- Create development and test databases: `createdb bl3tracker`, `createdb bl3tracker-test`
- Create database user: `createuser bl3tracker`
- Grant privileges to new user in `psql`:
  - `GRANT ALL PRIVILEGES ON DATABASE bl3tracker TO bl3tracker`
  - `GRANT ALL PRIVILEGES ON DATABASE "bl3tracker-test" TO bl3tracker`
- Prepare environment file: `cp example.env .env`
- Replace values in `.env` with your custom values.
- Bootstrap development database: `npm run migrate`
- Bootstrap test database: `npm run migrate:test`

## Sample Data

- To seed the database for development: `psql -U bl3tracker -d bl3tracker -a -f seeds/seed.bl3tracker_tables.sql`
- To clear seed data: `psql -U bl3tracker -d bl3tracker -a -f seeds/trunc.bl3tracker_tables.sql`

## Scripts

- Start application for development: `npm run dev`
- Run tests: `npm test`

## API Overview

```text
/api
.
├── /auth
│   └── POST
│       ├── /login
├── /users
│   └── POST
│       └── /
├── /items
│   └── GET
│       ├── /weapons
|       |    └── /prefixes/:mfr_id
│       ├── /shields
├── /characters
│   └── POST
│       ├── /
│   └── GET
│       ├── /
│   └── PATCH
│       ├── /:id
│   └── DELETE
│       └── /:id
├── /anointments
│   └── GET
│       ├── /
├── /inventory
│   └── POST
│       └──/weapons
│   └── GET
│       └──/weapons/:id
│       └──/shields/:id
│   └── PATCH
│       └──/weapons/:id
│       └──/shields/:id
│   └── DELETE
│       └──/weapons/:id
│       └──/shields/:id
```

PATCH `/api/inventory/weapons/:id`

### POST /api/auth/login

```js
// req.body
{
  user_name: String,
  password: String
}

// res.body
{
  authToken: String
}
```

### POST `/api/users/`

```js
// req.body
{
  user_name: String,
  password: String
}

// res.body
{
  id: userId,
  user_name: String,
  date_created: Date
}
```

### GET `/api/items/weapons`

```js

// res.body
{
      id: weaponId,
      weapon_type: String,
      mfr_id: mfrId,
      mfr_name: String,
      name: String,
      rarity: String
}
```

### GET `/api/items/weapons/prefixes/:mfr_id`

```js

//req.params
{
  mfr_id: mfrId
}

// res.body
{
      id: weaponId,
      weapon_type: String,
      mfr_id: mfrId,
      mfr_name: String,
      name: String,
      rarity: String
}
```

### GET `/api/items/shields`

```js

// res.body
{
  id: shieldId,
  mfr_id: mfrId,
  mfr_name: String,
  name: String,
  rarity: String
}
```

### POST `/api/characters`

```js
// req.body
{
  character: String,
  character_name: String
}

// res.body
{
  id: charId,
  user_id: userId,
  character: String,
  character_name: String
}
```

### GET `/api/characters`

```js
// res.body
{
  id: charId,
  user_id: userId,
  character: String,
  character_name: String
}
```

### PATCH `/api/characters/:id`

```js
//req.params
{
  id: charId
}

//req.body
{
  character_name: String
}

// res.body
{
  id: charId,
  user_id: userId,
  character: String,
  character_name: String
}
```

### DELETE `/api/characters/:id`

```js
//req.params
{
  id: charId;
}
```

### GET `/api/anointments/`

```js
//req.query
{
  terror: Boolean,
  class: charClass
}

//req.res
{
  id: id,
  class: String,
  description: String
}
```

### POST `/api/inventory/weapons`

```js
//req.body
{
  char_id: charId,
  weapon_id: weaponId,
  prefix_1: String,
  prefix_2: String,
  element: String
  anointment_id: anointmentId,
  item_score: Number,
  damage: Number,
  accuracy: Number,
  handling: Number,
  reload_time: Number,
  fire_rate: Number,
  magazine_size: Number
}

//req.res
{
  user_weapon_id: weaponId,
  mfr_id: mfrId,
  mfr_name: String,
  weapon_type: String,
  name: String,
  rarity: String,
  id: id,
  user_id: userId,
  char_id: charId,
  weapon_id: weaponId,
  pre_title_1: String,
  pre_title_2: String,
  prefix_1: String,
  prefix_2: String,
  element: String,
  anointment: String,
  anointment_id: anointmentId,
  item_score: Number,
  damage: Number,
  accuracy: Number,
  handling: Number,
  reload_time: Number,
  fire_rate: Number,
  magazine_size: Number
}
```

### PATCH `/api/inventory/weapons/:id`

```js
//req.params
{
  id: userWeaponId
}

//req.body
{
  weapon_id: weaponId,
  prefix_1: String,
  prefix_2: String,
  element: String
  anointment_id: anointmentId,
  item_score: Number,
  damage: Number,
  accuracy: Number,
  handling: Number,
  reload_time: Number,
  fire_rate: Number,
  magazine_size: Number
}

//req.res
{
  user_weapon_id: weaponId,
  mfr_id: mfrId,
  mfr_name: String,
  weapon_type: String,
  name: String,
  rarity: String,
  id: id,
  user_id: userId,
  char_id: charId,
  weapon_id: weaponId,
  pre_title_1: String,
  pre_title_2: String,
  prefix_1: String,
  prefix_2: String,
  element: String,
  anointment: String,
  anointment_id: anointmentId,
  item_score: Number,
  damage: Number,
  accuracy: Number,
  handling: Number,
  reload_time: Number,
  fire_rate: Number,
  magazine_size: Number
}
```

### DELETE `/api/inventory/weapons/:id`

```js
//req.params
{
  id: userWeaponId;
}
```

### GET `/api/inventory/weapons/:id`

```js
//req.params
{
  id: charId
}

//req.res
{
  user_weapon_id: weaponId,
  mfr_id: mfrId,
  mfr_name: String,
  weapon_type: String,
  name: String,
  rarity: String,
  id: id,
  user_id: userId,
  char_id: charId,
  weapon_id: weaponId,
  pre_title_1: String,
  pre_title_2: String,
  prefix_1: prefixId,
  prefix_2: prefixId,
  element: String,
  anointment: String,
  anointment_id: anointmentId,
  item_score: Number,
  damage: Number,
  accuracy: Number,
  handling: Number,
  reload_time: Number,
  fire_rate: Number,
  magazine_size: Number
}
```

### POST `/api/inventory/shields`

```js
//req.body
{
  char_id: charId,
  weapon_id: weaponId,
  prefix: String,
  element: String
  anointment_id: anointmentId,
  item_score: Number,
  capacity: Number,
  recharge_delay: Number,
  recharge_rate: Number
}

//req.res
{
  user_weapon_id: weaponId,
  mfr_name: String,
  name: String,
  rarity: String,
  id: id,
  user_id: userId,
  char_id: charId,
  shield_id: weaponId,
  prefix: String,
  element: String,
  anointment: String,
  anointment_id: anointmentId,
  item_score: Number,
  damage: Number,
  accuracy: Number,
  handling: Number,
  capacity: Number,
  recharge_delay: Number,
  recharge_rate: Number
}
```

### PATCH `/api/inventory/shields/:id`

```js
//req.params
{
  id: userShieldId
}

//req.body
{
  weapon_id: weaponId,
  prefix: String,
  element: String
  anointment_id: anointmentId,
  item_score: Number,
  capacity: Number,
  recharge_delay: Number,
  recharge_rate: Number
}

//req.res
{
  user_weapon_id: weaponId,
  mfr_name: String,
  name: String,
  rarity: String,
  id: id,
  user_id: userId,
  char_id: charId,
  shield_id: weaponId,
  prefix: String,
  element: String,
  anointment: String,
  anointment_id: anointmentId,
  item_score: Number,
  damage: Number,
  accuracy: Number,
  handling: Number,
  capacity: Number,
  recharge_delay: Number,
  recharge_rate: Number
}
```

### DELETE `/api/inventory/shields/:id`

```js
//req.params
{
  id: userShieldId;
}
```

### GET `/api/inventory/shields/:id`

```js
//req.params
{
  id: charId
}

//req.res
{
  user_weapon_id: weaponId,
  mfr_name: String,
  name: String,
  rarity: String,
  id: id,
  user_id: userId,
  char_id: charId,
  shield_id: weaponId,
  prefix: String,
  element: String,
  anointment: String,
  anointment_id: anointmentId,
  item_score: Number,
  damage: Number,
  accuracy: Number,
  handling: Number,
  capacity: Number,
  recharge_delay: Number,
  recharge_rate: Number
}
```

## Built With

- [Node](https://nodejs.org/en/) - Run-time environment
- [Express](https://expressjs.com/) - Web application framework
- [PostgreSQL](https://www.postgresql.org/) - Database
- [JWT](https://jwt.io/) - Authentication
- [Mocha](https://mochajs.org/) - Testing
- [Chai](https://www.chaijs.com/) - Testing

## Author

- **Dan Wagar** - GitHub: [danWagar](https://github.com/danWagar)
