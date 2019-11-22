/* eslint-disable strict */

const AnointmentsService = {
  getAllAnointments(db, query) {
    return db
      .select('*')
      .from('anointments')
      .where(qb => {
        if (query.terror) {
          qb.where('description', 'ilike', '%terror%');
          qb.orWhere('description', 'ilike', '%terrified%');
        }
      })
      .andWhere(qb => {
        console.log(query);
        if (query.class) qb.andWhere({ class: query.class });
        /*
        if (query.universal) qb.andWhere({ class: 'Universal' });
        if (query.beastmaster) qb.andWhere({ class: 'Beastmaster' });
        if (query.gunner) qb.andWhere({ class: 'Gunner' });
        if (query.operative) qb.andWhere({ class: 'Operative' });
        if (query.siren) qb.andWhere({ class: 'Siren' });
        */
      });
  }
};

module.exports = AnointmentsService;
