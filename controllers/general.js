module.exports = function(imageModel, likeModel, commentModel, pool) {
    return {
        async homepage(ctx,next) {
            let imageObject = await imageModel.fetchAll(pool);
            let likeObject = await likeModel.countAllImageLike(pool,imageObject);
            let commentObject = await commentModel.countImageComment(pool,imageObject);
            const data = {
                data: imageObject,
                like: likeObject,
                comment: commentObject,
                user: ctx.session.userId
            };
            await ctx.render('homepage', data);
            await next();
        },

        async pikkaPage(ctx,next) {
            let imageObject = await imageModel.getImage(pool,ctx.params.id);
            let commentObject = await commentModel.getImageComment(pool,ctx.params.id);
            let likeObject = await likeModel.countImageLike(pool,ctx.params.id);
            let isLike = await likeModel.isLike(pool, ctx.params.id, ctx.session.userId);
            const data = {
                imgData : imageObject,
                commentData : commentObject,
                likeAmount : likeObject,
                user: ctx.session.userId,
                isLike : isLike
            }
            await ctx.render('pikka', data);
            await next();
        },

        async postComment(ctx,next) {
            let post_by_user = ctx.session.userId;
            await commentModel.addComment(pool, ctx.params.id, ctx.request.body.comment, post_by_user);
            await ctx.redirect('/pikka/' + ctx.params.id);
            await next();
        },

        async imageLike(ctx,next) {
            let like_by_user = ctx.session.userId;
            await likeModel.addLike(pool,ctx.params.id,like_by_user);
            await ctx.redirect('/pikka/' + ctx.params.id);
            await next();
        },

        async searchImg(ctx,next) {
            let imageObject = await imageModel.fetchByCaption(pool,ctx.request.body.caption);
            let likeObject = await likeModel.countAllImageLike(pool,imageObject);
            let commentObject = await commentModel.countImageComment(pool,imageObject);
            const data = {
                data: imageObject,
                like: likeObject,
                comment: commentObject,
                user: ctx.session.userId
            };
            await ctx.render('homepage', data);
            await next();
        }
    }
}