<template>
  <div>
    <div class="container-fluid">
      <Iframe />
      <div>
        <Carousel />
      </div>
      <Introduce />
      <img
        src="https://www.facebook.com/photo/?fbid=2769270030069340&set=a.1530311433965212"
        alt=""
      />
      <!-- <Collections/> -->
      <div class="list-categories">
        <h3>Category Items</h3>
        <div class="list-categories-content">
          <div class="row">
            <div class="col col-sm-4 list-categories-item">
              <router-link to="/">
                <div class="item-a">
                  <img
                    src="https://i.shgcdn.com/f85b7608-c7fd-48d6-9482-1ac178ebbd0d/-/format/auto/-/preview/3000x3000/-/quality/lighter/"
                    alt=""
                  />
                  <h3>HAT</h3>
                </div>
              </router-link>
            </div>
            <div class="col col-sm-4 list-categories-item">
              <router-link to="/">
                <div class="item-a">
                  <img
                    src="https://i.shgcdn.com/f85b7608-c7fd-48d6-9482-1ac178ebbd0d/-/format/auto/-/preview/3000x3000/-/quality/lighter/"
                    alt=""
                  />
                  <h3>SHIRT</h3>
                </div>
              </router-link>
            </div>
            <div class="col col-sm-4 list-categories-item">
              <router-link to="/">
                <div class="item-a">
                  <img
                    src="https://i.shgcdn.com/f85b7608-c7fd-48d6-9482-1ac178ebbd0d/-/format/auto/-/preview/3000x3000/-/quality/lighter/"
                    alt=""
                  />
                  <h3>JEANS</h3>
                </div>
              </router-link>
            </div>
          </div>
          <div class="row">
            <div class="col col-sm-4 list-categories-item">
              <router-link to="/">
                <div class="item-a">
                  <img
                    src="https://i.shgcdn.com/f85b7608-c7fd-48d6-9482-1ac178ebbd0d/-/format/auto/-/preview/3000x3000/-/quality/lighter/"
                    alt=""
                  />
                  <h3>Hello</h3>
                </div>
              </router-link>
            </div>
            <div class="col col-sm-4 list-categories-item">
              <router-link to="/">
                <div class="item-a">
                  <img
                    src="https://i.shgcdn.com/f85b7608-c7fd-48d6-9482-1ac178ebbd0d/-/format/auto/-/preview/3000x3000/-/quality/lighter/"
                    alt=""
                  />
                  <h3>Hello</h3>
                </div>
              </router-link>
            </div>
            <div class="col col-sm-4 list-categories-item">
              <router-link to="/">
                <div class="item-a">
                  <img
                    src="https://i.shgcdn.com/f85b7608-c7fd-48d6-9482-1ac178ebbd0d/-/format/auto/-/preview/3000x3000/-/quality/lighter/"
                    alt=""
                  />
                  <h3>Hello</h3>
                </div>
              </router-link>
            </div>
          </div>
        </div>
        <div class="list-categories-footer">
          <div class="">
            <router-link to="/categories">
              <h3>Xem tất cả<i class="fas fa-chevron-right"></i></h3
            ></router-link>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  </div>
</template>   




<script>
import axios from "axios";
import Introduce from "../components/home/Introduce.vue";
// import Collections from "../components/home/Collections.vue";
import Carousel from "../components/home/Carousel.vue";
import Footer from "../components/Footer.vue";
import Iframe from "../components/home/Iframe.vue";

export default {
  data() {
    return {
      listbooks: [],
      listCategory: [],
      maxInRowCategory: 6,
      isShowMore: false,
    };
  },

  methods: {
    deleteItem(value) {
      let index = this.listbooks.indexOf(value);
      this.listbooks.splice(index, 1);
    },
    showCategory(e) {
      let seft = this;
      axios({
        method: "get",
        url: "https://localhost/BTL_ecommerce/index.php?controller=book&action=getbycategory&category=".concat(
          e.target.id
        ),
      }).then((response) => {
        if (response.data != "") {
          seft.listCategory = response.data;
          seft.isShowMore = true;
        }
      });
    },
    fetchAllBook() {
      let seft = this;
      axios({
        method: "get",
        url: "https://localhost/BTL_ecommerce/index.php?controller=book&action=getall",
      }).then((response) => {
        if (response.data != "") {
          seft.listbooks = response.data;
        }
      });
    },
    // checkUser(){
    //       let self = this;
    //       axios({
    //         method: 'get',
    //         url: 'https://localhost/BTL_ecommerce/index.php?controller=user&action=authenticate',
    //         headers:{
    //             "Accept" : "application/json",
    //             "Content-Type": "application/json",
    //             "Authorization" : localStorage.getItem("token"),
    //         }
    //       }).then((response) => {
    //             if(response.data.status){
    //                 self.user = response.data.account[0];
    //             }
    //       });
    //   },
  },
  created() {
    this.fetchAllBook();
    this.user = this.$store.state.user;

    // this.checkUser();
  },
  components: {
    Footer,
    Iframe,
    Carousel,
    Introduce,
    // Collections
  },
};
</script>
<style lang="scss" scoped>
* {
  box-sizing: border-box;
}
.container-fluid {
  padding: 0;
  min-height: 100vh;
  background: linear-gradient(to right top, #ffd89b, #e5e7e9);
  .slider {
    margin: 50px auto;
    display: flex;
    justify-content: center;
    height: 350px;
    img {
      width: 700px;
      margin: auto;
      height: 100%;
    }
  }

  .best-selling {
    .title-best-sell {
      text-align: center;
      margin: 30px 0px;
    }
  }
  .list-categories {
    * {
      color: white;
    }
    h3 {
      text-align: center;
      font-size: 40px;
      font-weight: bold;
      letter-spacing: normal;
    }
    .list-categories-content {
      padding: 50px;
      .row {
        height: 100%;
        .list-categories-item {
          padding: 10px;
          a {
            height: 100%;
            display: block;
            .item-a {
              overflow: hidden;
              height: 100%;
              position: relative;
              img {
                transition: all 0.5s ease;
                width: 100%;
                height: 100%;
              }
              h3 {
                font-size: 3vw;
                position: absolute;
                top: 70%;
                left: calc(50% - 3vw);
              }
            }
          }
        }
        .list-categories-item:hover {
          img {
            transform: scale(1.1);
            filter: brightness(50%);
          }
        }
      }
    }
    .list-categories-footer {
      padding-bottom: 100px;
      padding-left: 80%;

      div {
        display: inline-block;
        a{
          text-decoration: none;
        }
        h3 {
          padding: 5px;
          text-align: center;
          color: orangered;
          font-size: 1.55rem;
          line-height: 1.25rem;
          margin: 0 auto;
          display: -webkit-box;
          -webkit-box-orient: vertical;
          -webkit-line-clamp: 2;
          overflow: hidden;
          max-height: 2.5 rem;
        }
        
        i {
          color: orangered;
          transition: all 0.5s ease;
        }
      }
      div:hover {
        background: rgb(231, 202, 105);
        border-radius: 5px  ;
        i {
          margin-left: 20px;
        }
      }
    }
  }
}
</style>