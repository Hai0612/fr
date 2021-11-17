<template>
  <div>
    <div class="login">
      <div class="navi">
        <div class="navi-main">
          <div class="logo-login">
            <router-link to="/">
              <img src="../assets/images/logoweb.png" alt="" />
            </router-link>
            <div>Đăng ký thành viên</div>
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
                id="tab-2"
                type="radio"
                name="tab"
                class="sign-up"
                checked
              /><label for="tab-2" class="tab">Đăng kí người dùng</label>
              <div class="login-form">
                <div class="sign-up-htm">
                  <div class="form-cc" action="">
                    <div class="">
                      <div class="row-cc">
                        <div class="cc-field">
                          <div class="row">
                            <div class="col col-sm-4 div-message">
                              <input
                                type="text"
                                class="input cc-txt"
                                v-model="username"
                                required
                                placeholder="Tên đăng nhập"
                              />
                              <p id="message-signup">Tài khoản không khả dụng</p>
                            </div>
                            <div class="col col-sm-4">
                              <input
                                type="text"
                                v-model="firstname"
                                class="input cc-txt"
                                required
                                placeholder="Họ"
                              />
                            </div>
                            <div class="col col-sm-4">
                              <input
                                type="text"
                                class="input cc-txt"
                                placeholder="Tên"
                                required
                                v-model="lastname"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row-cc">
                        <div class="cc-field">
                          <div class="row">
                            <div class="col col-sm-6">
                              <input
                                type="password"
                                class="input cc-txt"
                                v-model="password"
                                required
                                placeholder="Mật khẩu"
                              />
                            </div>
                            <div class="col col-sm-6 div_mesPass">
                              <input
                                type="password"
                                class="input cc-txt"
                                v-model="rePassword"
                                required
                                placeholder="Nhập lại mật khẩu"
                              />
                              <span id="repw">{{mesRepass}}</span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row-cc">
                        <div class="cc-field">
                          <div class="row">
                            <div class="col col-sm-4">
                              <input
                                type="text"
                                required
                                class="input cc-txt"
                                v-model="date"
                                placeholder="Ngày sinh (yyyy-mm-dd)"
                              />
                            </div>
                            <div class="col col-sm-4 div_mesEmail">
                              <input
                                type="text"
                                class="input cc-txt"
                                v-model="email"
                                required
                                placeholder="Email"
                              />
                              <span id="mesEmail">{{messageEmail}}</span>
                            </div>
                            <div class="col col-sm-4">
                              <input
                                type="text"
                                class="input cc-txt"
                                v-model="phone"
                                required
                                placeholder="Số điện thoại"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row-cc">
                        <div class="cc-field">
                          <div class="row">
                            <div class="col col-sm-8">
                              <input
                                type="text"
                                class="input cc-txt"
                                v-model="address"
                                placeholder="Địa chỉ"
                                required
                              />
                            </div>
                            <div class="col col-sm-4">
                              <input
                                type="text"
                                class="input cc-txt"
                                v-model="city"
                                placeholder="Thành phố"
                                required
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row-cc">
                        <div class="cc-field">
                          <div class="row">
                            <div class="col col-sm-6">
                              <input
                                type="text"
                                class="input cc-txt"
                                required
                                v-model="country"
                                placeholder="Quốc gia"
                              />
                            </div>
                            <div class="col col-sm-6">
                              <input
                                type="text"
                                class="input cc-txt"
                                v-model="postalCode"
                                required
                                placeholder="Mã bưu điện"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row-cc" style="margin-top: 50px">
                        <div class="cc-field">
                          <div class="row">
                            <div class="col col-sm-9">
                                <p style="margin-left : 60px ; color: red">
                                  {{alertMes}}
                                </p>
                            </div>
                            <div class="col col-sm-3">
                              <button
                                @click="signupNewUser()"
                                class="btn btn-success btn-block"
                                href="#myModal"
                                data-toggle="modal"
                              >
                                Đăng kí
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- test_modal -->
            <div>
                
            </div>
          </div>
        </div>
      </div>
    </div>

