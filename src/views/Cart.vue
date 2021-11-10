<template>
  <div class="container-fluid">
    <div class="section-cart">
    <div class="cart-title">
      <h2>Shopping Bag</h2>
      <span>5</span> Items
    </div>
    <div class="cart-main">
      
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
                <input disabled type="text" id="number" :value="product.quantity" />
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
              <strong>Total {{totalPriceOrder}}</strong>
            </td>
            <td>
              <button @click="preparePayment()" to="/checkout" href="#myModal" data-toggle="modal" class="btn btn-success btn-block"
                >Checkout <i class="fa fa-angle-right"></i
              ></button>
                <!-- Modal HTML -->
                <div id="myModal" class="modal fade">
                  <div class="modal-dialog modal-confirm">
                    <div class="modal-content">
                      <div class="modal-body">
                        <p>Chưa có sản phẩm nào để thanh toán.</p>
                      </div>
                      <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                      </div>
                    </div>
                  </div>
                </div>  


            </td>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      cartProducts: null,
      tempArrayWaitPushToTempCart : [],
    };
  },
  computed: {
    // a computed getter
    totalPriceOrder: function () {
      let total = 0;
      this.$store.state.temporaryCart.forEach(element => {
        total += element.price * element.quantity
      });
      // `this` points to the vm instance
      return total;
    }
  },
  components: {
  },
  methods: {
    decreaseQuantity(id_variant, id_user){
      console.log(id_variant);
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
    async fetchCart() {
      let user = this.$store.state.user.info;
      let self = this;
      axios({
        method: "post",
        data: {
          id_user: user.id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=fetchByUser",
      }).then((response) => {
        console.log(response.data);
        self.cartProducts = response.data.payload;
      });
    },

    async addToBill(id_variant, event){
       
      await this.fetchCart();
      if(event.target.checked){
        console.log('check')
        this.cartProducts.forEach(element => {
          if(element.id_variant == id_variant){
            this.tempArrayWaitPushToTempCart.push(element);
          }
        });
        console.log(this.tempArrayWaitPushToTempCart)

        // this.$store.dispatch('addTemporaryCart', products);
      }
      else{
        this.cartProducts.forEach((element,index) => {
          if(element.id_variant == id_variant){
            // this.tempArrayWaitPushToTempCart.remove(index);
              console.log(index);
          }
        });
        console.log(JSON.parse(JSON.stringify(this.tempArrayWaitPushToTempCart)))

      // console.log(this.$store.state.temporaryCart)
      }
    },
    preparePayment(){
      this.tempArrayWaitPushToTempCart.forEach(( )=>{
        
      });
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
@import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700&display=swap');
*{
  font-family: 'Roboto', sans-serif;
}
.container-fluid {
  padding: 0;
  min-height: 100vh;
  background: linear-gradient(to right top, #fce1b5, #f5e4c8);
}
.section-cart {
  width: 70%;
  margin: auto;
}
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


//check model
.modal-confirm .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
	text-align: center;
	font-size: 14px;
}
.modal-confirm .modal-header {
	border-bottom: none;   
	position: relative;
}
.modal-confirm h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -10px;
}
.modal-confirm .close {
	position: absolute;
	top: -5px;
	right: -2px;
}
.modal-confirm .modal-body {
	color: #999;
}
.modal-confirm .modal-footer {
	border: none;
	text-align: center;		
	border-radius: 5px;
	font-size: 13px;
	padding: 10px 15px 25px;
}
.modal-confirm .modal-footer a {
	color: #999;
}		
.modal-confirm .icon-box {
	width: 80px;
	height: 80px;
	margin: 0 auto;
	border-radius: 50%;
	z-index: 9;
	text-align: center;
	border: 3px solid #f15e5e;
}
.modal-confirm .icon-box i {
	color: #f15e5e;
	font-size: 46px;
	display: inline-block;
	margin-top: 13px;
}
.modal-confirm .btn, .modal-confirm .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #60c7c1;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	min-width: 120px;
	border: none;
	min-height: 40px;
	border-radius: 3px;
	margin: 0 5px;
}
.modal-confirm .btn-secondary {
	background: #c1c1c1;
}
.modal-confirm .btn-secondary:hover, .modal-confirm .btn-secondary:focus {
	background: #a8a8a8;
}
.modal-confirm .btn-danger {
	background: #f15e5e;
}
.modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
	background: #ee3535;
}
.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
</style>