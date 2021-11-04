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
      <table data-aos="fade-up"
     data-aos-anchor-placement="center-bottom" id="cart-table" class="table table-hover table-condensed">
        <thead>
          <tr>
            <th style="width: 50%">Product</th>
            <th style="width: 10%">Price</th>
            <th style="width: 8%">Quantity</th>
            <th style="width: 22%" class="text-center">Subtotal</th>
            <th style="width: 10%"></th>
          </tr>
        </thead>
        <tbody>
          <tr class="td-product-item">
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
                  <h4 class="product-name">Product 1</h4>
                  <p class="product-des">Hello</p>
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
                    <hr>
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
            <td id="td-price">$5.11</td>
            <td id="td-quantity">
              <div class="td-content">
                <input
                  type="number"
                  class="form-control text-center"
                  value="1"
                />
              </div>
            </td>
            <td id="subtotal" class="text-center">
              <div class="td-content">$5.11</div>
            </td>
            <td class="" data-th="">
              <button class="btn btn-info btn-sm">
                <i class="fa fa-refresh"></i>
              </button>
              <button class="btn btn-danger btn-sm">
                <i class="fa fa-trash-o"></i>
              </button>
            </td>
          </tr>
          <tr class="td-product-item">
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
                  <h4 class="product-name">Product 1</h4>
                  <p class="product-des">Hello</p>
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
                    <hr>
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
            <td id="td-price">$5.11</td>
            <td id="td-quantity">
              <div class="td-content">
                <input
                  type="number"
                  class="form-control text-center"
                  value="1"
                />
              </div>
            </td>
            <td id="subtotal" class="text-center">
              <div class="td-content">$5.11</div>
            </td>
            <td class="" data-th="">
              <button class="btn btn-info btn-sm">
                <i class="fa fa-refresh"></i>
              </button>
              <button class="btn btn-danger btn-sm">
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
              <a href="#" class="btn btn-success btn-block"
                >Checkout <i class="fa fa-angle-right"></i
              ></a>
            </td>
          </tr>
        </tfoot>
      </table>
    </div>
    <Footer/>
  </div>
</template>
<script>
import Footer from '../components/Footer.vue';
export default {
  components:{
    Footer,
  }
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
    thead {
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
            .col-sm-4.product-options p:hover{
              &+.product-options-model{
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

</style>