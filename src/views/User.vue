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
                    />
                    </div>
                    <div class="form-group col col-sm-6">
                      <label for="username">Last Name</label>
                      <input
                        type="text"
                        v-model="user.last_name"
                        class="form-control info-input"
                        id="username"
                      />
                  
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="username">Last Name</label>
                    <input
                      type="text"
                      v-model="user.last_name"
                      class="form-control info-input"
                      id="username"
                    />
                 
                  </div>
                  
                  <div class="form-group">
                    <label for="email">Email address</label>
                    <input
                      type="email"
                      v-model="user.email"
                      class="form-control info-input"
                      id="email"
                      aria-describedby="emailHelp"
                    />
                 
                  </div>
                  <div class="form-group">
                    <label for="telephone">Số điện thoại</label>
                    <input
                      type="text"
                      v-model="user.telephone"
                      class="form-control info-input"
                      id="telephone"
                    />
                  </div>
                  <div class="form-group">
                    <label for="username">Url</label>
                    <input
                      type="text"
                      v-model="user.url"
                      class="form-control info-input"
                      id="username"
                    />
                  
                  </div>
                  <button @click="updateInfo(user.first_name)" type="submit" class="btn btn-success mt-5 px-5">
                    Lưu
                  </button>
                  <button @click="activeChange('info')"  class="btn btn-danger mt-5 px-5 mx-5">
                    Chỉnh sửa
                  </button>
                </div>
              </div>
              <div class="col col-sm-3">
                <img
                  :src="user.url"
                  alt=""
                />
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
                    />
                  </div>
                  <div class="form-group">
                    <label for="address">City</label>
                    <input
                      type="text"
                      v-model="user.city"
                      class="form-control address-input"
                      id="address"
                    />
                  </div>

                  <div class="form-group">
                    <label for="address">Country</label>
                    <input
                      type="text"
                      v-model="user.country"
                      class="form-control address-input"
                      id="address"
                    />
                  </div>
                  <div class="form-group">
                    <label for="pastalcode">Postal Code</label>
                    <input
                      v-model="user.postal_code"
                      type="text"
                      class="form-control address-input"
                      id="pastalcode"
                    />
                  </div>
                
                  <button @click="updateAddressInfo" type="submit" class="btn btn-success mt-5 px-5">
                    Lưu
                  </button>
                  <button @click="activeChange('address')" type="" class="btn btn-danger mt-5 px-5 mx-5">
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
                    <td scope="row">1</td>
                    <td>{{order.orderDate}}</td>
                    <td>{{order.shippedDate}}</td>
                    <td>{{order.totalAmount}}</td>
                    <td><btn href="#" class="btn btn-lg btn-success" data-toggle="modal" data-target="#showDetailOrder">Show Detail</btn></td>
                  </tr>
            <!--  modal -->
            <!-- xử lí nội dung đơn hàng tùy thuộc vào đơn -->
                    <div class="modal fade" id="showDetailOrder" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Basic Modal</h4>
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
    user: null,
    listOrdereds: [],
    listOrderings: [],
    oldPassword: null,
    newPassword: null ,
    reNewPassword : null,
  }),
  methods: {
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
        this.showOrder[2].isProcessing = !this.showOrder[2].isProcessing;
        this.showOrder[1].isOrdered = false;
        this.fetchOrders('shipping');
      }
      if (title === "Đã giao") {
        this.showOrder[1].isOrdered = !this.showOrder[1].isOrdered;
        this.showOrder[2].isProcessing = false;
        this.fetchOrders('shipped');
      }
    },
    activeChange(mes){
      console.log(mes)
      if(mes == 'info'){
        let x = document.getElementsByClassName('info-input');
        console.log(x.length);
        for(let i = 0 ; i < x.length ; i++){
          x[i].eq(i).attr('disabled', 'disabled');
        }
      }
    },
    updateInfo(){
      let self = this;
      axios({
        method: "post",
        data:{
            id : 1,
            first_name : self.user.first_name,
            last_name : self.user.last_name,
            email : self.user.email,
            phone : self.user.telephone,
            url : self.user.url,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=user&action=updateInfo",
      }).then((response) => {
        if(response.data.status == 200){
          console.last_name(response.data);
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
    fetchOrders(status){
      let self = this;
      axios({
        method: "get",
        url: "https://localhost/ecommerce_backend/index.php?controller=order&action=getByStatus&orderstatus=".concat(
          status
        ),
      }).then((response) => {
        if(response.data.status == 200){
          if(status == 'Đang giao'){
            self.listOrderings = response.data.payload;
          }
          else{
            self.listOrdereds = response.data.payload;
          }
        }
      });
      
    }
  },
  created() {
    // let x = document.getElementsByClassName("v-list-group__header");
    this.user = JSON.parse(localStorage.getItem('user'));
    console.log(this.user);
  },
};
</script>
<style lang="scss" scoped>
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
</style>