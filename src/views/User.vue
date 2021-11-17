<template>
  <div class="container">
    <div class="row">
      <div class="col col-xs-3 col-sm-3 nav-user-action">
        <div>
          <v-list-item>
            <v-list-item-avatar>
              <v-img
                :src="user.url"
              ></v-img>
            </v-list-item-avatar>

            <v-list-item-title>John Leider</v-list-item-title>
          </v-list-item>
        </div>
        <v-list>
          <v-list-group
            v-for="(item, index) in items"
            :key="item.title"
            :prepend-icon="item.action"
            v-model="item.subactive"
            @click="closeOther(index, items)"
            no-action
            sub-group
            v-bind:disabled="false"
          >
            <template v-slot:activator>
              <v-list-item-content @click="handleShow(item.title)">
                <v-list-item-title v-text="item.title"></v-list-item-title>
              </v-list-item-content>
            </template>

            <v-list-item
              v-for="child in item.items"
              :key="child.title"
              @click="handleShowChildMenu(child.title)"
              sub-group
              link
            >
              <v-list-item-content>
                <v-list-item-title v-text="child.title"></v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list-group>
        </v-list>
      </div>
      <div class="col col-xs-9 col-sm-9">
        <div v-if="showUser[0].isShow" class="user-info">
          <div v-if="showUser[1].isProfile" class="user-info-profile">
            <div class="user-info-title">
              <h3>Hồ sơ của tôi</h3>
              <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
              <hr />
            </div>
            <div class="row user-info-main user-info-profile-content">
              <div class="col col-sm-9">
                <div>
                  
                  <div class="row">
                    <div class="form-group col col-sm-6">
                    <label for="username">First Name</label>
                    <input
                      type="text"
                      v-model="user.first_name"
                      class="form-control info-input"
                      id="username" 
                      disabled
                    />
                    </div>
                    <div class="form-group col col-sm-6">
                      <label for="username">Last Name</label>
                      <input
                        type="text"
                        v-model="user.last_name"
                        class="form-control info-input"
                        id="username"
                      disabled

                      />
                  
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="username">Ngày sinh</label>
                    <input
                      type="text"
                      v-model="user.date"
                      placeholder="yyyy-mm-dd"
                      class="form-control info-input"
                      id="username"
                      disabled

                    />
                 
                  </div>
                  
                  <div class="form-group">
                    <label for="email">Email address</label>
                    <input
                      type="email"
                      v-model="user.email"
                      class="form-control info-input"
                      id="email"
                      disabled

                      aria-describedby="emailHelp"
                    />
                 
                  </div>
                  <div class="form-group">
                    <label for="telephone">Số điện thoại</label>
                    <input
                      type="text"
                      v-model="user.phone"
                      class="form-control info-input"
                      id="telephone"
                      disabled

                    />
                  </div>
                  <div class="form-group">
                    <label for="username">Url</label>
                    <input
                      type="text"
                      v-model="user.url"
                      class="form-control info-input"
                      id="username"
                      disabled

                    />
                  
                  </div>
                  <button id="saveInfo" disabled @click="updateInfo(user.first_name)" type="submit" class="btn btn-success mt-5 px-5">
                    Lưu
                  </button>
                  <button id="changeInfo" @click="activeChange('info')"  class="btn btn-danger mt-5 px-5 mx-5">
                    Chỉnh sửa
                  </button>
                </div>
              </div>
              <div class="col col-sm-3">
                <img
                  :src="user.url"
                  alt=""
                />
                <input @change="chooseFiles($event)" type="file" style=" width:80px;"/>
              </div>
            </div>
          </div>
          <div v-if="showUser[2].isAddress" class="user-info-address">
            <div class="user-info-title">
              <h3>Địa chỉ của tôi</h3>
              <p>Quản lý thông tin địa chỉ</p>
              <hr />
            </div>
            <div class="row user-info-main user-info-address-content">
              <div class="col col-sm-9">
                <div>
                  <div class="form-group">
                    <label for="address">Địa chỉ</label>
                    <input
                      type="text"
                      v-model="user.address"
                      class="form-control address-input"
                      id="address"
                      disabled

                    />
                  </div>
                  <div class="form-group">
                    <label for="address">City</label>
                    <input
                      type="text"
                      v-model="user.city"
                      class="form-control address-input"
                      id="address"
                      disabled

                    />
                  </div>

                  <div class="form-group">
                    <label for="address">Country</label>
                    <input
                      type="text"
                      v-model="user.country"
                      class="form-control address-input"
                      id="address"
                      disabled

                    />
                  </div>
                  <div class="form-group">
                    <label for="pastalcode">Postal Code</label>
                    <input
                      v-model="user.postal_code"
                      type="text"
                      class="form-control address-input"
                      id="pastalcode"
                      disabled
                    />
                  </div>
                
                  <button disabled id="saveAddress" @click="updateAddressInfo" type="submit" class="btn btn-success mt-5 px-5">
                    Lưu
                  </button>
                  <button id="changeAddress" @click="activeChange('address')" type="" class="btn btn-danger mt-5 px-5 mx-5">
                    Chỉnh sửa
                  </button>
                </div>
              </div>
              <div class="col col-sm-3"></div>
            </div>
          </div>
          <div v-if="showUser[3].isPassword" class="user-info-password">
            <div class="user-info-title">
              <h3>Đổi mật khẩu</h3>
              <p>
                Để bảo mật tài khoản, vui lòng không chia sẻ mật khẩu cho người
                khác
              </p>
              <hr />
            </div>
            <div class="row user-info-main user-info-password-content">
              <div class="col col-sm-9">
                <div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Mật khẩu cũ</label>
                    <input
                      type="email"
                      class="form-control"
                      id="exampleInputEmail1"
                      aria-describedby="emailHelp"
                      v-model="oldPassword"
                    />
                  </div>

                  <div class="form-group">
                    <label for="exampleInputPassword1">Nhập mật khẩu mới</label>
                    <input
                      type="password"
                      v-model="newPassword"
                      class="form-control"
                      id="exampleInputPassword1"
                    />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Xác nhận mật khẩu</label>
                    <input
                      v-model="reNewPassword"
                      type="password"
                      class="form-control"
                      id="exampleInputPassword1"
                    />
                  </div>
                  

                  <button @click="updatePassword" class="btn btn-danger mt-5 px-5">
                    Xác nhận
                  </button>
                </div>
              </div>
              <div class="col col-sm-3"></div>
            </div>
          </div>
        </div>
        <div v-if="showOrder[0].isShow" class="user-info">
          <div v-if="showOrder[2].isProcessing" class="user-info-profile">
            <div class="user-info-title">
              <h3>Đơn hàng đang giao của tôi</h3>
              <p>Quản lý thông tin đơn hàng đang giao</p>
              <hr />
            </div>
            <div class="row user-info-main user-info-profile-content">
              <div v-if="listOrderings.length > 0" class="col col-sm-9">
                {{listOrderings}}
              </div>
              
            </div>
          </div>
          <div v-if="showOrder[1].isOrdered" class="user-info-address">
            <div class="user-info-title">
              <h3>Đơn hàng đã giao của tôi</h3>
              <p>Quản lý thông tin đơn hàng đã giao</p>
              <hr />
 
            <div v-if="listOrdereds.length > 0">
              <div class="table-responsive py-5"> 
              <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Ngày mua hàng</th>
                    <th scope="col">Ngày giao hàng</th>
                    <th scope="col">Tổng giá</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  
                  <tr v-for="order, index in listOrdereds" v-bind:key="index">
                    <td scope="row"></td>
                    <td>{{order.orderDate}}</td>
                    <td>{{order.shippedDate}}</td>
                    <td>{{order.totalAmount}}</td>
                    <td><button class="btn btn-lg btn-success" @click="fetchOrderDetail(order.id)" href="#myModal" data-toggle="modal" data-target="#showDetailOrder">Show Detail</button></td>
                      <div id="showDetailOrder" class="modal fade">
                  <div class="modal-dialog modal-confirm">
                    <div class="modal-content">
                      <div class="modal-body">
