module.exports = {
    createEntity(row) {
        if(!row.id) {
            return {};
        }

        return {
            id: row.id,
            caption: row.caption,
            created_at: row.created_at,
            created_by: row.created_by
        }
    },

    async uploadImage(pool, id, caption, upload_by) {
        await pool.query('INSERT INTO pictures (id, caption, created_by) VALUES (?,?,?)',[id, caption, upload_by]);
    },

    async fetchAll(pool) {
        const [rows] = await pool.query('SELECT id, caption, DATE_FORMAT(created_at, "%D %M %Y") AS created_at, created_by FROM pictures');
        return rows.map(this.createEntity);
    },

    async getImage(pool, id) {
        const [rows] = await pool.query('SELECT id, caption, DATE_FORMAT(created_at, "%D %M %Y") AS created_at, created_by FROM pictures WHERE id = ?',[id]);
        return this.createEntity(rows[0]);
    },

    async fetchByCaption(pool,caption) {
        const [rows] = await pool.query('SELECT id, caption, DATE_FORMAT(created_at, "%D %M %Y") AS created_at, created_by FROM pictures WHERE caption LIKE ?',['%' + caption + '%']);
        return rows.map(this.createEntity);
    }
}