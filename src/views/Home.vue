<template>
  <div>
    <div class="container-fluid">
      <Iframe />
      <div data-aos="fade-up" data-aos-anchor-placement="center-bottom">
        <Carousel />
      </div>
      <Introduce />
      <img
        src="https://www.facebook.com/photo/?fbid=2769270030069340&set=a.1530311433965212"
        alt=""
      />
      <!-- <Collections/> -->
      <div class="list-categories">
        <h3>Category Items <i class="fas fa-forward"></i></h3>
        <div class="list-categories-content">
          <div class="row">
            <div
              v-for="(category, index) in listCategory"
              v-bind:key="index"
              data-aos="fade-up"
              data-aos-anchor-placement="center-bottom"
              class="col col-sm-4 list-categories-item"
            >
              <router-link :to="{ name: 'ShowCategory', params: { category: category.name_category }}">
                <div class="item-a">
                  <img :src="category.image" alt="" />
                  <h3>{{ category.name_category }}</h3>
                </div>
              </router-link>
            </div>
            <!-- <div data-aos="fade-up"
     data-aos-anchor-placement="center-bottom" class="col col-sm-4 list-categories-item">
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
            <div data-aos="fade-up"
     data-aos-anchor-placement="center-bottom" class="col col-sm-4 list-categories-item">
              <router-link to="/">
                <div class="item-a">
                  <img
                    src="https://i.shgcdn.com/f85b7608-c7fd-48d6-9482-1ac178ebbd0d/-/format/auto/-/preview/3000x3000/-/quality/lighter/"
                    alt=""
                  />
                  <h3>JEANS</h3>
                </div>
              </router-link>
            </div> -->
          </div>
        </div>
        <div
          data-aos="fade-up"
          data-aos-anchor-placement="center-bottom"
          class="list-categories-footer"
        >
          <div class="">
            <router-link to="/categories">
              <h3>Xem tất cả<i class="fas fa-chevron-right"></i></h3
            ></router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>   




<script>
import axios from "axios";
import Introduce from "../components/home/Introduce.vue";
// import Collections from "../components/home/Collections.vue";
import Carousel from "../components/home/Carousel.vue";
import Iframe from "../components/home/Iframe.vue";

export default {
  data() {
    return {
      listbooks: [],
      listCategory: [],
      maxInRowCategory: 6,
      isShowMore: false,
      user: {},
    };
  },

  methods: {
    fetchCategories() {
      let self = this;
      axios({
        method: "get",
        data: {},
        url: "https://localhost/ecommerce_backend/index.php?controller=category&action=fetchAll",
      }).then((response) => {
        if (response.data.status == 200) {
          self.listCategory = response.data.payload;
        }
      });
    },

   
  },
  created() {
    this.fetchCategories();
    console.log(this.$store.state.user.token);

  },
    mounted() {
        this.$store.dispatch('clearTempCart');
    },
  components: {
    Iframe,
    Carousel,
    Introduce,
  },
};
</script>
<style lang="scss" scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700&display=swap');
*{
  font-family: 'Roboto', sans-serif;
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

    margin-top: 50px ;
    * {
      color: white;
    }
    h3:nth-child(1){
          font-size: 45px;
    text-transform: uppercase;
    letter-spacing: 2px;
    color: black;
    text-align: center;
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
          height: 60vh;
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
        a {
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
        border-radius: 5px;
        i {
          margin-left: 20px;
        }
      }
    }
  }
}
</style>