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
        'p1.title as pre_title_1',
        'p2.title as pre_title_2',
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
      .leftJoin('prefixes as p1', 'prefix_1', '=', 'p1.id')
      .leftJoin('prefixes as p2', 'prefix_2', '=', 'p2.id')
      .where({ user_id: user_id, char_id: char_id });
  },

  getById(db, char_id, user_id, id) {
    return db
      .select(
        'char_id',
        'mfr_name',
        'weapon_type',
        'name',
        'rarity',
        'p1.title as pre_title_1',
        'p2.title as pre_title_2',
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
      .from('user_weapons as u')
      .join('weapons as w', 'u.weapon_id', '=', 'w.id')
      .join('manufacturers as m', 'w.mfr_id', '=', 'm.id')
      .leftJoin('anointments as a', 'u.anointment_id', '=', 'a.id')
      .leftJoin('prefixes as p1', 'prefix_1', '=', 'p1.id')
      .leftJoin('prefixes as p2', 'prefix_2', '=', 'p2.id')
      .where(qb => qb.where({ user_id: user_id, char_id: char_id }).andWhere('u.id', id));
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
