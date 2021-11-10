<template>
  <div>
    <div class="login">
      <div class="navi">
        <div class="navi-main">
          <div class="logo-login">
            <router-link to="/">
              <img src="../assets/images/logoweb.png" alt="" />
            </router-link>
            <div>Đăng nhập</div>
          </div>
          <div class="help">
            <a href="#">Cần giúp đỡ?</a>
          </div>
        </div>
      </div>
      <div class="main">
        <div class="content-main">
          <div class="login-wrap">
            <div class="login-html">
              <input
                id="tab-1"
                type="radio"
                name="tab"
                class="sign-in"
                checked
              /><label for="tab-1" class="tab">Sign In</label>
              <input id="tab-2" type="radio" name="tab" class="sign-up" /><label
                for="tab-2"
                class="tab"
                >Sign Up</label
              >
              <div class="login-form">
                <div class="sign-in-htm">
                  <div class="group">
                    <label for="user" class="label">Username</label>
                    <input
                      id="user"
                      v-model="username"
                      type="text"
                      class="input"
                    />
                  </div>
                  <div class="group">
                    <label for="pass" class="label">Password</label>
                    <input
                      id="pass"
                      v-model="password"
                      type="password"
                      class="input"
                      data-type="password"
                    />
                  </div>
                  <div class="group">
                    <input
                      id="check"
                      v-model="remember"
                      type="checkbox"
                      class="check"
                      checked
                    />
                    <label for="check"
                      ><span class="icon"></span> Keep me Signed in</label
                    >
                  </div>
                  <div class="group">
                    <input
                      type="submit"
                      class="button"
                      value="Sign In"
                      @click="login"
                    />
                  </div>
                  <div class="hr"></div>
                  <div class="foot-lnk">
                    <a href="#forgot">Forgot Password?</a>
                  </div>
                </div>
                <div class="sign-up-htm">
                  <div class="group">
                    <label for="user" class="label">Username</label>
                    <input id="user" type="text" class="input" />
                  </div>
                  <div class="group">
                    <label for="pass" class="label">Password</label>
                    <input
                      id="pass"
                      type="password"
                      class="input"
                      data-type="password"
                    />
                  </div>
                  
                  <div class="group">
                    <label for="pass" class="label">Repeat Password</label>
                    <input
                      id="pass"
                      type="password"
                      class="input"
                      data-type="password"
                    />
                  </div>
                  <div class="group">
                    <label for="pass" class="label">Email Address</label>
                  </div>
                  <div class="group">
                    <label for="pass" class="label">Repeat Password</label>
                    <input
                      id="pass"
                      type="password"
                      class="input"
                      data-type="password"
                    />
                  </div>
                  <div class="group">
                    <label for="pass" class="label">Email Address</label>
                  </div>
                  <div class="group">
                    <label for="pass" class="label">Repeat Password</label>
                    <input
                      id="pass"
                      type="password"
                      class="input"
                      data-type="password"
                    />
                  </div>
                  <div class="group">
                    <label for="pass" class="label">Email Address</label>
                  </div>

                  <div class="group">
                    <label for="pass" class="label">Repeat Password</label>
                    <input
                      id="pass"
                      type="password"
                      class="input"
                      data-type="password"
                    />
                  </div>
                  <div class="group">
                    <label for="pass" class="label">Email Address</label>
                  </div>

                  <div class="group">
                    <input type="submit" class="button" value="Sign Up" />
                  </div>
                  <div class="hr"></div>
                  <div class="foot-lnk"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      username: "",
      password: "",
      remember: "",
    };
  },
  methods: {
    login() {
      let self = this;
      axios({
        method: "post",
        data: {
          username: self.username,
          password : self.password,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=user&action=login",
      }).then((response) => {
        if(response.data.status == 200){
            console.log(response.data.account[0]);
          
          // localStorage.setItem('token', response.data.token);
          self.$store.state.user.info = response.data.account[0];
          self.$store.state.user.token = response.data.token;
          self.$router.push({ path: '/home' })
        }
      });
    },
 
   
  },
  components: {
  },
  created(){
  }
};
</script>
<style lang="scss">
@import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700&display=swap');
*{
  font-family: 'Roboto', sans-serif;
}
.login {
  .navi {
    color: orangered;

    width: 75%;
    margin: auto;
    height: 10vh;
    .navi-main {
      height: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px;
      .logo-login {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        a {
          display: block;
          height: 100%;
          img {
            height: 100%;
            border-radius: 999px;
          }
        }
        div {
          font-size: 1.7em;
          margin-left: 10px;
        }
      }
      .help {
        a {
          color: orangered;
        }
      }
    }
  }
  .main {
    background-image: url("../assets/images/background-login.jpg");
    background-size: cover;
    padding: 100px 0px;
    .content-main {
      .login-wrap {
        width: 100%;
        margin: auto;
        max-width: 525px;
        min-height: 670px;
        position: relative;
        background: wheat;
        box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24),
          0 17px 50px 0 rgba(0, 0, 0, 0.19);
      }
      .login-html {
        width: 100%;
        height: 100%;
        position: absolute;
        padding: 90px 70px 50px 70px;
        background: rgba(40, 57, 101, 0.9);
      }
      .login-html .sign-in-htm,
      .login-html .sign-up-htm {
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        position: absolute;
        transform: rotateY(180deg);
        backface-visibility: hidden;
        transition: all 0.4s linear;
      }
      .login-html .sign-in,
      .login-html .sign-up,
      .login-form .group .check {
        display: none;
      }
      .login-html .tab,
      .login-form .group .label,
      .login-form .group .button {
        text-transform: uppercase;
      }
      .login-html .tab {
        font-size: 22px;
        margin-right: 15px;
        padding-bottom: 5px;
        margin: 0 15px 10px 0;
        display: inline-block;
        border-bottom: 2px solid transparent;
      }
      .login-html .sign-in:checked + .tab,
      .login-html .sign-up:checked + .tab {
        color: #fff;
        border-color: #1161ee;
      }
      .login-form {
        min-height: 345px;
        position: relative;
        perspective: 1000px;
        transform-style: preserve-3d;
      }
      .login-form .group {
        margin-bottom: 15px;
      }
      .login-form .group .label,
      .login-form .group .input,
      .login-form .group .button {
        width: 100%;
        color: #fff;
        display: block;
      }
      .login-form .group .input,
      .login-form .group .button {
        border: none;
        padding: 15px 20px;
        border-radius: 25px;
        background: rgba(255, 255, 255, 0.1);
      }
      .login-form .group input[data-type="password"] {
        text-security: circle;
        -webkit-text-security: circle;
      }
      .login-form .group .label {
        color: #aaa;
        font-size: 12px;
      }
      .login-form .group .button {
        background: #1161ee;
      }
      .login-form .group label .icon {
        width: 15px;
        height: 15px;
        border-radius: 2px;
        position: relative;
        display: inline-block;
        background: rgba(255, 255, 255, 0.1);
      }
      .login-form .group label .icon:before,
      .login-form .group label .icon:after {
        content: "";
        width: 10px;
        height: 2px;
        background: #fff;
        position: absolute;
        transition: all 0.2s ease-in-out 0s;
      }
      .login-form .group label .icon:before {
        left: 3px;
        width: 5px;
        bottom: 6px;
        transform: scale(0) rotate(0);
      }
      .login-form .group label .icon:after {
        top: 6px;
        right: 0;
        transform: scale(0) rotate(0);
      }
      .login-form .group .check:checked + label {
        color: #fff;
      }
      .login-form .group .check:checked + label .icon {
        background: #1161ee;
      }
      .login-form .group .check:checked + label .icon:before {
        transform: scale(1) rotate(45deg);
      }
      .login-form .group .check:checked + label .icon:after {
        transform: scale(1) rotate(-45deg);
      }
      .login-html
        .sign-in:checked
        + .tab
        + .sign-up
        + .tab
        + .login-form
        .sign-in-htm {
        transform: rotate(0);
      }
      .login-html .sign-up:checked + .tab + .login-form .sign-up-htm {
        transform: rotate(0);
      }

      .hr {
        height: 2px;
        margin: 60px 0 50px 0;
        background: rgba(255, 255, 255, 0.2);
      }
      .foot-lnk {
        text-align: center;
      }
    }
  }
}
a {
  text-decoration: none;
}
</style>