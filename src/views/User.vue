<template>
  <div class="container">
    <div class="row">
      <div class="col col-xs-3 col-sm-3 nav-user-action">
        <v-list>
          <v-list-group
            v-for="item in items"
            :key="item.title"
            v-model="item.active"
            :prepend-icon="item.action"
            no-action
            sub-group
            v-bind:disabled="lockSelection.concat(item.action.substr(4, 7))"
          >
            <template v-slot:activator>
              <v-list-item-content>
                <v-list-item-title
                  v-text="item.title"
                  @click="handleShow(item.title)"
                ></v-list-item-title>
              </v-list-item-content>
            </template>

            <v-list-item
              v-for="child in item.items"
              :key="child.title"
              sub-group
              link
            >
              <v-list-item-content>
                <v-list-item-title
                  v-text="child.title"
                  @click="handleShowChildMenu(child.title)"
                ></v-list-item-title>
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
                <form>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input
                      type="email"
                      class="form-control"
                      id="exampleInputEmail1"
                      aria-describedby="emailHelp"
                    />
                    <small id="emailHelp" class="form-text text-muted"
                      >We'll never share your email with anyone else.</small
                    >
                  </div>

                  <div class="form-group">
                    <label for="exampleInputPassword1">Email</label>
                    <input
                      type="password"
                      class="form-control"
                      id="exampleInputPassword1"
                    />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Số điện thoại</label>
                    <input
                      type="password"
                      class="form-control"
                      id="exampleInputPassword1"
                    />
                  </div>

                  <button type="submit" class="btn btn-danger mt-5 px-5">
                    Lưu
                  </button>
                </form>
              </div>
              <div class="col col-sm-3">
                <img
                  src="https://cf.shopee.vn/file/761696a40b4b6d45ce2fca3622d77bd1"
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
                <form>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input
                      type="email"
                      class="form-control"
                      id="exampleInputEmail1"
                      aria-describedby="emailHelp"
                    />
                    <small id="emailHelp" class="form-text text-muted"
                      >We'll never share your email with anyone else.</small
                    >
                  </div>

                  <div class="form-group">
                    <label for="exampleInputPassword1">Email</label>
                    <input
                      type="password"
                      class="form-control"
                      id="exampleInputPassword1"
                    />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Số điện thoại</label>
                    <input
                      type="password"
                      class="form-control"
                      id="exampleInputPassword1"
                    />
                  </div>
                  <div class="form-group form-check">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      id="exampleCheck1"
                    />
                  </div>
                  <button type="submit" class="btn btn-success mt-5 px-5">
                    Lưu
                  </button>
                </form>
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
                <form>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Mật khẩu mới</label>
                    <input
                      type="email"
                      class="form-control"
                      id="exampleInputEmail1"
                      aria-describedby="emailHelp"
                    />
                  </div>

                  <div class="form-group">
                    <label for="exampleInputPassword1">Xác nhận mật khẩu</label>
                    <input
                      type="password"
                      class="form-control"
                      id="exampleInputPassword1"
                    />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Xác minh</label>
                    <div class="row">
                      <div class="col col-sm-9">
                        <input
                          type="password"
                          class="form-control"
                          id="exampleInputPassword1"
                        />
                      </div>
                      <div class="col col-sm-3">
                        <button class="btn btn-danger">Gửi mã xác nhận</button>
                      </div>
                    </div>
                  </div>

                  <button type="submit" class="btn btn-danger mt-5 px-5">
                    Xác nhận
                  </button>
                </form>
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
              <div class="col col-sm-9"></div>
              <div class="col col-sm-3">
              </div>
            </div>
          </div>
          <div v-if="showOrder[1].isOrdered" class="user-info-address">
            <div class="user-info-title">
              <h3>Đơn hàng đã giao của tôi</h3>
              <p>Quản lý thông tin đơn hàng đã giao</p>
              <hr />
            </div>
            <div class="row user-info-main user-info-address-content">
              <div class="col col-sm-9">Chưa có đơn hàng nào</div>
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
export default {
  data: () => ({
    items: [
      {
        action: "mdi-ticket",
        items: [
          { title: "Hồ sơ" },
          { title: "Địa chỉ" },
          { title: "Đổi mật khẩu" },
        ],
        title: "Tài khoản của tôi",
      },
      {
        action: "mdi-silverware-fork-knife",
        items: [{ title: "Đang giao" }, { title: "Đã giao" }],
        title: "Đơn mua",
      },
      {
        action: "mdi-school",
        title: "Thông báo",
      },
      {
        action: "mdi-run",
        items: [{ title: "List Item" }],
        title: "Family",
      },
    ],
    model: 1,
    lockSelectiontick : false,
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
  }),
  methods: {
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
        console.log(this.showOrder[0].isShow)
        this.showUser[0].isShow = false;
        this.showNotification = false;
      }
    },
    handleShowChildMenu(title) {
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
      }
      if (title === "Đã giao") {
        this.showOrder[1].isOrdered = !this.showOrder[1].isOrdered
        console.log(this.showOrder[1].isOrdered)
        this.showOrder[2].isProcessing = false;
      }
      
    },
  },
};
</script>
<style lang="scss" scoped>
body {
  background: coral;
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