<!-- Button to trigger modal -->

 
  <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <br>
            {{statusSingup}} <i class="fas fa-check-circle"></i>
            </div>
            <div class="modal-footer">
            <router-link v-if="showStatusSignup" to="/login" type="button" class="btn btn-success" data-dismiss="modal">Đăng nhập</router-link>
            <button v-if="!showStatusSignup" type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
  
  </div>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      username: "",
      firstname: "",
      lastname: "",
      password: "",
      rePassword: "",
      city: "",
      alertMes : '',
      country: "",
      statusSingup: "",
      showStatusSignup: true,
      postalCode: "",
      address: "",
      date: "",
      email: "",
      phone: "",
      remember: "",
      messageEmail: '',
      mesRepass : '',
      completeSignup: true,
      correctEmail: false,
      matchPass : false,
    };
  },
  watch: {
  'email': function(to, from) {
    console.log(from)
    if(this.validateEmail(to)){
      this.messageEmail = 'Email hợp lệ'
      this.correctEmail = true;
      document.getElementById('mesEmail').style.color = 'green'
    }else{
      this.correctEmail = false;
      this.messageEmail = 'Email không hợp lệ'
      document.getElementById('mesEmail').style.color = 'red'

    }
    if(to === ''){
      this.messageEmail = '   '
    }
    },
    'rePassword': function(to) {
        if(this.rePassword == ''){
          this.mesRepass = ''

        }
        if(to !== this.password && this.password !== ''){
          this.matchPass = false;
          this.mesRepass = 'Mật khẩu không khớp'
          document.getElementById('repw').style.color = 'red';
        }
        if(this.rePassword == this.password && this.password !== ''){
          this.matchPass = true;
          this.mesRepass = 'Mật khẩu khớp';
           document.getElementById('repw').style.color = 'green';
        }
    }
  },
  
  methods: {
    async signupNewUser() {
      if(this.username != '' && this.password != '' && this.firstname != '' && this.lastname != '' && this.email != '' && this.username != '' && this.matchPass && this.correctEmail){
        console.log('dung')
        let self = this;
      await axios({
        method: "post",
        data: {
          username: self.username,
          password: self.password,
          first_name: self.firstname,
          last_name: self.lastname,
          date: self.date,
          email: self.email,
          phone: self.phone,
          url: "https://scontent.fhan5-7.fna.fbcdn.net/v/t1.6435-9/146475450_2769270033402673_5487437979516709612_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=ZMajIOR_VWsAX-l0z6u&tn=j9zFo5b3LI9ET1Pa&_nc_ht=scontent.fhan5-7.fna&oh=a8d0cf37b2532773e50f7eee9b3a0066&oe=61B3EDEA",
          address: self.address,
          city : self.city,
          country :self.country,
          postal_code: self.postalCode,

        },
        url: "https://localhost/ecommerce_backend/index.php?controller=user&action=signup",
      }).then((response) => {
        if (response.data.status == 200) {
          self.statusSingup = "Đăng kí thành công";
          self.showStatusSignup = true;
          console.log(response.data);
          
        }else{
          self.statusSingup = "Đăng kí không thành công";
          self.showStatusSignup = false;
          self.alertMes = 'Tài khoản đã tồn tại'
          self.completeSignup = !true;
        }
      });
      }
      else {
        this.statusSingup = "Đăng kí không thành công";
        this.showStatusSignup = false;
        this.alertMes = 'Vui lòng nhập dữ liệu'
        this.completeSignup = !true;
        setTimeout(() => {
          this.completeSignup = true;
        }, 2000);
      } 
      
    },
    validateEmail(){
      const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return re.test(String(this.email).toLowerCase());
    },
    
  },

  mounted() {
    this.$store.dispatch("clearTempCart");
  },
};
</script>
<style lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700&display=swap");
* {
  font-family: "Roboto", sans-serif;
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
        max-width: 60%;
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
        background: rgba(248, 248, 248, 0.9);
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
        color: #000;
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
.form-new {
  width: 50%;
  margin: auto;
  .form-cc {
    display: table;
    width: 100%;
    text-align: left;
    padding: 0px 0px 30px 30px;
  }
}
.row-cc {
  display: table;
  width: 100%;
  padding-bottom: 7px;
}
.cc-txt {
  border-color: #e1e8ee;
  width: 100%;
}
.input {
  border-radius: 5px;
  border-style: solid;
  border-width: 2px;
  height: 38px;
  padding-left: 15px;
  font-weight: 600;
  font-size: 11pt;
  color: #5e6977;
}
input[type="text"] {
  display: initial;
  padding: 15px;
}
.text-validated {
  border-color: #7dc855;
  background-image: url("https://www.dropbox.com/s/1mve74fafiwsae1/icon-tick.png?raw=1");
  background-repeat: no-repeat;
  background-position: right 18px center;
}
.cc-ddl {
  border-color: #f0f4f7;
  background-color: #f0f4f7;
  width: 100px;
  margin-right: 10px;
}
.cc-title {
  font-size: 10.5pt;
  padding-bottom: 8px;
}
.cc-field {
  padding-top: 15px;
  padding-right: 30px;
  display: table-cell;
}
a {
  text-decoration: none;
}
.modal-body{
    color: green;
    text-align: center;
    font-weight: 600;
}
.div-message{
  position: relative;
  p{
    display: none;
    position: absolute;
    bottom: -25px;
    left: 25px;
    color: red;
  }
}
.div_mesEmail{
  position: relative;
  #mesEmail{
    position: absolute;
    bottom: -10px;
    left: 10%;
  }
}
.div_mesPass{
  position: relative;
  #repw{
    position: absolute;
    left: 10%;
    bottom:  -10px;
  }
}
</style>