/* eslint-disable strict */
const xss = require('xss');
const Treeize = require('treeize');

const CharactersService = {
  getAllUserCharacters(db, user_id) {
    return db
      .select('id', 'user_id', 'character', 'character_name')
      .from('user_characters')
      .where('user_id', user_id)
      .orderBy('id');
  },

  getCharById(db, char_id, user_id) {
    return db
      .select('*')
      .from('user_characters')
      .where({ user_id: user_id, id: char_id });
  },

  insertCharacter(db, char) {
    return db
      .insert(char)
      .into('user_characters')
      .returning('*')
      .then(([char]) => char)
      .then(char => CharactersService.getCharById(db, char.id, char.user_id));
  },

  updateCharacter(db, updatedChar) {
    return db('user_characters')
      .update({ character_name: updatedChar.character_name })
      .where({ user_id: updatedChar.user_id, id: updatedChar.id });
  },

  deleteCharacter(db, user_id, id) {
    return db('user_characters')
      .del()
      .where({ user_id: user_id, id: id });
  },

  serializeCharacters(characters) {
    return characters.map(this.serializeCharacter);
  },

  serializeCharacter(character) {
    const characterTree = new Treeize();

    const characterData = characterTree.grow([character]).getData()[0];

    return {
      id: characterData.id,
      user_id: characterData.user_id,
      character: characterData.character,
      character_name: xss(characterData.character_name)
    };
  }
};

module.exports = CharactersService;
