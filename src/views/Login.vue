<template>
  <div>
    <div class="container">
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
      <div class="row m-5 no-gutters shadow-lg">
        <div class="col-md-6 d-none d-md-block">
          <img
            src="https://images.unsplash.com/photo-1566888596782-c7f41cc184c5?ixlib=rb-1.2.1&auto=format&fit=crop&w=2134&q=80"
            class="img-fluid"
            style="min-height: 50%"
          />
        </div>
        <div class="col-md-6 bg-white p-5">
          <h3 class="pb-3">Đăng nhập</h3>
          <div class="form-style">
              <div class="form-group pb-3">
                <input
                  type="text"
                  placeholder="Tài khoản"
                  class="form-control"
                  v-model="username"
                  id="exampleInputEmail1"
                  aria-describedby="emailHelp"
                />
              </div>
              <div class="form-group pb-3">
                <input
                  type="password"
                  placeholder="Mật khẩu"
                  v-model="password"
                  class="form-control"
                  id="exampleInputPassword1"
                />
              </div>
              <div class="d-flex align-items-center justify-content-between">
                <div class="d-flex align-items-center">
                  <input v-model="remember" name="" type="checkbox" value="" />
                  <span class="pl-2 font-weight-bold">Remember Me</span>
                </div>
                <div><a href="#">Forget Password?</a></div>
              </div>
              <div v-if="loggedIn" class="message">
                  <div>
                        Không tồn tại tài khoản này
                  </div>
              </div>
              <div class="pb-2">
                <button
                 @click="login()"
                  type="submit"
                  class="btn btn-success w-100 font-weight-bold mt-2"
                >
                  Đăng nhập
                </button>
              </div>
            <div class="sideline">OR</div>
            <div>
              <router-link to="/signup"
                type="submit"
                class="btn btn-danger w-100 font-weight-bold mt-2"
              >
                <i class="fa fa-facebook" aria-hidden="true"></i> Đăng kí thành viên
              </router-link>
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
      loggedIn: false,
    };
  },
  methods: {
    async login() {
      console.log(this.remember)
      let self = this;
      if(self.username !== '' && self.password !== ''){
         await axios({
          method: "post",
          data: {
            username: self.username,
            password : self.password,
          },
          url: "https://localhost/ecommerce_backend/index.php?controller=user&action=login",
        }).then((response) => {
          if(response.data.status == 200){
              if(self.remember){
                localStorage.setItem('info' , JSON.stringify(response.data.account[0]));
                // console.log("JSON.parse(localStorage.getItem('info'))")

                }else{
                  self.$store.state.user.info = response.data.account[0];
                  self.$store.state.user.token = response.data.token;
                }
              if(self.username === 'admin'){
                self.$router.push({ path: '/admin' })
              }else if( self.$store.state.oldUrl == ''){
                self.$router.push({ path: '/home' })
              }
              else{
                self.$router.push({ path: self.$store.state.oldUrl });
                self.$store.state.oldUrl = '/'
              }
          }else{
              console.log('sai')
              self.loggedIn = true;
              self.username = "";
              self.password = "";
          }
        });
      }else{
        self.loggedIn = true;
      }
     
    },
 
   
  },
  components: {
  },
  created(){
  },
  mounted() {
        this.$store.dispatch('clearTempCart');
    },
};
</script>
<style lang="scss" scoped>
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
.message{
    div{
        margin: auto    ;
        color:red;
    }
}
    .form-style input{
	border:0;
	height:50px;
	border-radius:0;
border-bottom:1px solid #ebebeb;	
}
.form-style input:focus{
border-bottom:1px solid #007bff;	
box-shadow:none;
outline:0;
background-color:#ebebeb;	
}
.sideline {
    display: flex;
    width: 100%;
    justify-content: center;
    align-items: center;
    text-align: center;
	color:#ccc;
}
button{
height:50px;	
}
.sideline:before,
.sideline:after {
    content: '';
    border-top: 1px solid #ebebeb;
    margin: 0 20px 0 0;
    flex: 1 0 20px;
}

.sideline:after {
    margin: 0 0 0 20px;
}
</style>










