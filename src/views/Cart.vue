<template>
  <div>
    <div class="cart-title">
      <h2>Shopping Bag</h2>
      <span>5</span> Items
    </div>
    <div class="cart-main">
      <!-- <div class="row">
                <div class="cart-table col col-md-8 col-sm-12">
                    <table>
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img src="../assets/images/icon.jpg" alt=""></td>
                                <td>
                                    <h2>Free Makeup Melt Cleanser Sample</h2>
                                    <p>Dry/wet Gentle Jelly Cleanser With Rose Flower</p>
                                </td>
                                <td>
                                    <div class="change-quantity">
                                        <button><i class="fas fa-minus"></i></button>
                                        <span>5</span>
                                        <button><i class="fas fa-plus"></i></button>
                                    </div>
                                </td>
                                <td>$32.00</td>
                                <td><button>Remove</button></td>
                            </tr>
                             <tr>
                                <td><img src="../assets/images/icon.jpg" alt=""></td>
                                <td>
                                    <h2>Free Makeup Melt Cleanser Sample</h2>
                                    <p>Dry/wet Gentle Jelly Cleanser With Rose Flower</p>
                                </td>
                                <td>
                                    <div class="change-quantity">
                                        <button><i class="fas fa-minus"></i></button>
                                        <span>5</span>
                                        <button><i class="fas fa-plus"></i></button>
                                    </div>
                                </td>
                                <td>$32.00</td>
                                <td><button>Remove</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="cart-checkout col col-md-3 col-sm-12">
                    <ul>
                        <li>
                            <div class="row">
                                <div class="col col-md-6 type">Subtotal</div>
                                <div class="col col-md-6 result">$40.00</div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col col-md-6 type">Shipping:</div>
                                <div class="col col-md-6 result">Add info</div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col col-md-6 type">Coupon Code</div>
                                <div class="col col-md-6 result">Add coupon</div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col col-md-6 type">Grand total:</div>
                                <div class="col col-md-6 result">$40.00</div>
                            </div>
                        </li>
                    </ul>
                    <div class="button-checkout">
                            <router-link to="/checkout">
                                <v-btn depressed color="primary" block ><i class="fas fa-user-lock"></i>Checkout</v-btn>
                            </router-link>
                    </div>
                </div>
            </div> -->
      <table
        data-aos="fade-up"
        data-aos-anchor-placement="center-bottom"
        id="cart-table"
        class="table table-hover table-condensed"
      > 
    
        <thead>
          <tr>
            <th style="width: 3%"></th>
            <th style="width: 45%">Product</th>
            <th style="width: 10%">Price</th>
            <th style="width: 8%">Quantity</th>
            <th style="width: 22%" class="text-center">Subtotal</th>
            <th style="width: 10%"></th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(product, index) in cartProducts"
            v-bind:key="index"
            class="td-product-item"
          >
            <td><input type="checkbox" name="" id="" @change="addToBill(product.id_variant,$event)"></td>
            <td id="td-info">
              <div class="row">
                <div class="col-sm-3 hidden-xs">
                  <img
                    src="http://placehold.it/100x100"
                    alt="..."
                    class="img-responsive"
                  />
                </div>
                <div class="col-sm-5">
                  <h4 class="product-name">{{ product.name }}</h4>
                </div>
                <div class="col-sm-4 product-options">
                  <p>Phân loại hàng: <i class="fas fa-sort-down"></i></p>
                  <div class="product-options-model">
                    <div class="option-item">
                      <p>Size</p>
                      <div class="list-option-item">
                        <v-btn depressed> S (40-50KG) </v-btn>
                        <v-btn depressed> L (50-65KG) </v-btn>
                        <v-btn depressed> XL (65-80KG) </v-btn>
                      </div>
                    </div>
                    <hr />
                    <div class="option-item">
                      <p>Màu sắc</p>
                      <div class="list-size">
                        <v-btn depressed>Đỏ</v-btn>
                        <v-btn depressed>Vàng</v-btn>
                        <v-btn depressed>Xanh</v-btn>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </td>
            <td id="td-price">{{ product.price }}</td>
            <td id="td-quantity">
              <div class="td-content">
                <div
                  class="value-button"
                  id="decrease"
                  @click="decreaseQuantity(product.id_variant, product.id_user)"
                  value="Decrease Value"
                >
                  -
                </div>
                <input type="text" id="number" :value="product.quantity" />
                <div
                  class="value-button"
                  id="increase"
                  @click="increaseQuantity(product.id_variant, product.id_user)"
                  value="Increase Value"
                >
                  +
                </div>
              </div>
            </td>
            <td id="subtotal" class="text-center">
              <div class="td-content">
                {{ product.price * product.quantity }}
              </div>
            </td>
            <td class="" data-th="">
              <button
                @click="
                  deleteProductInCart(product.id_user, product.id_variant)
                "
                class="btn btn-danger btn-sm"
              >
                <i class="fa fa-trash-o"></i>
              </button>
            </td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <td>
              <a href="#" class="btn btn-warning"
                ><i class="fa fa-angle-left"></i> Continue Shopping</a
              >
            </td>
            <td colspan="2" class="hidden-xs"></td>
            <td class="hidden-xs text-center">
              <strong>Total $ 5.11</strong>
            </td>
            <td>
              <router-link to="/checkout" class="btn btn-success btn-block"
                >Checkout <i class="fa fa-angle-right"></i
              ></router-link>
            </td>
          </tr>
        </tfoot>
      </table>
    </div>
    <Footer />
  </div>
