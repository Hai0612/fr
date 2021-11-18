<template>
  <div class="carousel-section">
    <h2 class="carousel-section-title">Featured Products</h2>
    <img src="/assets/images/item.png" alt="">
    <div
      id="carouselExampleIndicators"
      class="carousel slide"
      data-ride="carousel"
    >
      <ol class="carousel-indicators">
        <li
          data-target="#carouselExampleIndicators"
          data-slide-to="0"
          class="active"
        ></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <router-link :to="{ name : 'Detail' , params :{id : listFeaturedProducts[5].id}}">
            <img
            class="d-block w-100"
            v-bind:src="require('../../assets/images/products/' + listFeaturedProducts[5].url)"
            alt="First slide"
          />
          </router-link>
          <div class="carousel-caption d-none d-md-block">
            <h5>{{listFeaturedProducts[5].name}}</h5>
            <p>
              {{listFeaturedProducts[5].description}}
            </p>
          </div>
        </div>
        <div v-for="(product, index) in listFeaturedProducts" v-bind:key="index" class="carousel-item">
          <router-link  :to="{ name : 'Detail' , params :{id : product.id}}">
             <img
            class="d-block w-100"
            v-bind:src="require('../../assets/images/products/' + product.url)"
            alt="Second slide"
          />
          </router-link>
         
          <div class="carousel-caption d-none d-md-block">
            <h5>{{product.name}}</h5>
            <p>
              {{product.description}}
            </p>
          </div>
        </div>
      
      </div>
      <a
        class="carousel-control-prev"
        href="#carouselExampleIndicators"
        role="button"
        data-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a
        class="carousel-control-next"
        href="#carouselExampleIndicators"
        role="button"
        data-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      listFeaturedProducts: null,
    };
  },
  methods: {
    fetchFeaturedProduct() {
      let self = this;
      axios({
        method: "post",
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=getFeatured",
      }).then((response) => {
        if (response.data.status) {
          self.listFeaturedProducts = response.data.payload;
        }
      });
    },
  },
  created() {
    this.fetchFeaturedProduct();
  },
};
</script>
<style lang="scss" scoped>
.carousel-section{
  width: 70%;
  margin: auto;
}
.carousel-section-title{
      font-size: 45px;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin-top: 45px;
  text-align: center;
}
.carousel-item {
  height: 80vh;
  min-height: 300px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  a{
    display: block;
  }
    img{
      object-position: 50% 50%;
      width: 100%;
      height: 100%;
    }
}
.carousel-caption {
  color:black;
  bottom: 270px;
}

.carousel-caption h5 {
  font-size: 45px;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-top: 25px;
}

.carousel-caption p {
  width: 75%;
  margin: auto;
  font-size: 18px;
  line-height: 1.9;
}
</style>