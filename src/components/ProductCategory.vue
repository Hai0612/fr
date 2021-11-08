<template>
  <div>
    <ul class="products row">
      <li data-aos="fade-up"
     data-aos-anchor-placement="center-bottom" v-for="(product, index) in listProducts" v-bind:key="index" class="product col-xs-12 col-sm-4 col-md-3">
        <div class="product-item">
          <router-link :to="{ name: 'Detail', params: { id: product.id }}" class="cover-link">
            <div class="see">
              <i class="fa fa-eye"></i>
              <span><router-link :to="{ name: 'Detail', params: { id: product.url }}">see</router-link></span>
            </div>

            <div class="ima" :style="{backgroundImage: `url(${product.url})`}">
              <img
                src="https://i.pinimg.com/originals/fa/02/02/fa0202572e8aa734cedb154c413a4846.jpg"
                class="img-responsive"
              />
            </div>

            <div class="info-product-card">
              <div class="text">
                <h3>{{product.name}}</h3>
              </div>

              <div class="average">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star clear"></i>
              </div>
            </div>
          </router-link>

          <div class="actions">
            <span class="price">
              <del>
                <span class="amount">{{product.price}}</span>
              </del>
              <ins>
                <span class="amount">{{product.price}}</span>
              </ins>
            </span>

            
          </div>
        </div>
      </li>
   
    </ul>
  </div>
</template>
<script>
export default {
  props: ['listProducts'],
};
</script>
<style lang="scss" scoped>
ul {
  padding: 0;
}

h1,
h2 {
  font-weight: 100;
}

button,
a { 
  &:hover {
    text-decoration: none;
  }
  text-decoration: none;
  position: relative;
  z-index: 1;
  overflow: hidden;

  &.active {
    background-color: #aecc42 !important;
    z-index: 9;
    &:after {
      background-color: #aecc42 !important;
    }
  }
}

.products {
  .product {
    list-style: none;
    .product-item {
      background-color: white;
      box-shadow: 0 3px 5px rgba(0, 0, 0, 0.25);
      position: relative;
      margin: 0 0 30px;
      .cover-link {
        position: relative;
        display: block;

        &:before {
          content: "";
          background: rgba(0, 0, 0, 0.7);
          transition: all 0.2s ease-out;

          position: absolute;
          top: -200%;
          left: 0;
          z-index: 2;
          width: 100%;
          height: 100%;
          display: block;
          opacity: 0;
        }

        &:hover {
          &:before {
            opacity: 1;
            top: 0;
          }
        }
        .see {
          a{
            text-decoration: none;
            color: white;
          }
          transition: all 0.2s ease-out;
          border: white 1px solid;
          text-align: center;

          opacity: 0;
          width: 60px;
          height: 64px;
          position: absolute;
          top: 0;
          left: 50%;
          z-index: 9;
          margin: -32px 0 0 -30px;
          padding: 10px 0 0;

          i,
          span {
            color: white;
            text-transform: uppercase;
            display: block;
          }

          i {
            margin: 0 0 5px;
          }
        }

        &:hover {
          .see {
            top: 50%;
            transition: all 0.2s ease-out;
            opacity: 1;
          }
        }
        .ima {
          background-repeat: no-repeat;
          background-position: center;
          background-size: cover;
          width: 100%;
          height: 180px;
          z-index: 22;
          img {
            display: none;
          }
        }
        .info-product-card {
          padding: 15px;

          .text {
            height: 45px;
            position: relative;
            overflow: hidden;
            p {
              color: #7d8993;
            }
          }

          i {
            color: #aecc42;
            font-size: 12px;

            &.clear {
              color: #ced7db;
            }
          }
        }
      }
      .actions {
        background-color: #dbe674;
        font-size: 0;

        overflow: hidden;
        padding: 0 0 0 10px;

        .price {
          display: inline-block;
          vertical-align: top;

          padding: 10px 0 0;

          span {
            color: white;
            font-size: 24px;
            font-weight: 300;
          }

          del {
            color: #aecc42;
            span {
              color: #aecc42;
              font-size: 12px;
              margin: 0 10px 0 0;
            }
          }

          ins {
            text-decoration: none;
          }
        }

        .button {
          background-color: #dbe674;

          height: 100%;
          float: right;

          a {
            color: white;
            text-transform: uppercase;
            font-size: 16px;

            display: block;
            padding: 15px 10px;

            &:hover {
              &:after {
                background-color: #aecc42;
              }
            }
          }
        }
      }
    }
  }
}
</style>