const path = require('path');
const uuidv4 = require('uuid/v4');
const fs = require('fs-extra');

const allowFileType = {
    'image/png': true,
    'image/jpeg': true
};
const pictureDir = path.join(__dirname, '../public', 'images'); // Or use process.cwd() instead ../public

module.exports = function(imageModel, pool) {
    return {
        async uploadGetHandler (ctx,next) {
            const data = {
                user: ctx.session.userId
            }
            await ctx.render('upload', data);
            await next();
        },

        async uploadPostHandler (ctx,next) {
            try {
                if(!allowFileType[ctx.request.files.photo.type]) {
                    throw new Error('file type not allow');
                }
                const fileName = uuidv4();
                await fs.rename(ctx.request.files.photo.path, path.join(pictureDir, fileName));
                await imageModel.uploadImage(pool, fileName, ctx.request.body.caption, ctx.session.userId);
                ctx.status = 303;
                ctx.redirect('/');
            } catch (err) {
                ctx.status = 400;
                ctx.body = err.message;
                fs.remove(ctx.request.files.photo.path);
            }
        }
    }
}