<table
                        data-aos="fade-up"
                        data-aos-anchor-placement="center-bottom"
                        id="cart-table"
                        class="table table-hover table-condensed"
                      > 
                        <thead>
                          <tr>
                            <th style="width: 3%">STT</th>
                            <th style="width: 45%">Product</th>
                            <th style="width: 10%">Price</th>
                            <th style="width: 8%">Quantity</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="order_item,index in orderDetail" v-bind:key="index">
                            <td>{{index + 1}}</td>
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
                                  <h4 class="product-name">{{order_item.name}}</h4>
                                </div>
                               
                              </div>
                            </td>
                            <td id="td-price">{{ order_item.price }}</td>
                            <td id="td-quantity">
                              <div class="td-content">
                                
                                <h4>{{order_item.quantity_product}} </h4>
                               
                              </div>
                            </td>
                          
                          </tr>
                        </tbody>
                        <tfoot>
                          <tr>
                            
                            <td colspan="3" class="hidden-xs">Total</td>
                            <td class="hidden-xs text-center">
                              <strong>{{order.totalAmount}}</strong>
                            </td>
                            
                          </tr>
                        </tfoot>
                      </table>
                      </div>
                      <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                      </div>
                    </div>
                  </div>
                </div> 
                  </tr>
            <!--  modal -->
            <!-- xử lí nội dung đơn hàng tùy thuộc vào đơn -->
                 
                    <!-- <div class="modal fade" id="showDetailOrder" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                      
                      <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                      </div>
                    </div> -->
                </tbody>
              </table>
              </div>

                
            </div>
            <div v-else class="row user-info-main user-info-address-content">
              <div class="col col-sm-9">Chưa có đơn hàng nào</div>
            </div>
          </div>

