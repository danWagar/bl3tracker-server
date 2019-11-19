/* eslint-disable strict */
const xss = require('xss');
const Treeize = require('treeize');

const ItemsService = {
  getAllItems(db) {
    return db
      .select('w.id', 'weapon_type', 'mfr_name', 'name', 'rarity')
      .from('weapons as w')
      .join('manufacturers as m', 'm.id', 'w.mfr_id');
  },

  getById(db, id) {
    return ItemsService.getAllItems(db)
      .where('thg.id', id)
      .first();
  },

  getReviewsForItem(db, item_id) {
    return db
      .from('itemful_reviews AS rev')
      .select('rev.id', 'rev.rating', 'rev.text', 'rev.date_created', ...userFields)
      .where('rev.item_id', item_id)
      .leftJoin('itemful_users AS usr', 'rev.user_id', 'usr.id')
      .groupBy('rev.id', 'usr.id');
  },

  serializeItems(items) {
    return items.map(this.serializeItem);
  },

  serializeItem(item) {
    const itemTree = new Treeize();

    // Some light hackiness to allow for the fact that `treeize`
    // only accepts arrays of objects, and we want to use a single
    // object.
    const itemData = itemTree.grow([item]).getData()[0];

    return {
      id: itemData.id,
      weapon_type: itemData.weapon_type,
      mfr_name: itemData.mfr_name,
      name: xss(itemData.name),
      rarity: itemData.rarity
    };
  },

  serializeItemReviews(reviews) {
    return reviews.map(this.serializeItemReview);
  },

  serializeItemReview(review) {
    const reviewTree = new Treeize();

    // Some light hackiness to allow for the fact that `treeize`
    // only accepts arrays of objects, and we want to use a single
    // object.
    const reviewData = reviewTree.grow([review]).getData()[0];

    return {
      id: reviewData.id,
      rating: reviewData.rating,
      item_id: reviewData.item_id,
      text: xss(reviewData.text),
      user: reviewData.user || {},
      date_created: reviewData.date_created
    };
  }
};

const userFields = [
  'usr.id AS user:id',
  'usr.user_name AS user:user_name',
  'usr.date_created AS user:date_created',
  'usr.date_modified AS user:date_modified'
];

module.exports = ItemsService;
