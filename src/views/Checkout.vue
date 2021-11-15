<template>
  <div>
    <h1>Checkout Page</h1>
    <div class="tab_container">
      <input id="tab1" type="radio" name="tabs" />
      <label for="tab1"
        ><span class="numberCircle">1</span><span>Cart</span></label
      >

      <input id="tab2" type="radio" name="tabs" />
      <label for="tab2"
        ><span class="numberCircle">2</span
        ><span>Customer Information</span></label
      >

      <input id="tab3" type="radio" name="tabs" />
      <label for="tab3"
        ><span class="numberCircle">3</span><span>Shipping</span></label
      >

      <input id="tab4" type="radio" name="tabs" checked />
      <label for="tab4"
        ><span class="numberCircle">4</span><span>Payment</span></label
      >

      <section id="content1" class="tab-content">
        <h3>Cart Items</h3>
        <p></p>
        <table
          data-aos="fade-up"
          data-aos-anchor-placement="center-bottom"
          id="cart-table"
          class="table table-hover table-condensed"
        >
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
            <tr
              v-for="(product, index) in cartProducts"
              v-bind:key="index"
              class="td-product-item"
            >
              <td id="td-info">
                <div class="row">
                  <div class="col-sm-3 hidden-xs">
                    <img
                      src="http://placehold.it/100x100"
                      alt="..."
                      class="img-responsive"
                    />
                  </div>
                  <div class="col-sm-9">
                    <h4 class="product-name">{{ product.name }}</h4>
                  </div>
                </div>
              </td>
              <td id="td-price">{{ product.price }}</td>
              <td id="td-quantity">
                <div class="td-content">
                  <div
                    class="value-button"
                    id="decrease"
                    @click="
                      decQuantityTempCart(product.id_variant)
                    "
                    value="Decrease Value"
                  >
                    -
                  </div>
                  <input type="text" id="number" :value="product.quantity" />
                  <div
                    class="value-button"
                    id="increase"
                    @click="
                      incQuantityTempCart(product.id_variant)
                    "
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
                    deleTempCart( product.id_variant)
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
                <a href="/checkout" class="btn btn-success btn-block"
                  >Checkout <i class="fa fa-angle-right"></i
                ></a>
              </td>
            </tr>
          </tfoot>
        </table>
      </section>

      <section id="content2" class="tab-content">
        <h3>Customer Information</h3>
        <div class="form-cc" action="">
          <div class="">
            <div class="row-cc">
              <div class="cc-field">
                <div class="row">
                  <div class="col col-sm-6">
                    <input
                      type="text"
                      class="input cc-txt"
                      placeholder="First name"
                      v-model="firstName"
                    />
                  </div>
                  <div class="col col-sm-6">
                    <input
                      type="text"
                      v-model="lastName"
                      class="input cc-txt"
                      placeholder="Last name"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div class="row-cc">
              <div class="cc-field">
                <input type="text" class="input cc-txt" placeholder="Email" v-model="email" />
              </div>
            </div>
            <div class="row-cc">
              <div class="cc-field">
                <div class="row">
                  <div class="col col-sm-7">
                    <input
                      type="text"
                      class="input cc-txt"
                      v-model="address"
                      placeholder="Address"
                    />
                  </div>
                  <div class="col col-sm-5">
                    <input
                      type="text"
                      class="input cc-txt"
                      placeholder="Apt, suite"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div class="row-cc">
              <div class="cc-field">
                <input type="text" v-model="city" class="input cc-txt" placeholder="City" />
              </div>
            </div>
          </div>
        </div>
        <div
          data-aos="fade-up"
          data-aos-anchor-placement="center-bottom"
          class="button-master-container"
        >
          <div class="button-previous-methods">
            <a href="#content3">Return to Cart</a>
          </div>
          <div class="button-next-methods button-finish">
            <a href="#">Shipping</a>
          </div>
        </div>
      </section>

      <section id="content3" class="tab-content">
        <h3>Shipping</h3>
        <div class="form-cc" action="">
          <div class="">
            
            <div class="row-cc">
              <div class="cc-field">
                <div class="cc-title"><h4>Shipping Address</h4></div>
                <div class="row">
                  <div class="col col-sm-12">
                    <input
                      type="text"
                      class="input cc-txt"
                      v-model="detailAddress"
                      placeholder="Địa chỉ cụ thể"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div class="row-cc">
              <div class="cc-field">
                <div class="row">
                  <div class="col col-sm-7">
                    <input
                      type="text"
                      class="input cc-txt"
                      v-model="address"
                      placeholder="Address"
                    />
                  </div>
                  <div class="col col-sm-5">
                    <input
                      type="text"
                      class="input cc-txt"
                      placeholder="Apt, suite"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div class="row-cc">
              <div class="cc-field">
                <input type="text" class="input cc-txt" placeholder="City" v-model="city" />
              </div>
            </div>

            <div class="row-cc">
              <div class="cc-field">
                <div class="row">
                  <div class="col col-sm-6">
                    <select class="input cc-ddl">
                      <option selected>
                        Country <i class="fas fa-arrow-down"></i>
                      </option>
                      <option>America</option>
                      <option>Thailand</option>
                      <option>Laos</option>
                      <option>VietNam</option>
                      <option>Chile</option>
                      <option>Argentina</option>
                      <option>Russia</option>
                      <option>09</option>
                      <option>10</option>
                      <option>11</option>
                      <option>12</option>
                    </select>
                  </div>
                  <div class="col col-sm-6">
                    <input
                      type="text"
                      class="input cc-txt"
                      placeholder="Postal Code"
                      v-model="postalCode"
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div
          data-aos="fade-up"
          data-aos-anchor-placement="center-bottom"
          class="button-master-container"
        >
          <div class="button-previous-methods">
            <a href="#content3">Return to Customer Information</a>
          </div>
          <div class="button-next-methods button-finish">
            <a href="#">Payment</a>
          </div>
        </div>
      </section>

      <section id="content4" class="tab-content">
        <h4 class="payment-title">Chọn phương thức thanh toán</h4>
        <div v-if="!showNewMethod">
          <div class="pymt-radio">
            <div class="row-payment-method payment-row">
              <div class="select-icon">
                <input type="radio" @click="payment_type = 'Cash On Delivery'" id="radio0" name="radios" value="pp" />
                <label for="radio0"></label>
              </div>
              <div class="select-txt">
                <p class="pymt-type-name">Thanh toán khi nhận hàng</p>
                <p class="pymt-type-desc">
                  Khách hàng trả tiền mặt trực tiếp khi hàng được giao 
                </p>
              </div>
              
            </div>
          </div>
          
          <div v-for="payment,index in paymentMethods" v-bind:key="index" class="pymt-radio" >
            <div class="row-payment-method payment-row">
              <div class="select-icon">
                <input type="radio" :id="'radio-'.concat(index)" @click="card_id = payment.id;payment_type = 'Online' " name="radios" value="pp" />
                <label :for="'radio-'.concat(index)"></label>
              </div>
              <div class="select-txt">
                <p class="pymt-type-name">{{payment.payment_type}} </p>
                <p class="pymt-type-desc">
                  Số tài khoản : {{payment.account_no}}  <span style="color : red">{{payment.provider}}</span>
                </p>
                <p class="pymt-type-desc">
                  Expiry : {{payment.expiry}}
                </p>
              </div>
              
            </div>
          </div>
         
        </div>
        <button class="btn btn-danger mx-5 mt-5 mb-5" @click="showNewMethod = !showNewMethod">Thêm phương thức thanh toán mới</button>
        <div v-if="showNewMethod">
          <div class="pymt-radio">
            <div class="row-payment-method payment-row">
              <div class="select-icon">
                <input type="radio" @click="card_type = 'Paypal'" id="radio1" name="radios" value="pp" />
                <label for="radio1"></label>
              </div>
              <div class="select-txt">
                <p class="pymt-type-name">Paypal</p>
                <p class="pymt-type-desc">
                  Safe payment online. Credit card needed. PayPal account is not
                  necessary.
                </p>
              </div>
              <div class="select-logo">
                <img
                  src="https://www.dropbox.com/s/pycofx0gngss4ef/logo-paypal.png?raw=1"
                  alt="PayPal"
                />
              </div>
            </div>
          </div>
          <div class="pymt-radio">
            <div class="row-payment-method payment-row-last">
              <div class="select-icon hr">
                <input
                  type="radio"
                  id="radio2"
                  name="radios"
                  @click="card_type = 'Visa'"
                  value="pp"
                  checked
                />
                <label for="radio2"></label>
              </div>
              <div class="select-txt hr">
                <p class="pymt-type-name">Credit Card</p>
                <p class="pymt-type-desc">
                  Safe money transfer using your bank account. Safe payment
                  online. Credit card needed. Visa, Maestro, Discover, American
                  Express
                </p>
              </div>
              <div class="select-logo">
                <div class="select-logo-sub logo-spacer">
                  <img
                    src="https://www.dropbox.com/s/by52qpmkmcro92l/logo-visa.png?raw=1"
                    alt="Visa"
                  />
                </div>
                <div class="select-logo-sub">
                  <img
                    src="https://www.dropbox.com/s/6f5dorw54xomw7p/logo-mastercard.png?raw=1"
                    alt="MasterCard"
                  />
                </div>
              </div>
            </div>
          </div>
          <div class="form-cc">
            <div class="row-cc">
              <div class="cc-field">
                <div class="cc-title">Credit Card Number</div>
                <input
                  type="text"
                  class="input cc-txt text-validated"
                  value="4542 9931 9292 2293"
                  v-model="accountNb"
                />
              </div>
              <div class="cc-field">
                <div class="cc-title">Provider</div>
                <input
                  type="text"
                  class="input cc-txt"
                  value="BIDV"
                  v-model="provider"
                />
              </div>
            </div>
            <div class="row-cc">
              <div class="cc-field">
                <div class="cc-title">Expiry Date</div>
                <select @change="chooseDay($event)" class="input cc-ddl">   
                  <option selected>01</option>
                  <option>02</option>
                  <option>03</option>
                  <option>04</option>
                  <option>05</option>
                  <option>06</option>
                  <option>07</option>
                  <option>08</option>
                  <option>09</option>
                  <option>10</option>
                  <option>11</option>
                  <option>12</option>
                </select>
                <select @change="chooseMonth($event)" class="input cc-ddl">
                  <option>01</option>
                  <option>02</option>
                  <option>03</option>
                  <option>04</option>
                  <option>05</option>
                  <option>06</option>
                  <option>07</option>
                  <option>08</option>
                  <option>09</option>
                  <option>10</option>
                  <option>11</option>
                  <option>12</option>
                  <option>13</option>
                  <option>14</option>
                  <option>15</option>
                  <option selected>16</option>
                  <option>17</option>
                  <option>18</option>
                  <option>19</option>
                  <option>20</option>
                  <option>21</option>
                  <option>22</option>
                  <option>23</option>
                  <option>24</option>
                  <option>25</option>
                  <option>26</option>
                  <option>27</option>
                  <option>28</option>
                  <option>29</option>
                  <option>30</option>
                  <option>31</option>
                </select>
              </div>
              <div class="cc-field">
                <div class="cc-title">
                  Year<span class="numberCircle">?</span>
                </div>
                <input type="text" class="input cc-txt" v-model="yearNb" />
              </div>
            </div>
            <div class="row-cc">
              <div class="cc-field">
                <div class="cc-title">Name on Card</div>
                <input type="text" class="input cc-txt" />
              </div>
            </div>
          </div>
          <button class="btn btn-danger mx-5 mt-5 mb-5" @click="insertUserPayment()">Thêm phương thức</button>
        </div>
        <div
            data-aos="fade-up"
            data-aos-anchor-placement="center-bottom"
            class="button-master-container"
          >
            <div class="button-previous-methods">
              <a href="#content3">Return to Shipping</a>
            </div>
            <div class="button-next-methods button-finish">
              <btn @click="submitOrder()" href="#modelSubmit" data-toggle="modal">Finish Order</btn>
          
                <div v-if="isShow" id="modelSubmit" class="modal fade">
                  <div class="modal-dialog modal-confirm">
                    <div class="modal-content">
                      <div class="modal-body">
                        <Loading/>
                        <p>Thanh toán thành công.</p>
                      </div>
                      <div class="modal-footer justify-content-center">
                        <router-link to = '/home' type="button" class="btn btn-danger" data-dismiss="modal">Tiếp tục mua hàng</router-link>
                      </div>
                    </div>
                  </div>
                </div>  
            </div>
          </div>
      </section>
      
    </div>
    <Footer />
  </div>
