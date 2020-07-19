const bcrypt = require('bcrypt');
  
module.exports = function(userModel, pool) {
    return {
        async signInGetHandler (ctx,next) {
            const data = {
                flash: ctx.flash,
                user: ctx.session.userId
            }
            await ctx.render('signIn', data);
            await next();
        },

        async signInPostHandler (ctx,next) {
            // For email validation
            const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            const email = ctx.request.body.email;
            const password = ctx.request.body.password;

            if (!email) {
                ctx.session.flash = { error: 'Email required' };
                return ctx.redirect('/signin');
            }
            if(!re.test(email)) {
                ctx.session.flash = { error: 'Email is invalid!' };
                return ctx.redirect('/signin');
            }
            if (!password) {
                ctx.session.flash = { error: 'Password required' };
                return ctx.redirect('/signin');
            }
            
            const userObject = await userModel.checkAccountLogin(pool, email);

            if(!userObject) {
                ctx.session.flash = { error: 'Email is invalid!' };
                ctx.redirect('/signin');
            } else {
                const same = await bcrypt.compare(password, userObject.password);
                if(!same) {
                    ctx.session.flash = { error: 'Your password is wrong!!' };
                    ctx.redirect('/signin');
                } else {
                    // ** Create user session!!
                    ctx.session.userId = userObject.id;
                    const data = {
                        task: 'signin',
                        message: 'Account was signed-in successfully.',
                        user: ctx.session.userId
                    };
                    await ctx.render('accountStatus', data);
                }
            }
            await next();
        },

        async signOutGetHandler (ctx,next) {
            ctx.session = null;
            return ctx.redirect('/');
            await next();
        },

        async signUpGetHandler (ctx,next) {
            const data = {
                flash: ctx.flash,
                user: ctx.session.userId
            }
            await ctx.render('signUp', data);
            await next();
        },

        async signUpPostHandler (ctx,next) {
            const email = ctx.request.body.email;
            const password = ctx.request.body.password;
            const rePassword = ctx.request.body.repassword;
            const hashedPassword = await bcrypt.hash(password, 10);

            // For email validation
            const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            
            if(!email) {
                ctx.session.flash = { error: 'Please enter your email.'};
                return ctx.redirect('/signup');
            }

            if(!re.test(email)) {
                ctx.session.flash = { error: 'Email is invalid!' };
                return ctx.redirect('/signup');
            }
            
            if(await userModel.checkAccountRegister(pool, email)) {
                ctx.session.flash = { error: 'Email is already registered!' };
                return ctx.redirect('/signup');
            }

            if(!password) {
                ctx.session.flash = { error: 'Password is required!'};
                return ctx.redirect('/signup');
            }
            
            if(password !== rePassword) {
                ctx.session.flash = { error: 'Password is not matched!!' };
                return ctx.redirect('/signup');
            }

            await userModel.createAccount(pool, email, hashedPassword);
            const data = {
                task: 'signup',
                message: 'Account was created successfully.',
                user: ctx.session.userId
            };
            await ctx.render('accountStatus', data);
            await next();
        }
    }
}