<!-- small modal -->
          <div class="modal fade" id="smallModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel">Small Modal</h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <h3>Modal Body</h3>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary">Save changes</button>
                </div>
              </div>
            </div>

            </div>
            
          </div>
        </div>
        <div v-if="showNotification" class="user-notification">
          <div class="user-info-title">
            <h3>Thông báo của tôi</h3>
            <p>Quản lý thông báo tài khoản</p>
            <hr />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  
  data: () => ({
    user: null,
    items: [
      {
        action: "mdi-ticket",
        subactive: false,
        items: [
          { title: "Hồ sơ" },
          { title: "Địa chỉ" },
          { title: "Đổi mật khẩu" },
        ],
        title: "Tài khoản của tôi",
      },
      {
        action: "mdi-silverware-fork-knife",
        subactive: false,
        items: [{ title: "Đang giao" }, { title: "Đã giao" }],
        title: "Đơn mua",
      },
      {
        action: "mdi-school",
        subactive: false,
        title: "Thông báo",
      },
      {
        action: "mdi-run",
        subactive: false,
        items: [{ title: "List Item" }],
        title: "Family",
      },
    ],
    model: 1,
    lockSelectiontick: false,
    showUser: [
      {
        isShow: false,
      },
      {
        isProfile: false,
      },
      {
        isAddress: false,
      },
      {
        isPassword: false,
      },
    ],
    showOrder: [
      {
        isShow: false,
      },
      {
        isOrdered: false,
      },
      {
        isProcessing: false,
      },
    ],
    showNotification: false,
    listOrdereds: [],
    listOrderings: [],
    oldPassword: null,
    newPassword: null ,
    reNewPassword : null,
    orderDetail: null,
    totalOrder: 0,
  }),
  computed:{
    totalPriceOrder: function () {
      let total = 0;
      this.orderDetail.forEach(element => {
        total += element.price * element.quantity_product
      });
      // `this` points to the vm instance
      return total;
    }
  },
  methods: {
    chooseFiles(event){
      console.log(event.target.files[0].name);
      this.user.url = event.target.files[0].name;
    },
    closeOther(index, items) {
      items.forEach((x, i) => {
        if (index != i) x.subactive = false;
      });
    },
    handleShow(title) {
      if (title == "Tài khoản của tôi") {
        this.showUser[0].isShow = !this.showUser[0].isShow;
        this.showNotification = false;
        this.showOrder[0].isShow = false;
      }
      if (title == "Thông báo") {
        this.showNotification = !this.showNotification;
        this.showUser[0].isShow = false;
        this.showOrder[0].isShow = false;
      }
      if (title == "Đơn mua") {
        this.showOrder[0].isShow = !this.showOrder[0].isShow;
        this.showUser[0].isShow = false;
        this.showNotification = false;
      }
    },
     handleShowChildMenu(title) {
      console.log(title);
      if (title === "Hồ sơ") {
        this.showUser[1].isProfile = !this.showUser[1].isProfile;
        this.showUser[2].isAddress = false;
        this.showUser[3].isPassword = false;
      }
      if (title === "Địa chỉ") {
        this.showUser[2].isAddress = !this.showUser[2].isAddress;
        this.showUser[1].isProfile = false;
        this.showUser[3].isPassword = false;
      }
      if (title === "Đổi mật khẩu") {
        this.showUser[3].isPassword = !this.showUser[3].isPassword;
        this.showUser[1].isProfile = false;
        this.showUser[2].isAddress = false;
      }
      if (title === "Đang giao") {
         this.fetchOrders('shipping');
        this.showOrder[2].isProcessing = !this.showOrder[2].isProcessing;
        this.showOrder[1].isOrdered = false;
      }
      if (title === "Đã giao") {
        this.fetchOrders('shipped');
        this.showOrder[1].isOrdered = !this.showOrder[1].isOrdered;
        this.showOrder[2].isProcessing = false;
      }
    },
    activeChange(mes){
      console.log(mes)
      if(mes == 'info'){
        this.disabledInput('info-input','change');
      }else if(mes == 'address'){
        this.disabledInput('address-input','change');

      }
    },
    disabledInput(inputClass, action){
      if(inputClass === 'info-input'){
        if(action === 'change'){
          let x = document.getElementsByClassName('info-input');
          for(let i = 0 ; i < x.length ; i++){
            x[i].disabled = false;
          }
        document.getElementById('saveInfo').disabled = false;
        document.getElementById('changeInfo').disabled = true;
        }else if(action === 'save'){
          let x = document.getElementsByClassName('info-input');
          for(let i = 0 ; i < x.length ; i++){
            x[i].disabled = true;
          }
          document.getElementById('saveInfo').disabled = true;
          document.getElementById('changeInfo').disabled = false;
        }
        
      }
      if(inputClass === 'address-input'){
        if(action === 'change'){
          let x = document.getElementsByClassName('address-input');
          for(let i = 0 ; i < x.length ; i++){
            x[i].disabled = false;
          }
        document.getElementById('saveAddress').disabled = false;
        document.getElementById('changeAddress').disabled = true;
        }else if(action === 'save'){
          console.log('test')
          let x = document.getElementsByClassName('address-input');
          for(let i = 0 ; i < x.length ; i++){
            x[i].disabled = true;
          }
          document.getElementById('saveAddress').disabled = true;
          document.getElementById('changeAddress').disabled = false;
        }
        
      }
     
    },
    updateInfo(){
      console.log('fdsf')
      let self = this;
      axios({
        method: "post",
        data:{
            id : 1,
            first_name : self.user.first_name,
            last_name : self.user.last_name,
            email : self.user.email,
            phone : self.user.phone,
            url : self.user.url,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=user&action=updateInfo",
      }).then((response) => {
        if(response.data.status == 200){
          console.log(response.data);
          document.getElementById('changeInfo').disabled = false;
          document.getElementById('saveInfo').disabled = true;

        }
      });
      
    },
    
    updateAddressInfo(){
      let self = this;
      axios({
        method: "post",
        data:{
            id_user : 1,
            address : self.user.address,
            city : self.user.city,
            postal_code : self.user.postal_code,
            country : self.user.country,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=user&action=updateAddressInfo",
      }).then((response) => {
        if(response.data.status == 200){
          console.last_name(response.data);
          self.disabledInput('address-input', 'save');
        }
      });
    },
    //check pass
    updatePassword(){
      let self = this;
      axios({
        method: "post",
        data:{
            id : 1,
            old_password : self.oldPassword,
            new_password : self.newPassword,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=user&action=updatePassword",
      }).then((response) => {
        if(response.data.status == 200){
          console.last_name(response.data);
        }
      });
      
    },
    async fetchOrders(status){
      let self = this;
      axios({
        method: "post",
        data:{
          id_user : self.user.id_user,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=order&action=getByStatus&orderstatus=".concat(
          status
        ),
      }).then((response) => {
        if(response.data.status == 200){
          console.log(response.data);
          if(status == 'Đang giao'){
            self.listOrderings = response.data.payload;
          }
          else{
            self.listOrdereds = response.data.payload;
          }
        }
      });
      
    },
    async fetchOrderDetail(order_id){
      let self = this;
      axios({
        method: "get",
        url: "https://localhost/ecommerce_backend/index.php?controller=order&action=getDetail&order_id=".concat(
          order_id
        ),
      }).then((response) => {
        if(response.data.status == 200){
          console.log(response.data.payload);
          self.orderDetail = response.data.payload;
          let total = 0;
          self.orderDetail.forEach(element => {
            total += element.price * element.quantity_product
          });
          // `this` points to the vm instance
          self.totalOrder = total;
        }
      });
      
    }
  },
  created() {
    // let x = document.getElementsByClassName("v-list-group__header");
    
    this.user = this.$store.state.user.info;
    if(this.user){
      this.fetchOrders('shipped');
    this.fetchOrders('shipping');
    }
    console.log(this.user);
  },
  mounted() {
        this.$store.dispatch('clearTempCart');
    },
};
</script>
<style lang="scss" scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700&display=swap');
*{
  font-family: 'Roboto', sans-serif;
}
td{
  vertical-align: middle;
  text-align: center;
}
body {
  background: coral;
}
img{
  width: 100%;
}
input {
}
.container {
  width: 60%;
}
.col.col-xs-9.col-sm-9 {
  padding-top: 50px;
  .user-info,
  .user-notification {
    .user-info-title {
      h3 {
        margin: 0;
        font-size: 1.125rem;
        font-weight: 500;
        line-height: 1.5rem;
        text-transform: capitalize;
        color: #333;
      }
      p {
        font-size: 0.875rem;
        line-height: 1.0625rem;
        color: #555;
      }
    }
    .user-info-main {
      padding-left: 50px;
    }
    .user-info-profile-content {
      .col.col-sm-3 {
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
        img {
          padding: 10%;
          width: 100%;
          height: 150px;
        }
        input {
        }
      }
    }
  }
}


//show detail order 
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
                font-size: 1rem;
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
    
    }
    #number {
      width: 20%;
      text-align: center;
      border: none;
      padding: 0px;
      margin: 0px;
      }
}
</style>