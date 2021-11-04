<template>
  <div>
    <div class="container">
      <div class="detail-products">
        <div class="product-img">
          <div class="product-img-show">
            <img src="../assets/images/clother.jpg" alt="" />
          </div>
          <div class="listImage">
            <div class="image-product-item">
              <img src="../assets/images/clother.jpg" alt="" />
            </div>
            <div class="image-product-item">
              <img src="../assets/images/clother.jpg" alt="" />
            </div>
            <div class="image-product-item">
              <img src="../assets/images/clother.jpg" alt="" />
            </div>
            <div class="image-product-item">
              <img src="../assets/images/clother.jpg" alt="" />
            </div>
          </div>
        </div>
        <div class="product-detail">
          <h1>{{ product.name }}</h1>
          <span class="price-span">{{ product.price }}</span>
          <p>
            or 4 interest-free payments of <span>$64.75</span> with Afterpay
          </p>
          <div class="product-color">
            <span>Color</span>
            <div>
              <v-btn
                class="mr-2"
                fab
                dark
                height="50px"
                width="50px"
                large
                color="purple"
              >
              </v-btn>
              <v-btn
                class="mr-2"
                height="50px"
                width="50px"
                fab
                dark
                large
                color="green"
              >
              </v-btn>
              <v-btn
                class="mr-2"
                height="50px"
                width="50px"
                fab
                dark
                large
                color="red"
              >
              </v-btn>
            </div>
          </div>
          <div class="product-vote">
            <i class="fas fa-star"></i><i class="fas fa-star"></i
            ><i class="fas fa-star"></i><i class="fas fa-star"></i
            ><i class="fas fa-star"></i>
          </div>
          <div class="choose-size">
            <v-row>
              <v-col cols="3"> <h3>Size</h3> </v-col>
              <v-col cols="9">
                <v-btn depressed> M (40-55KG) </v-btn>
                <v-btn depressed> L (60-70KG) </v-btn>
                <v-btn depressed> XL (70-80KG) </v-btn>
              </v-col>
            </v-row>
          </div>
          <div class="payment">
            <button class="btn">Add to cart</button>
            <button class="btn">Buy it now</button>
            <p>FREE domestic shipping and 30 day returns</p>
          </div>
          <div class="secured">
            <div class="secured-item">
              <i class="fas fa-camera-retro"></i>
              <p>5 Lenses & 1 Body</p>
            </div>
            <div class="secured-item">
              <i class="fas fa-laptop"></i>
              <p>15" Laptop Sleeve</p>
            </div>
            <div class="secured-item">
              <i class="fas fa-shield-alt"></i>
              <p>5 Lenses & 1 Body</p>
            </div>
          </div>
          <div class="description-product">
            <h3>Description</h3>
            <p>{{ product.description }}</p>
          </div>

          <div class="features-product">
            <h3>Features <i class="fas fa-plus"></i></h3>
          </div>
          <div class="features-product">
            <h3>Weight & Dimenstion <i class="fas fa-plus"></i></h3>
          </div>
          <div class="features-product">
            <h3>Shipping & Returns <i class="fas fa-plus"></i></h3>
          </div>
        </div>
      </div>
      <div class="related-product">
        <h3>Các sản phâm tương tự</h3>
        <div class="related-product-content">
          <ProductCategory :listProducts="listRelatedProduct" />
        </div>
      </div>
      <div class="reviews-product">
        <div class="vote-product">
          <h3>REVIEWS</h3>
          <div class="vote-action">
            <span>4.9</span> <i class="fas fa-star"></i
            ><i class="fas fa-star"></i><i class="fas fa-star"></i
            ><i class="fas fa-star"></i><i class="fas fa-star"></i>
            <span>107 Reviews, 40 Questions</span>
          </div>
        </div>
        <div class="reviews-content">
          <div class="menu-review">
            <div class="menu-left">
            </div>
            <div class="menu-right">
              <button @click="isShowComment = !isShowComment">
                Write a review
              </button>
            </div>
          </div>
          <div v-if="isShowComment" class="write-comment">
            <h3>Write a comment</h3>
            <v-textarea
              label="One row"
              auto-grow
              autofocus
              outlined
              rows="1"
              row-height="15"
            ></v-textarea>
          </div>
          <div class="filter-reviews">
            <h3>Filter Reviews</h3>
            <div class="text-field">
              <v-text-field label="Search" hide-details="auto"></v-text-field>
            </div>
          </div>
          <div class="list-reviews">
            <h3>{{ listComments.length }} Reviews</h3>
            <div
              v-for="(comment, index) in listComments"
              v-bind:key="index"
              class="review-item"
            >
              <div class="review-item-info">
                <div class="info-user">
                  <img src="../assets/images/icon.jpg" alt="" />
                  <div>
                    <h4>{{ comment.username }}</h4>
                    <p>
                      <i class="fas fa-star"></i><i class="fas fa-star"></i
                      ><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    </p>
                  </div>
                </div>
                <span>{{ comment.created_id }}</span>
              </div>
              <div class="review-item-content">{{ comment.content }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import ProductCategory from "../components/ProductCategory.vue";
export default {
  data() {
    return {
      isShowComment: true,
      product: {},
      listComments: {},
      listRelatedProduct: {},
    };
  },
  components: {
    ProductCategory,
  },
  methods: {
    fetchProduct() {
      let self = this;
      const id = this.$route.params.id;
      axios({
        method: "post",
        data: {
          id: id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=getByIndex&id=".concat(
          id
        ),
      }).then((response) => {
        console.log(response.data.payload[0]);
        self.product = response.data.payload[0];
      });
    },
    fetchComments() {
      let self = this;
      const id = this.$route.params.id;
      axios({
        method: "post",
        data: {
          id: id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=comment&action=getByIdProduct&id_product=".concat(
          id
        ),
      }).then((response) => {
        self.listComments = response.data.payload;
      });
    },
    fetchRelatedProduct() {
      let self = this;
      const id = this.$route.params.id;
      axios({
        method: "post",
        data: {
          id: id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=getRelated&id=".concat(
          id
        ),
      }).then((response) => {
        if (response.data.status) {
          self.listRelatedProduct = response.data.payload;
        }
      });
    },
  },
  created() {
    this.fetchProduct();
    this.fetchComments();
    this.fetchRelatedProduct();
  },
};
</script>
<style lang="scss" scoped>
.container {
  width: 70%;
}
button {
  position: relative;
  padding: 15px 30px;
  margin: 0 25px;
  background-color: black;
  color: white;
  z-index: 1;
}
button::before {
  color: black;
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 0%;
  background-color: white;
  transition: all 0.3s;
  z-index: -1;
}
button:hover {
  color: black;
  box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px,
    rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px,
    rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
  &:before {
    height: 100%;
  }
}
.detail-products {
  display: flex;
  .product-img {
    .listImage {
      margin-top: 20px;
      text-align: center;
      display: flex;
      justify-content: center;
      height: 10vh;
      .image-product-item {
        padding: 3px;
        border: 2px solid rgba(black, 0.2);
        margin: 4px;
        height: 100%;
        img {
          height: 100%;
          width: 5vw;
          background-size: cover;
          background-repeat: no-repeat;
        }
      }
      .image-product-item:hover {
        cursor: pointer;
      }
    }
    width: 60%;
    .product-img-show {
      img {
        padding: 5%;
        text-align: center;
        width: 100%;
        height: 90vh;
      }
    }
  }
  .product-detail {
    margin-top: 4vh;
    max-width: 40%;
    h1 {
      font-weight: 400;
      font-size: 36px;
      line-height: 140%;
      letter-spacing: 0.04em;
      margin-bottom: 20px;
    }
    span.price-span {
      font-size: 26px;
      font-weight: 700;
    }
    p {
      margin-top: 20px;
      line-height: 140%;
      span {
        color: black;
        font-weight: 600;
      }
    }
    .product-color {
      span {
        font-weight: 600;
        font-size: 26px;
      }
      div {
        margin-top: 20px;
      }
    }
    .product-vote {
      margin-top: 20px;
      i {
        color: rgb(221, 174, 18);
        font-size: 24px;
        margin-right: 2px;
      }
    }
    .choose-size {
      margin-top: 25px;
      h3 {
        margin-top: 20px;
        text-transform: capitalize;
        flex-shrink: 0;
        align-items: center;
      }
      button {
        margin: 5px 10px;
      }
    }
    .payment {
      text-align: center;
      margin-top: 20px;
      margin-bottom: 30px;
      padding-top: 30px;
      border-top: 1px solid rgba($color: black, $alpha: 0.5);
      p {
        font-size: 18px;
        font-weight: 500;
      }
    }
    .secured {
      padding-top: 30px;
      margin-bottom: 30px;
      border-top: 1px solid rgba($color: black, $alpha: 0.5);
      display: flex;
      .secured-item {
        width: calc(100% / 3);
        text-align: center;
        i {
          font-size: 30px;
        }
      }
    }
    .description-product {
      margin-bottom: 30px;
      h3 {
      }
      p {
        max-width: 90%;
        overflow: hidden;
        line-height: 140%;
        font-weight: 500;
      }
    }
    .features-product {
      border-top: 1px solid rgba($color: black, $alpha: 0.5);
      padding-top: 20px;
      padding-bottom: 20px;
      i {
        float: right;
        font-size: 20px;
      }
    }
  }
}
.reviews-product {
  .vote-product {
    text-align: center;
    h3 {
      font-size: 40px;
      line-height: 140%;
      margin-bottom: 40px;
    }
    .vote-action {
      span:first-child {
        font-size: 24px;
        font-weight: 600;
        margin-right: 10px;
      }
      i {
        font-size: 24px;
        color: rgb(226, 177, 13);
        margin-right: 20px;
      }
    }
  }
  .reviews-content {
    .menu-review {
      padding-top: 10px;
      padding-bottom: 10px;
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid black;
      // button {
      //   position: relative;
      //   padding: 15px 40px;
      //   margin-right: 25px;
      //   font-size: 23px;
      //   margin-left: 25px;
      //   background-color: black;
      //   color: white;
      //   z-index: 1;
      // }
      .menu-left {
        padding-bottom: 20px;
      }
      .menu-right {
      }
    }
    .write-comment {
      margin-top: 100px;
      padding-left: 100px;
      width: 50%;
      h3 {
        padding-left: 100px;
        padding-bottom: 20px;
      }
    }
    .filter-reviews {
      margin-top: 70px;
      h3 {
      }
      .text-field {
        width: 30%;
      }
    }
    .list-reviews {
      margin-top: 30px;
      .review-item {
        border-bottom: 1px solid rgba(0, 0, 0, 0.151);
        padding-top: 30px;
        padding-bottom: 30px;
        display: flex;
        .review-item-info {
          width: 40%;
          display: flex;
          .info-user {
            display: flex;
            img {
              height: 50px;
              border-radius: 50%;
              padding-right: 30px;
            }
            div {
              margin-right: 50px;
              h4 {
                font-size: 20px;
                font-weight: normal;
              }
              p {
                padding-left: 20px;
                color: yellowgreen;
              }
            }
          }
        }
        .review-item-content {
        }
      }
    }
  }
}
.related-product {
  padding-top: 2vh;
  h3 {
    font-size: 2rem;
    color: rgba(0, 0, 0, 0.84);
    font-weight: 500;
  }
  .related-product-content {
    padding-top: 30px;
  }
}
</style>