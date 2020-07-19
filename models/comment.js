module.exports = {
    createCountEntity(row) {
        if('COUNT(*)') {
            return row['COUNT(*)'];
        }
    },

    createEntity(row) {
        if(row.length == 0) {
            return [];
        }

        return {
            id: row.id,
            text: row.text,
            picture_id: row.picture_id,
            created_by: row.created_by,
            created_at: row.created_at
        }
    },

    async countImageComment(pool,imgObj) {
        let commentObj = {};
        for(let img in imgObj) {
            let [rows] = await pool.query('SELECT COUNT(*) FROM comments WHERE picture_id = ?',[imgObj[img].id]);
            commentObj[imgObj[img].id] = await this.createCountEntity(rows[0]);
        }
        return commentObj;
    },

    async addComment(pool,pic_id,comment,post_by) {
        await pool.query('INSERT INTO comments (text, picture_id, created_by) VALUES (?,?,?)',[comment,pic_id,post_by]);
    },

    async getImageComment(pool,pic_id) {
        const [rows] = await pool.query('SELECT id, text, picture_id, created_by, DATE_FORMAT(created_at, "%D %M %Y") AS created_at FROM comments WHERE picture_id = ?',[pic_id]);
        return rows.map(this.createEntity);
    }
}