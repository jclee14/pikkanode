module.exports = {
    createEntity(row) {
        if('COUNT(*)') {
            return row['COUNT(*)'];
        }
    },

    async countAllImageLike(pool,imgObj) {
        let likeObj = {};
        for(let img in imgObj) {
            let [rows] = await pool.query('SELECT COUNT(*) FROM likes WHERE picture_id = ?',[imgObj[img].id]);
            likeObj[imgObj[img].id] = await this.createEntity(rows[0]);
        }
        return likeObj;
    },

    async countImageLike(pool,id) {
        const [rows] = await pool.query('SELECT COUNT(*) FROM likes WHERE picture_id = ?',id);
        return this.createEntity(rows[0]);
    },

    async addLike(pool,pic_id,like_by) {
        const [rows] = await pool.query('SELECT * FROM likes WHERE picture_id = ? AND user_id = ?',[pic_id,like_by]);
        if(rows.length == 0) {
            await pool.query('INSERT INTO likes (user_id, picture_id) VALUES (?,?)',[like_by,pic_id]);
        } else {
            await pool.query('DELETE FROM likes WHERE picture_id = ? AND user_id = ?',[pic_id,like_by]);
        }
    },

    async isLike(pool,pic_id,like_by) {
        const [rows] = await pool.query('SELECT * FROM likes WHERE picture_id = ? AND user_id = ?',[pic_id,like_by]);
        if(rows.length == 0) {
            return false;
        } else {
            return true;
        }
    }
}