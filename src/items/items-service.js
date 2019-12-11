/* eslint-disable strict */
const xss = require('xss');
const Treeize = require('treeize');

const ItemService = {
  getAllWeapons(db, query) {
    return db
      .select('w.id', 'weapon_type', 'mfr_id', 'mfr_name', 'name', 'rarity')
      .from('weapons as w')
      .join('manufacturers as m', 'm.id', 'w.mfr_id')
      .where(qb => {
        if (query.mfr_id) qb.where('w.mfr_id', '=', query.mfr_id);
        if (query.weapon_type) qb.andWhere('weapon_type', '=', query.weapon_type);
      });
  },

  getPrevixesByMfr(db, id) {
    return db
      .select('id', 'title')
      .from('prefixes')
      .where('mfr_id', id);
  },

  serializeWeapons(weapons) {
    return weapons.map(this.serializeWeapon);
  },

  serializeWeapon(weapon) {
    const weaponTree = new Treeize();
    const weaponData = weaponTree.grow([weapon]).getData()[0];

    return {
      id: weaponData.id,
      weapon_type: weaponData.weapon_type,
      mfr_id: weaponData.mfr_id,
      mfr_name: weaponData.mfr_name,
      name: xss(weaponData.name),
      rarity: weaponData.rarity
    };
  },

  getAllShields(db, query) {
    return db
      .select('s.id', 'mfr_id', 'mfr_name', 'name', 'rarity')
      .from('shields as s')
      .join('manufacturers as m', 'm.id', 's.mfr_id')
      .where(qb => {
        if (query.mfr_id) qb.where('s.mfr_id', '=', query.mfr_id);
      });
  },

  serializeShields(shields) {
    return shields.map(this.serializeShield);
  },

  serializeShield(shield) {
    const shieldTree = new Treeize();
    const shieldData = shieldTree.grow([shield]).getData()[0];

    return {
      id: shieldData.id,
      mfr_id: shieldData.mfr_id,
      mfr_name: shieldData.mfr_name,
      name: xss(shieldData.name),
      rarity: shieldData.rarity
    };
  }
};

module.exports = ItemService;
