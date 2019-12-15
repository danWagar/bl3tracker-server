/* eslint-disable strict */
const xss = require('xss');
const Treeize = require('treeize');

const InventoryService = {
  getCharacterWeaponInventory(db, user_id, char_id) {
    return db
      .select(
        'u.id as user_weapon_id',
        'char_id',
        'weapon_id',
        'm.id as mfr_id',
        'mfr_name',
        'weapon_type',
        'name',
        'rarity',
        'prefix_1',
        'prefix_2',
        'p1.title as pre_title_1',
        'p2.title as pre_title_2',
        'element',
        'anointment_id',
        'description as anointment',
        'item_score',
        'damage',
        'accuracy',
        'handling',
        'reload_time',
        'fire_rate',
        'magazine_size'
      )
      .from('user_weapons as u')
      .join('weapons as w', 'u.weapon_id', '=', 'w.id')
      .join('manufacturers as m', 'w.mfr_id', '=', 'm.id')
      .leftJoin('anointments as a', 'u.anointment_id', '=', 'a.id')
      .leftJoin('prefixes as p1', 'u.prefix_1', '=', 'p1.id')
      .leftJoin('prefixes as p2', 'u.prefix_2', '=', 'p2.id')
      .where({ user_id: user_id, char_id: char_id });
  },

  getParsedWeaponById(db, id) {
    return db
      .select(
        'u.id as user_weapon_id',
        'char_id',
        'weapon_id',
        'm.id as mfr_id',
        'mfr_name',
        'weapon_type',
        'name',
        'rarity',
        'prefix_1',
        'prefix_2',
        'p1.title as pre_title_1',
        'p2.title as pre_title_2',
        'element',
        'anointment_id',
        'description as anointment',
        'item_score',
        'damage',
        'accuracy',
        'handling',
        'reload_time',
        'fire_rate',
        'magazine_size'
      )
      .from('user_weapons as u')
      .join('weapons as w', 'u.weapon_id', '=', 'w.id')
      .join('manufacturers as m', 'w.mfr_id', '=', 'm.id')
      .leftJoin('anointments as a', 'u.anointment_id', '=', 'a.id')
      .leftJoin('prefixes as p1', 'prefix_1', '=', 'p1.id')
      .leftJoin('prefixes as p2', 'prefix_2', '=', 'p2.id')
      .where('u.id', id)
      .first();
  },

  getWeaponById(db, id) {
    return db
      .select('*')
      .from('user_weapons')
      .where({ id: id });
  },

  insertWeapon(db, weapon) {
    return db
      .insert(weapon)
      .into('user_weapons')
      .returning('*')
      .then(([weapon]) => {
        return weapon;
      })
      .then(weapon => InventoryService.getParsedWeaponById(db, weapon.id));
  },

  updateWeapon(db, id, toUpdate) {
    return db('user_weapons')
      .update(toUpdate)
      .where({ id: id })
      .then(() => InventoryService.getParsedWeaponById(db, id));
  },

  deleteWeapon(db, id) {
    return db('user_weapons')
      .del()
      .where({ id: id });
  },

  serializeWeapons(weapons) {
    return weapons.map(this.serializeWeapon);
  },

  serializeWeapon(weapon) {
    const weaponTree = new Treeize();

    const weaponData = weaponTree.grow([weapon]).getData()[0];

    return {
      user_weapon_id: weaponData.user_weapon_id,
      mfr_id: weaponData.mfr_id,
      mfr_name: weaponData.mfr_name,
      weapon_type: weaponData.weapon_type,
      name: weaponData.name,
      rarity: weaponData.rarity,
      id: weaponData.id,
      user_id: weaponData.user_id,
      char_id: weaponData.char_id,
      weapon_id: weaponData.weapon_id,
      pre_title_1: weaponData.pre_title_1,
      pre_title_2: weaponData.pre_title_2,
      prefix_1: weaponData.prefix_1,
      prefix_2: weaponData.prefix_2,
      element: weaponData.element,
      anointment: weaponData.anointment,
      anointment_id: weaponData.anointment_id,
      item_score: Number(xss(weaponData.item_score)),
      damage: Number(xss(weaponData.damage)),
      accuracy: Number(xss(weaponData.accuracy)),
      handling: Number(xss(weaponData.handling)),
      reload_time: Number(xss(weaponData.reload_time)),
      fire_rate: Number(xss(weaponData.fire_rate)),
      magazine_size: Number(xss(weaponData.magazine_size))
    };
  },

  getCharacterShieldInventory(db, user_id, char_id) {
    return db
      .select(
        'u.id as user_shield_id',
        'shield_id',
        'char_id',
        'mfr_name',
        'name',
        'rarity',
        'prefix',
        'element',
        'description as anointment',
        'anointment_id',
        'item_score',
        'capacity',
        'recharge_delay',
        'recharge_rate'
      )
      .from('user_shields as u')
      .join('shields as s', 'u.shield_id', '=', 's.id')
      .join('manufacturers as m', 's.mfr_id', '=', 'm.id')
      .leftJoin('anointments as a', 'u.anointment_id', '=', 'a.id')
      .where({ user_id: user_id, char_id: char_id });
  },

  getParsedShieldById(db, id) {
    return db
      .select(
        'u.id as user_shield_id',
        'char_id',
        'mfr_name',
        'name',
        'rarity',
        'prefix',
        'element',
        'description as anointment',
        'item_score',
        'capacity',
        'recharge_delay',
        'recharge_rate'
      )
      .from('user_shields as u')
      .join('shields as s', 'u.shield_id', '=', 's.id')
      .join('manufacturers as m', 's.mfr_id', '=', 'm.id')
      .leftJoin('anointments as a', 'u.anointment_id', '=', 'a.id')
      .where('u.id', id);
  },

  getShieldById(db, id) {
    return db
      .select('*')
      .from('user_shields')
      .where({ id: id });
  },

  insertShield(db, shield) {
    return db
      .insert(shield)
      .into('user_shields')
      .returning('*')
      .then(([shield]) => shield)
      .then(shield => InventoryService.getParsedShieldById(db, shield.id));
  },

  updateShield(db, id, toUpdate) {
    return db('user_shields')
      .update(toUpdate)
      .where({ id: id });
  },

  deleteShield(db, id) {
    return db('user_shields')
      .del()
      .where({ id: id });
  },

  serializeShields(shields) {
    return shields.map(this.serializeShield);
  },

  serializeShield(shield) {
    const shieldTree = new Treeize();

    const shieldData = shieldTree.grow([shield]).getData()[0];

    return {
      user_shield_id: shieldData.user_shield_id,
      mfr_name: shieldData.mfr_name,
      name: shieldData.name,
      rarity: shieldData.rarity,
      id: shieldData.id,
      user_id: shieldData.user_id,
      char_id: shieldData.char_id,
      shield_id: shieldData.shield_id,
      prefix: shieldData.prefix,
      element: shieldData.element,
      anointment: shieldData.anointment,
      anointment_id: shieldData.anointment_id,
      item_score: Number(xss(shieldData.item_score)),
      capacity: Number(xss(shieldData.capacity)),
      recharge_delay: Number(xss(shieldData.recharge_delay)),
      recharge_rate: Number(xss(shieldData.recharge_rate))
    };
  }
};

module.exports = InventoryService;
