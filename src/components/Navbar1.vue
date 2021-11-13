<template>
  <nav class="navbar navbar-expand-lg navbar-dark">
    <router-link to="/" class="logo">
      <img src="../assets/images/logo.png" alt="" />
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
          <a class="nav-link" href="#">Category</a>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            href="#"
            id="navbarDropdown"
            role="button"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            Category 1
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <div class="container">
              <div class="row">
                <div class="col-md-4">
                  <span class="text-uppercase text-white">Category 1</span>
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <a href="">
                    <img
                      src="https://dummyimage.com/200x100/ccc/000&text=image+link"
                      alt=""
                      class="img-fluid"
                    />
                  </a>
                  <p class="text-white">Short image call to action</p>
                </div>
                <!-- /.col-md-4  -->
              </div>
            </div>
            <!--  /.container  -->
          </div>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            href="#"
            id="navbarDropdown"
            role="button"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            Category 2
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <div class="container">
              <div class="row">
                <div class="col-md-4">
                  <span class="text-uppercase text-white">Category 2</span>
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <a href="">
                    <img
                      src="https://dummyimage.com/200x100/ccc/000&text=image+link"
                      alt=""
                      class="img-fluid"
                    />
                  </a>
                  <p class="text-white">Short image call to action</p>
                </div>
                <!-- /.col-md-4  -->
              </div>
            </div>
            <!--  /.container  -->
          </div>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            href="#"
            id="navbarDropdown"
            role="button"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            Category 3
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <div class="container">
              <div class="row">
                <div class="col-md-4">
                  <span class="text-uppercase text-white">Category 3</span>
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Link item</a>
                    </li>
                  </ul>
                </div>
                <!-- /.col-md-4  -->
                <div class="col-md-4">
                  <a href="">
                    <img
                      src="https://dummyimage.com/200x100/ccc/000&text=image+link"
                      alt=""
                      class="img-fluid"
                    />
                  </a>
                  <p class="text-white">Short image call to action</p>
                </div>
                <!-- /.col-md-4  -->
              </div>
            </div>
            <!--  /.container  -->
          </div>
        </li>
      </ul>
      <div class="form-inline my-lg-0">
        <v-text-field
          v-model="search"
          color="purple darken-2"
          label="Search"
          pa-0
          required
        ></v-text-field>
        <router-link
          class="nav-link cart-info"
          data-cart-preview=""
          data-dropdown="cart-preview-dropdown"
          data-options="align:right"
          to="/cart"
          aria-expanded="false"
        >
          <i class="fas fa-shopping-cart"></i>
          <span class="countPill cart-quantity countPill--positive">{{numberInCart}}</span>
        </router-link>
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
                  <img
                    alt="Avatar"
                    src="https://avatars0.githubusercontent.com/u/9064066?v=4&s=460"
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
      numberInCart : 0,
    };
  },
  methods:{
    handleLogout(){
      this.$store.state.user.token = '';
      this.$store.state.user.info = {};
      this.$router.push({ name : 'Login'});
    },
    getNumberInCart(){
      let self = this;
      axios({
        method: "post",
        data: {
          id_user : self.$store.state.user.info.id
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=getNumberInCart",
      }).then((response) => {
        if(response.data.status == 200){
          console.log(response.data.payload);
          this.numberInCart = response.data.payload
        }
      });
    },
  },
  
  created(){
    // setInterval(() => {

    //   this.getNumberInCart();
    // }, 1000);
  }
};
</script>

<style lang="scss" scoped>
/* adds some margin below the link sets  */
.navbar .dropdown-menu div[class*="col"] {
  margin-bottom: 1rem;
}

.navbar .dropdown-menu {
  border: none;
  top: 80px !important;
  background-color: #eca945 !important;
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
</style>