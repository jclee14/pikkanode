const Koa = require('koa');
const Router = require('koa-router');
const serve = require('koa-static');
const mysql = require('mysql2/promise');
const path = require('path');
const render = require('koa-ejs');
const koaBody = require('koa-body');
const session = require('koa-session');

const app = new Koa();
const router = new Router();

/* const stripPrefix = async (ctx,next) =>{
    if(!ctx.path.startsWith('/-')){
        ctx.status = 404;
        return;
    }
    ctx.path = ctx.path.slice(2);
    await next();
} */

render(app, {
    root: path.join(__dirname, 'views'),
    layout: 'template',
    viewExt: 'ejs',
    cache: false
});

const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'pikkanode'
});

const sessionStore = {};
const sessionConfig = {
    key: 'sess',
    maxAge: 1000 * 60 * 60,
    httpOnly: true,
    store: {
        get (key, maxAge, { rolling }) {
            return sessionStore[key];
        },
        set (key, sess, maxAge, { rolling }) {
            sessionStore[key] = sess;
        },
        destroy (key) {
            delete sessionStore[key];
        }
    }
}

const flash = async (ctx, next) => { // Flash middleware
    if (!ctx.session) throw new Error('flash message required session');
    ctx.flash = ctx.session.flash;
    delete ctx.session.flash;
    await next();
};

const checkAuth = async (ctx, next) => {
    if (!ctx.session || !ctx.session.userId) {
      console.log('you are not signed in');
      const data = {
          task: 'authSignIn',
          message: 'Please sign in to take this action.',
          user: ctx.session.userId
      }
      await ctx.render('accountStatus', data);
      return;
    }
    await next()
};

const checkIfSignIn = async (ctx, next) => {
    if (ctx.session && ctx.session.userId) {
      console.log('you have signed in already.');
      ctx.redirect('/');
      return;
    }
    await next()
};

//--------------------Module Import------------------------
const userModel = require('./models/user');
const userTemp = require('./controllers/user');
const userController = userTemp(userModel,pool);

const imageModel = require('./models/image');
const imageTemp = require('./controllers/image');
const imageController = imageTemp(imageModel,pool);

const likeModel = require('./models/like');
const commentModel = require('./models/comment');

const generalTemp = require('./controllers/general');
const generalController = generalTemp(imageModel, likeModel, commentModel,pool);

//--------------------Router------------------------
router.get('/', generalController.homepage);
router.post('/', generalController.searchImg);
router.get('/pikka/:id', generalController.pikkaPage);
router.post('/pikka/:id', checkAuth, generalController.postComment);
router.get('/pikka/:id/like', checkAuth, generalController.imageLike);

router.get('/signin', checkIfSignIn, userController.signInGetHandler);
router.post('/signin', checkIfSignIn, userController.signInPostHandler);
router.get('/signup', checkIfSignIn, userController.signUpGetHandler);
router.post('/signup', checkIfSignIn, userController.signUpPostHandler);

router.get('/signout', userController.signOutGetHandler);

router.get('/create', checkAuth, imageController.uploadGetHandler);
router.post('/create', checkAuth, koaBody({ multipart: true }), imageController.uploadPostHandler);

app.keys = ['supersecret'];
app.use(session(sessionConfig, app));
app.use(flash);
app.use(koaBody()); 
app.use(serve(path.join(__dirname, 'public')));
app.use(router.routes());
app.use(router.allowedMethods());

//app.use(stripPrefix);

//fs.ensureDir(pictureDir,() => {
    app.listen(3000);
//});