</template>
<script>
import axios from "axios";
import Footer from "../components/Footer.vue";
export default {
  data() {
    return {
      cartProducts: null,
    };
  },
  components: {
    Footer,
  },
  methods: {
    decreaseQuantity(id_variant, id_user){
      let self = this;
      axios({
        method: "post",
        data: {
          id_user: id_user,
            id_variant : id_variant
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=decreaseQuantity",
      }).then((response) => {
        if(response.data.status == 200){
          self.fetchCart();
        }
      });
    },
    increaseQuantity(id_variant, id_user){
      let self = this;
      axios({
        method: "post",
        data: {
          id_user: id_user,
            id_variant : id_variant
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=increaseQuantity",
      }).then((response) => {
        if(response.data.status == 200){
          self.fetchCart();
        }
      });
    },
    fetchCart() {
      let user = JSON.parse(localStorage.getItem('user'));
      let self = this;
      axios({
        method: "post",
        data: {
          id_user: user.id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=fetchByUser",
      }).then((response) => {
        // console.log(response.data.payload);
        self.cartProducts = response.data.payload;
      });
    },
    addToBill(id_variant, event){
      if(event.target.checked){
        let products = null;
        this.cartProducts.forEach(element => {
          if(element.id_variant == id_variant){
            products = element;
          }
        });
        this.$store.dispatch('addTemporaryCart', products);
      }
      console.log(this.$store.state.temporaryCart)
    },
    deleteProductInCart(id_user, id_variant) {
      console.log(id_user, id_variant);
      let self = this;
      axios({
        method: "post",
        data: {
          id_user: id_user,
          id_variant: id_variant,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=deleteProduct",
      }).then((response) => {
        if (response.data.status) {
          self.fetchCart();
        }
      });
    },
  },
  created() {
    this.fetchCart();
  },
};
</script>
<style lang="scss" scoped>
.cart-title {
  padding: 50px;
  text-align: center;
  h2 {
    color: #111010;
    font-size: 35px;
    font-weight: bold;
    text-shadow: 1px 1px 2px #222222;
  }
  span {
    font-size: 20px;
    color: red;
  }
}
.cart-main {
  width: 70%;
  margin: auto;
  table {
    input{
        transform: scale(2);
        -ms-transform: scale(2);
        -webkit-transform: scale(2);
        padding: 10px;
      }
    thead {
      
      tr th:first-child{

      }
    }
    tbody {
      tr {
        #td-info {
          .row {
            .col-sm-3 {
              img {
                width: 100%;
              }
            }
            .col-sm-5 {
              display: flex;
              flex-direction: column;
              justify-content: center;
              align-items: left;
              h4 {
              }
              p {
                font-size: 1vw;
                margin: 0;
              }
            }
            .col-sm-4.product-options p:hover {
              & + .product-options-model {
                background: cornflowerblue;
                display: block;
              }
            }
            .col-sm-4.product-options {
              position: relative;
              p {
                i {
                }
              }
              .product-options-model {
                padding: 5px 10px;
                transition: all 1s ease;
                background: chartreuse;
                position: absolute;
                display: none;
                top: 50px;
                width: 110%;
                button {
                  padding: 0;
                }
                .option-item {
                  p {
                    text-transform: capitalize;
                    color: rgba(0, 0, 0, 0.74);
                    font-size: 1rem;
                    margin: 0;
                  }
                  .list-option-item {
                    display: flex;
                    flex-wrap: wrap;
                    button {
                      min-width: 40px;
                    }
                  }
                }
              }
            }
          }
        }
        td {
          vertical-align: middle;
        }
        button {
          margin: 5px;
        }
      }
    }
    tfoot {
      td {
        vertical-align: middle;
      }
      tr {
        a {
          text-decoration: none;
          color: white;
          font-size: 20px;
        }
      }
    }
  }
}
#td-quantity {
  .td-content {
    display: flex;
    flex-wrap: nowrap;
    border: 1px solid rgba(0, 0, 0, 0.74);

    .value-button {
      padding: 5px 15px;
      font-size: 20px;
      border: 1px solid rgba(0, 0, 0, 0.74);
    }
    .value-button:hover{
      cursor: pointer;
      background: rosybrown;
    }
    #number {
      width: 20%;
      text-align: center;
      border: none;
      border-top: 1px solid #ddd;
      border-bottom: 1px solid #ddd;
      margin: 0px;
      width: 40px;
      height: 40px;
    }
  }

  input[type="number"]::-webkit-inner-spin-button,
  input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }
}
</style>