module.exports = {
    createEntity(row) {
        if (!row.id)
            return {};
         
        return {
            id: row.id,
            email: row.email,
            password: row.password,
            created_at: row.created_at
        }
    },

    async createAccount(pool, user, password) {
        await pool.query('INSERT INTO users (email, password) VALUES (?,?)',[user,password]);
    },

    async checkAccountRegister(pool, user) {
        const [rows] = await pool.query('SELECT * FROM users WHERE email = ?',[user]);
        if(rows.length > 0) {
            return true;
        } else {
            return false;
        }
    },

    async checkAccountLogin(pool, user) {
        const [rows] = await pool.query('SELECT * FROM users WHERE email = ?',[user]);
        if(rows.length > 0) {
            return this.createEntity(rows[0]);
        } else {
            return false;
        }
    }
}