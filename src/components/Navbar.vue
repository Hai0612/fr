<template>
  <nav class="navbar navbar-expand-lg navbar-dark">
    <router-link to="/" class="logo">
      <img src="../assets/images/orther/logo-web.png" alt="" />
    </router-link>
    <button
      class="navbar-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <router-link to="/" class="nav-link" >Home</router-link>
        </li>
        <li class="nav-item dropdown">
          <router-link
            class="nav-link dropdown-toggle"
            to='/categories/áo cộc tay'
            id="navbarDropdown"
            role="button"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            Áo
          </router-link>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <div class="container">
              <div class="row">
                <div class="col-md-4">
                  <span class="text-uppercase text-white">Áo</span>
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <router-link to="/categories/áo khoác" class="nav-link active" href="#">Áo khoác</router-link>
                    </li>
                   
                   
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <ul class="nav flex-column">
                    <span></span>
                    <li class="nav-item">
                      <router-link to='/categories/áo cộc tay' class="nav-link active" >Áo cộc tay</router-link>
                    </li>
                    <li class="nav-item">
                      <router-link to='/categories/áo sơ mi' class="nav-link active" >Áo sơ mi</router-link>
                    </li>
                  
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <a href="">
                    <img
                      src="../assets/images/products/1-2.jpg"
                      alt=""
                      class="img-fluid"
                    />
                  </a>
                </div>
                <!-- /.col-md-4  -->
              </div>
            </div>
            <!--  /.container  -->
          </div>
        </li>
        <li class="nav-item dropdown">
          <router-link
            class="nav-link dropdown-toggle"
            to="/váy"
            id="navbarDropdown"
            role="button"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            Quần
          </router-link>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <div class="container">
              <div class="row">
                <div class="col-md-4">
                  <span class="text-uppercase text-white"></span>
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <router-link to="/categories/váy" class="nav-link active" >Váy</router-link>
                    </li>
                
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <router-link to="/categories/quần" class="nav-link active" >Quần</router-link>
                    </li>
                 
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <a href="">
                    <img
                      src="../assets/images/products/91-2.jpg"
                      alt=""
                      class="img-fluid"
                    />
                  </a>
                </div>
                <!-- /.col-md-4  -->
              </div>
            </div>
            <!--  /.container  -->
          </div>
        </li>
        <li class="nav-item dropdown">
          <router-link to="/categories/mũ"
            class="nav-link dropdown-toggle"
            id="navbarDropdown"
            role="button"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            Phụ kiện
          </router-link>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <div class="container">
              <div class="row">
                <div class="col-md-4">
                  <span class="text-uppercase text-white">Phụ kiện</span>
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <router-link to="/categories/mũ" class="nav-link active" >Mũ</router-link>
                    </li>
                    <li class="nav-item">
                      <router-link to="/categories/giày dép" class="nav-link active" >Giày dép</router-link>
                    </li>
                    <li class="nav-item">
                    </li>
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <router-link to="/categories/mũ" class="nav-link active" >Mũ</router-link>
                      </li>
                    <li class="nav-item">
                    </li>
                    <li class="nav-item">
                    </li>
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <a href="">
                    <img
                      src="../assets/images/products/30-1.jpg"
                      alt=""
                      class="img-fluid"
                    />
                  </a>
                </div>
                <!-- /.col-md-4  -->
              </div>
            </div>
            <!--  /.container  -->
          </div>
        </li>
      </ul>
      <div class="form-inline my-lg-0">
        <div class="form-search">
          <v-text-field
          v-model="search"
          color="green darken-2"
          label="Search"
          pa-0
          v-on:keyup.enter="searchMachine()"
          required
        ></v-text-field>
        <!-- <div class="result-search">
          <ul>
            <li>Hello</li>
            <li>Hello</li>
            <li>Hello</li>
            <li>Hello</li>
          </ul>
        </div> -->
        </div>
        <button @click="accessCart()"
          class="nav-link cart-info"
          data-cart-preview=""
          data-dropdown="cart-preview-dropdown"
          data-options="align:right"
          to="/cart"
          aria-expanded="false"
        >
          <i class="fas fa-shopping-cart"></i>
          <span class="countPill cart-quantity countPill--positive">{{numberInCart}}</span>
        </button>
        <router-link v-if="this.$store.state.user.info.id != null"
          class="nav-link"
          data-cart-preview=""
          data-dropdown="cart-preview-dropdown"
          data-options="align:right"
          to="/user"
          aria-expanded="false"
        >
          <v-avatar
                  size="36px"
                >
                  <img v-if="urlAvatar !== ''"
                  :src="require('../assets/images/users/' + urlAvatar)"
                    alt="Avatar"
                  >
                  <img v-else
                    src=""
                    alt="Avatar"
                  >
              
                </v-avatar>
        </router-link>
        <button @click="handleLogout()">Đăng xuất</button>
      </div>
    </div>
  </nav>
