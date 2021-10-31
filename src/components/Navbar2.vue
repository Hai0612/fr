<template>
  <nav class="nav">
    <div class="navbar">
      <div class="logo">
        <router-link to="/">
          <img src="../assets/images/icon.jpg" alt="">
        </router-link>
      </div>
      <ul>
        <li @click="changePath()" @mouseover="isShowProfile = true" @mouseleave="isShowProfile = false" class="dropdown">
          <router-link to="/profile" >PROFILE</router-link>
          <div v-if="isShowProfile" class="dropdown-content">
            <ul>
              <li><i class="fas fa-square"></i>Overview</li>
              <li><i class="fas fa-square"></i>Architecture</li>
              <li><i class="fas fa-square"></i>Service</li>
            </ul>
          </div>
        </li>
        <li @click="changePath()" @mouseover="isShowService = true" @mouseleave="isShowService = false" class="dropdown">
          <router-link to="/service">SERVICES</router-link>
          <div v-if="isShowService" class="dropdown-content">
            <ul>
              <li><i class="fas fa-square"></i>Overview</li>
              <li><i class="fas fa-square"></i>tab1</li>
              <li><i class="fas fa-square"></i>tab1</li>
              <li><i class="fas fa-square"></i>Architecture</li>
              <li><i class="fas fa-square"></i>Goverment</li>
              <li><i class="fas fa-square"></i>Service</li>
              <li><i class="fas fa-square"></i>tab1</li>
            </ul>
          </div>
        </li>
        <li  @mouseover="isShowAbout = true" @mouseleave="isShowAbout = false" class="dropdown">
          <router-link to="/about">ABOUT</router-link>
          <div v-if="isShowAbout" class="dropdown-content">
            <ul>
              <li><i class="fas fa-square"></i>Overview</li>
              <li><i class="fas fa-square"></i>Goverment</li>
              <li><i class="fas fa-square"></i>Service</li>
              <li><i class="fas fa-square"></i>Architecture</li>
              <li><i class="fas fa-square"></i>tab1</li>
            </ul>
          </div>
        </li>
        <li @click="changePath()" @mouseover="isShowContact = true" @mouseleave="isShowContact = false" class="dropdown">
          <router-link to="/contact">CONTACT</router-link>
          <div v-if="isShowContact" class="dropdown-content">
            <ul>
              <li><i class="fas fa-square"></i>Overview</li>
              <li><i class="fas fa-square"></i>Architecture</li>
              <li><i class="fas fa-square"></i>Goverment</li>
              <li><i class="fas fa-square"></i>Service</li>
            </ul>
          </div>
        </li>
        <li @click="changePath()" class="dropdown btn-shop">
          <router-link to="/shop">
              BOOKS SHOP
            <i class="fas fa-arrow-right"></i>
          </router-link>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
export default {
  name: "Navbar",
  data(){
    return {
      isShowProfile : false,
      isShowService: false,
      isShowAbout : false,
      isShowContact : false,
    };
  },
  methods:{
    changePath(){}
  },
  

}
</script>

<style lang="scss" scoped>
nav{
    .navbar{
      margin-top: -8px;
      position: relative;
      display: flex;
      padding-left: 150px;
      justify-content: center;
      align-content: center;
    .logo{
      margin-top: 15px;
      text-align: center;
      a{
        display: block;
        img{
          width: 40%;
        }
      }
    }
    ul {
      width: 100%;
      display: flex;
      justify-content: space-between;
      li.dropdown{
        list-style-type: none;
        display: inline;
        font-size: 20px;
        font-weight: 600;
        a{
        padding: 40px;

          display: block;
          text-decoration: none;
          color: black;
        }
        .dropdown-content{
          padding: 0px 100px;
          position: absolute;
          animation-name: animate;
          animation-duration: 1s;
          z-index: 9999;
          width: 100%;
          background: rgb(188, 188, 196);
          top: 100%;
          left: 0;
          ul{
            li{
                list-style-type: none;
                padding: 37px;
                i{
                  color: red;
                  font-size: 70%;
                  margin-right: 10px;
                }
            }
            li:hover{
              color: red;
            }
          }
        }

      }
      li.btn-shop{
        background: red;
        color: white;
      }
      li.btn-shop:hover{
        opacity: 0.8;
        cursor: pointer;
        a{
          color: white;
        }
      }
    }
    
    ul li:hover{
      cursor: pointer;
      a{
        color: red;
      }
    }
  }
}
@keyframes animate {
  from   {
    top:110%;
    opacity: 0.1;
  }
  to  {
     top:100%;
     opacity: 1;
  }
}
</style>
