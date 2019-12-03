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
        if (query.class) qb.andWhere({ class: query.class });
      });
  }
};

module.exports = AnointmentsService;
