/* eslint-disable strict */
const xss = require('xss');
const Treeize = require('treeize');

const InventoryService = {
  /* select mfr_name, weapon_type, name, rarity, title as pre_title_1, 
 title as pre_title_2, element, description as anointment, item_score,
 damage, accuracy, handling, reload_time, fire_rate, magazine_size
 from user_weapons
 join weapons w on weapon_id = w.id
 join manufacturers m on w.mfr_id = m.id
 left join anointments a on anointment_id = a.id
 left join prefixes p on prefix_1 = p.id or prefix_2 = p.id
 where user_id = ? and char_id = ?;
 */
  getCharacterWeaponInventory(db, user_id, char_id) {
    return db
      .select(
        'mfr_name',
        'weapon_type',
        'name',
        'rarity',
        'title as pre_title_1',
        'title as pre_title_2',
        'element',
        'description as anointment',
        'item_score',
        'damage',
        'accuracy',
        'handling',
        'reload_time',
        'fire_rate',
        'magazine_size'
      )
      .from('user_weapons')
      .join('weapons as w', 'weapon_id', '=', 'w.id')
      .join('manufacturers as m', 'w.mfr_id', '=', 'm.id')
      .leftJoin('anointments as a', 'anointment_id', '=', 'a.id')
      .leftJoin('prefixes as p', qb => qb.on('prefix_1', '=', 'p.id').orOn('prefix_2', '=', 'p.id'))
      .where({ user_id: user_id, char_id: char_id });
  },

  getById(db, char_id, user_id, id) {
    return db
      .select('*')
      .from('user_weapons')
      .where({ user_id: user_id, char_id: char_id, id: id });
  },

  insertWeapon(db, weapon) {
    console.log('inserting weapon ', weapon);
    console.log('user_id type is ' + typeof weapon.user_id);
    return db
      .insert(weapon)
      .into('user_weapons')
      .returning('*')
      .then(([weapon]) => weapon)
      .then(weapon => InventoryService.getById(db, weapon.char_id, weapon.user_id, weapon.id));
  },

  serializeWeapons(weapons) {
    return weapons.map(this.serializeWeapon);
  },

  serializeWeapon(weapon) {
    const weaponTree = new Treeize();

    const weaponData = weaponTree.grow([weapon]).getData()[0];

    return {
      id: weaponData.id,
      user_id: weaponData.user_id,
      char_id: weaponData.char_id,
      weapon_id: weaponData.weapon_id,
      prefix_1: xss(weaponData.prefix_1),
      prefix_2: xss(weaponData.prefix_2),
      element: weaponData.element,
      anointment_id: weaponData.anointment_id,
      item_score: xss(weaponData.item_score),
      damage: xss(weaponData.damage),
      accuracy: xss(weaponData.accuracy),
      handling: xss(weaponData.handling),
      reload_time: xss(weaponData.reload_time),
      fire_rate: xss(weaponData.fire_rate),
      magazine_size: xss(weaponData.magazine_size)
    };
  }
};

module.exports = InventoryService;