</template>
<script>
import axios from 'axios';
export default {
  data() {
    return {
      search: "",
      urlAvatar: "",
      numberInCart : 0,
    };
  },
  watch: {
  '$store.state.changeCart': function() {
    this.getNumberInCart();
  }
},
  methods:{
    handleLogout(){
      this.$store.state.user.token = '';
      this.$store.state.user.info = {};
      localStorage.removeItem('info');
      this.$router.push({ name : 'Login'});
    },
    accessCart(){
      if(this.$store.state.user.info.id){
          this.$router.push({path: '/cart'});
      }else{
        this.$store.state.oldUrl = '/cart/';
        this.$router.push({ path: '/login' });
      }
    },
    getNumberInCart(){
      let self = this;
      axios({
        method: "post",
        data: {
          id_user : self.$store.state.user.info.id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=getNumberInCart",
      }).then((response) => {
        if(response.data.status == 200){
          this.numberInCart = response.data.payload
        }
      });
    },
    searchMachine(){
        if(this.search !== ''){
          this.temp = this.search ;
          this.search = '';
           this.$router.push({ name: 'Search', params: { text: this.temp } })
        }
      
    }
  },
  
  created(){
    // setInterval(() => {
      if(localStorage.getItem('info') !== null){
        this.$store.state.user.info = JSON.parse(localStorage.getItem('info'));
 
      }
      this.urlAvatar = this.$store.state.user.info.url;
      this.getNumberInCart();
      
    // }, 1000);
  }
};
</script>

<style lang="scss" scoped>
.form-search{
  position: relative;
  .result-search {
    position: absolute;
    z-index: 5;
    background: aliceblue;
    top: 100%;
    left: -15%;
    ul{
      margin: 0;
      padding: 0;
      li{
        padding: 5px 15px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.15);
        list-style-type: none;
        opacity: 0.8;
        width: 20vw;
      }
      li:hover{
        cursor: pointer;
        opacity: 1;
      }
    }
  }
}


/* adds some margin below the link sets  */
.navbar .dropdown-menu div[class*="col"] {
  margin-bottom: 1rem;
}
.navbar .dropdown  a{
  color: black  !important;
}
.navbar .dropdown-menu {
  
  border: none;
  top: 80px !important;
  background-color: #eca945 !important;
}

.navbar .dropdown-menu li{
  color: black;
    font-weight: 400;
    font-size: 18px;
    letter-spacing: .04em;
    text-transform: initial;
}
.navbar .dropdown-menu li a{
  color: black !important;;
    
}
/* breakpoint and up - mega dropdown styles */
@media screen and (min-width: 992px) {
  /* remove the padding from the navbar so the dropdown hover state is not broken */
  .navbar {
    padding-top: 0px;
    padding-bottom: 0px;
    
  }

  /* remove the padding from the nav-item and add some margin to give some breathing room on hovers */
  .navbar .nav-item {
      
    padding: 0.5rem 0.5rem;
    margin: 0 0.25rem;
  }

  /* makes the dropdown full width  */
  .navbar .dropdown {
    position: static;
    
  }

  .navbar .dropdown-menu {
    width: 100%;
    left: 0;
    right: 0;
    /*  height of nav-item  */
    top: 45px;

    display: block;
    visibility: hidden;
    opacity: 0;
    transition: visibility 0s, opacity 0.3s linear;
  }

  /* shows the dropdown menu on hover */
  .navbar .dropdown:hover .dropdown-menu,
  .navbar .dropdown .dropdown-menu:hover {
    display: block;
    visibility: visible;
    opacity: 1;
    transition: visibility 0s, opacity 0.3s linear;
  }

  .navbar .dropdown-menu {
    border: 1px solid rgba(0, 0, 0, 0.15);
    background-color: white;
  }
}
.navbar{
    z-index: 200;
    position: fixed  ;
    top: 0;
    width: 100%;
    padding: 10px 60px;
    background: linear-gradient(
-180deg,#ee720d,rgb(247, 156, 20));
    .logo {
        display: block;
        img {
              border-radius: 20px;
              height: 50px;
          }
        }
}
.form-inline{
    flex-wrap: nowrap;
    a{
        color: white;

        i{
            color:white;
        }
    }
    .cart-info{
        transform: scale(1.3);
        position: relative;
        i{
            color:orangered;
        }
        span{
            position: absolute;
            top: 50%;
            color:black;
            left: 60%;
        }
    }
    
}
a{
    font-weight: 600;
    color: rgba(white, 0.8) !important;;
    
}
.img-fluid{
  max-height: 15vh;
}
</style>