</template>
<script>
import axios from "axios";
import Footer from "../components/Footer.vue";
import Loading from "../components/Animation/Loading.vue"
export default {
  data() {
    return {
      isShow:false,
      paymentMethods: null,
      cartProducts: null,
      infoUser : null,
      address: null,
      firstName : null,
      lastName : null,
      email : null,
      city: null,
      detailAddress: null,
      postalCode: null,
      showNewMethod: false,
      id_order: null,
      dayNb :null,
      monthNb : null, 
      yearNb : null,
      accountNb: null,
      provider: null,
      card_type : 'Visa',
      card_id: null,
      payment_type : null,
    };

  },
  computed: {
    // a computed getter
    totalPriceOrder: function () {
      let total = 0;
      this.cartProducts.forEach(element => {
        total += element.price * element.quantity
      });
      // `this` points to the vm instance
      return total;
    }
  },
  methods: {
    chooseCartType(mes){
      console.log(mes)
    },
    chooseDay(event) {
      console.log(this.card_type);
          this.dayNb = event.target.value
      },
      chooseMonth(event) {
         this.monthNb = event.target.value

      },
    fetchCart() {
      this.cartProducts = this.$store.state.temporaryCart;
      console.log(this.cartProducts);
    },
    
    fetchPaymentInfo(){
      let user = this.$store.state.user.info;
      // let user = 1;
      let self = this;
      axios({
        method: "post",
        data: {
          user_id: user.id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=user&action=getPaymentInfo",
      }).then((response) => {
        if(response.data.status == 200){
          console.log(response.data.payload);
          self.paymentMethods = response.data.payload ;
        }
      });
      
    },
    fetchInfoUser() {
      let self = this;
      let user = this.$store.state.user.info;
      axios({
        method: "post",
        data: {
          id: user.id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=user&action=getInfo",
      }).then((response) => {
        self.address = response.data.payload[0].address;
        self.email = response.data.payload[0].email;
        self.firstName = response.data.payload[0].first_name;
        self.lastName = response.data.payload[0].last_name;
        self.city = response.data.payload[0].city;

      });
    }, 
    async incQuantityTempCart(id_variant) {
      let self = this;
      axios({
        method: "post",
        data: {
          id_user: self.$store.state.user.info.id,
            id_variant : id_variant
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=increaseQuantity",
      }).then((response) => {
        if(response.data.status == 200){
          self.fetchCart();
        }
      });
      await this.$store.dispatch('incQuanTempCart', id_variant);
    },
    async decQuantityTempCart(id_variant) {
      let self = this;
      await axios({
        method: "post",
        data: {
          id_user: self.$store.state.user.info.id,
            id_variant : id_variant
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=decreaseQuantity",
      }).then((response) => {
        if(response.data.status == 200){
          self.fetchCart();
        }
      });
      await this.$store.dispatch('decQuanTempCart', id_variant);

    },
    async deleTempCart(id_variant) {
       await this.$store.dispatch('deleTempCart' ,id_variant);
    },
    submitOrder(){
      this.isShow = true;
      this.insertOrders();
    },
     insertOrders() {
      // this.deleteProductIncart();
      let self = this;
       axios({
        method: "post",
        data: {
          id_user: self.$store.state.user.info.id,
          orderAddress : self.detailAddress,
          totalAmount : self.totalPriceOrder,
          status : 'shipping'
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=order&action=addOrder",
      }).then((response) => {
        if (response.data.status == 200) {
          self.id_order  = response.data.payload;
          console.log('insertOrder');
          self.insertOrdersDetail(self.id_order);
          self.insertPaymentDetail();
        }
      });
    },
    async insertOrdersDetail(id_order) {
      console.log('test');
      let self = this;
      axios({
        method: "post",
        data: {
          id_order : id_order,
          products : self.cartProducts,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=order&action=addOrderDetail",
      }).then((response) => {
        if (response.data.status == 200) {
          console.log('inserOrderDetail')
         
          self.deleteProductIncart();
          self.fetchCart();
        }
      });
    },
    
    async deleteProductIncart() {

      let self = this;
      axios({
        method: "post",
        data: {
          id_user : self.$store.state.user.info.id,
          products : self.cartProducts,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=deleteListProduct",
      }).then((response) => {
        if (response.data.status == 200) {
          self.fetchCart();
          self.$store.dispatch('changeCart');

        }
      });
       self.$store.dispatch('clearTempCart');
       console.log('fdfsf');
    },
    async insertPaymentDetail() {
      let self = this;
      axios({
        method: "post",
        data: {
          id : self.id_order,
          payment_type : self.payment_type,
          card_id : self.card_id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=payment&action=insertPaymentDetail",
      }).then((response) => {
        if (response.data.status == 200) {
          console.log('insertPaymentDetail')

          self.fetchCart();
        }
      });
    },
    async insertUserPayment() {
      let ex = this.yearNb.concat('-').concat(this.dayNb).concat('-').concat(this.monthNb);
      let self = this;
      self.showNewMethod = false;
      console.log(self.accountNb);
      axios({
        method: "post",
        data: {
          user_id : self.$store.state.user.info.id,
          card_type : self.card_type,
          provider : self.provider,
          account_no : self.accountNb,
          expiry : ex,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=payment&action=insertUserPayment",
      }).then((response) => {
        if (response.data.status == 200) {
          self.fetchPaymentInfo();
          console.log('insertUserPayemnt')
        }
      });
    },
    
  },
  created() {
    if(localStorage.getItem('info') !== null){
        this.$store.state.user.info = JSON.parse(localStorage.getItem('info'));
      }
    this.fetchInfoUser()
    this.fetchCart();
    this.fetchPaymentInfo();
  },
  components: {
    Footer,Loading
  },
};
</script>
<style lang="scss" scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700&display=swap');
*{
  font-family: 'Roboto', sans-serif;
}
 table {
    thead {
    }
    tbody {
      tr {
        #td-info {
          .row {
            .col{
              padding: 0;
            }
            .col-sm-3 {
              img {
                width: 100%;
              }
            }
            .col-sm-9 {
              display: flex;
              flex-direction: column;
              justify-content: center;
              align-items: left;
              h4 {
                font-size: 16px;
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
    .value-button:hover {
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
h1 {
  color: #111010;
  font-size: 35px;
  text-align: center;
  font-weight: bold;
  text-shadow: 1px 1px 2px #222222;
}
h4.payment-title {
  text-align: left;
  padding: 10px 0px 30px 30px;
  font-weight: 500;
  color: #5e6977;
}
a {
  color: #ccc;
  text-decoration: none;
  outline: none;
}

.tab_container {
  width: 550px;
  margin: 50px auto;
  position: relative;
  border: 1px solid #eee;
  border-radius: 7px;
  background: #fff;
}

input,
section {
  clear: both;
  padding-top: 10px;
  display: none;
}

label {
  font-weight: 700;
  font-size: 14px;
  display: block;
  float: left;
  padding: 20px 14px;
  color: #ccc;
  cursor: pointer;
  text-decoration: none;
  text-align: center;
  background: #fff;
  margin-bottom: 2px;
  border-top-left-radius: 7px;
  border-top-right-radius: 7px;
  border-bottom: 2px solid #eee;
}

#tab1:checked ~ #content1,
#tab2:checked ~ #content2,
#tab3:checked ~ #content3,
#tab4:checked ~ #content4 {
  display: block;
  padding: 20px 0 0 0;
  color: rgb(27, 27, 27);
}

.tab_container .tab-content h3 {
  text-align: center;
}

.tab_container [id^="tab"]:checked + label {
  background: #fff;
  border-bottom: 2px solid #358ed7;
  color: #358ed7;
}

.tab_container [id^="tab"]:checked + label > span.numberCircle {
  border: 2px solid #358ed7;
  border-radius: 50%;
  width: 30px;
  height: 30px;
  padding: 3px 5px;
  text-align: center;
  font-size: 10px;
  margin: 3px 8px;
}

label:hover {
  background-color: #eee;
  border-radius: 0px;
}

.numberCircle {
  border-radius: 50%;
  width: 30px;
  height: 30px;
  padding: 3px 5px;
  border: 2px solid #ccc;
  text-align: center;
  font-size: 10px;
  margin: 3px 8px;
}

.row-payment-method {
  margin: 0px 0px 0px 0px;
  padding: 22px 0px 11px 0px;
  text-align: left;
  display: table;
}
.payment-row {
  background-color: #f5f6fa;
  padding-left: 30px;
  padding-right: 30px;
  width: 100%;
}
.payment-row-last {
  margin-left: 30px;
  margin-right: 30px;
  width: 100%;
}

.select-icon {
  display: table-cell;
  vertical-align: top;
  text-align: left;
  padding-left: 0px;
  padding-top: 0px;
  padding-right: 0px;
  padding-bottom: 0px;
  width: 24px;
  height: 24px;
}

.select-txt {
  display: table-cell;
  vertical-align: middle;
  word-wrap: break-word;
  height: 60px;
  text-align: left;
  padding-left: 15px;
  font-size: 12pt;
}
.select-logo {
  padding-right: 0px;
  vertical-align: top;
  right: 35px;
  position: absolute;
}
.select-logo-sub {
  display: table-cell;
  vertical-align: middle;
}
.logo-spacer {
  padding-right: 13px;
}
.pymt-type-name {
  font-weight: 500;
  font-size: 12pt;
  padding-bottom: 8px;
  color: #5a6977;
}
.pymt-type-desc {
  padding-bottom: 10px;
  width: 70%;
  font-size: 14px;
}
.hr {
  border-bottom: 1px solid #ebf0f5;
  padding-bottom: 5px;
}
.form-cc {
  display: table;
  width: 100%;
  text-align: left;
  padding: 0px 0px 30px 30px;
}
.row-cc {
  display: table;
  width: 100%;
  padding-bottom: 7px;
}
.cc-txt {
  border-color: #e1e8ee;
  width: 100%;
}
.input {
  border-radius: 5px;
  border-style: solid;
  border-width: 2px;
  height: 38px;
  padding-left: 15px;
  font-weight: 600;
  font-size: 11pt;
  color: #5e6977;
}
input[type="text"] {
  display: initial;
  padding: 15px;
}
.text-validated {
  border-color: #7dc855;
  background-image: url("https://www.dropbox.com/s/1mve74fafiwsae1/icon-tick.png?raw=1");
  background-repeat: no-repeat;
  background-position: right 18px center;
}
.cc-ddl {
  border-color: #f0f4f7;
  background-color: #f0f4f7;
  width: 100px;
  margin-right: 10px;
}
.cc-title {
  font-size: 10.5pt;
  padding-bottom: 8px;
}
.cc-field {
  padding-top: 15px;
  padding-right: 30px;
  display: table-cell;
}
.button-master-container,
.button-master-container:hover {
  display: table;
  width: 100%;
  border-top: 1px solid #e1e8ee;
  height: 60px;
  vertical-align: bottom;
}
.button-previous-methods {
  width: 50%;
  display: table-cell;
  text-align: center;
  vertical-align: middle;
  background: rgb(197, 194, 194);
}
.button-next-methods {
  width: 50%;
  display: table-cell;
  text-align: center;
  vertical-align: middle;
  background: rgb(209, 245, 180);
}
.button-next-methods:hover {
  background-color: rgb(180, 241, 139);
  cursor: pointer;
}
a,
a:hover {
  color: inherit;
  text-decoration: inherit;
}
.button-previous-methods:hover {
  background-color: rgb(184, 179, 179);
  cursor: pointer;
}
.button-finish {
  border-left: 1px solid #e1e8ee;
  color: #7dc855;
  font-weight: 500;
  font-size: 12pt;
  background-image: url("https://www.dropbox.com/s/10d95otbo48r0hh/icon-next.png?raw=1");
  background-repeat: no-repeat;
  background-position: right 50px center;
}
.cvv-tooltip-img {
  display: inline-block;
  vertical-align: middle;
  padding-left: 17px;
}
input[id^="radio"] {
  display: none;
}

input[id^="radio"] + label {
  background-image: url("https://www.dropbox.com/s/mnwbybfl4pnzoi4/radio-inactive.png?raw=1");
  height: 26px;
  width: 24px;
  display: inline-block;
  padding: 0 0 0 0px;
  cursor: pointer;
  border-radius: 50%;
}

input[id^="radio"]:checked + label {
  background-image: url("https://www.dropbox.com/s/8634yi8i1s7fx7w/radio-active.png?raw=1");
  height: 26px;
  width: 24px;
  display: inline-block;
  padding: 0 0 0 0px;
  cursor: pointer;
}
p.credit {
  text-align: center;
  color: #ccc;
}
/* Customer Form
–––––––––––––––––––––––––––––––––––––––––––––––––– */

/* form headings */
#customer {
  width: 100%;
  max-width: 560px;
  margin: 0 auto;
}
#customer h4 {
  font-family: "Lora", sans-serif;
  font-size: 1.28571em;
}

/* checkbox */
label.check1 {
  font-weight: normal;
}
#customer p {
  font-size: 12px;
  color: red;
  margin: 0;
  padding: 0;
}

/* pseudo-elements stylin' */
::selection {
  background: #f06060;
  color: white;
}

/* Skeleton Custom
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.button.button-primary,
button.button-primary,
input[type="submit"].button-primary,
input[type="reset"].button-primary,
input[type="button"].button-primary {
  color: #fff;
  background-color: #f06060;
  border-color: #f06060;
}
.button.button-primary:hover,
button.button-primary:hover,
input[type="submit"].button-primary:hover,
input[type="reset"].button-primary:hover,
input[type="button"].button-primary:hover,
.button.button-primary:focus,
button.button-primary:focus,
input[type="submit"].button-primary:focus,
input[type="reset"].button-primary:focus,
input[type="button"].button-primary:focus {
  color: #fff;
  background-color: #e52929;
  border-color: #e52929;
}

input[type="email"]:focus,
input[type="number"]:focus,
input[type="search"]:focus,
input[type="text"]:focus,
input[type="tel"]:focus,
input[type="url"]:focus,
input[type="password"]:focus,
textarea:focus,
select:focus {
  border: 2px solid #f06060;
  outline: 0;
}
</style>