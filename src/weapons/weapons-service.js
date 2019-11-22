/* eslint-disable strict */
const xss = require('xss');
const Treeize = require('treeize');

const WeaponsService = {
  getAllWeapons(db) {
    return db
      .select('w.id', 'weapon_type', 'mfr_id', 'mfr_name', 'name', 'rarity')
      .from('weapons as w')
      .join('manufacturers as m', 'm.id', 'w.mfr_id');
  },

  getById(db, id) {
    return WeaponsService.getAllWeapons(db)
      .where('w.id', id)
      .first();
  },

  //select mfr_name, title from prefixes join manufacturers m on mfr_id = m.id where mfr_name ilike 'atlas';
  getPrevixesByMfr(db, id) {
    return (
      db
        .select('mfr_id', 'title')
        .from('prefixes')
        //.join('manufacturers as m', 'm.id', 'mfr_id')
        .where('mfr_id', id)
    );
  },

  serializeWeapons(weapons) {
    return weapons.map(this.serializeWeapon);
  },

  serializeWeapon(weapon) {
    const weaponTree = new Treeize();

    // Some light hackiness to allow for the fact that `treeize`
    // only accepts arrays of objects, and we want to use a single
    // object.
    const weaponData = weaponTree.grow([weapon]).getData()[0];

    return {
      id: weaponData.id,
      weapon_type: weaponData.weapon_type,
      mfr_id: weaponData.mfr_id,
      mfr_name: weaponData.mfr_name,
      name: xss(weaponData.name),
      rarity: weaponData.rarity
    };
  }
};

const userFields = [
  'usr.id AS user:id',
  'usr.user_name AS user:user_name',
  'usr.date_created AS user:date_created',
  'usr.date_modified AS user:date_modified'
];

module.exports = WeaponsService;
