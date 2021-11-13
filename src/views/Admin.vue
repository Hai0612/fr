<template>
  <div>
    <div class="sidebar-container">
      <div class="sidebar-logo">Project Name</div>
      <ul class="sidebar-navigation">
        <li class="header">Navigation</li>
        <li @click="showBrand()">
          <a href="#">
            <i class="fa fa-home" aria-hidden="true"></i> Product
          </a>
        </li>
        <li @click="showBrand()">
          <a href="#"><i class="fas fa-code-branch" aria-hidden="true"></i> Brand </a>
        </li>
        <li @click="showBrand()">
          <a href="#">
            <i class="fas fa-folder-open" aria-hidden="true"></i>   Category
          </a>
        </li>
        <li @click="showBrand()">
          <a href="#"> <i class="fa fa-cog" aria-hidden="true"></i> Đơn hàng </a>
        </li>
        <li @click="showBrand()">
          <a href="#"> <i class="fa fa-users" aria-hidden="true"></i> Người sử dụng </a>
        </li>
        <li @click="showBrand()">
          <a href="#">
            <i class="fa fa-info-circle" aria-hidden="true"></i> Information
          </a>
        </li>
      </ul>
    </div>

    <div class="content-container">
      <div class="container-fluid">
        <!-- Main component for a primary marketing message or call to action -->

        <div v-if="true" class="container table-responsive table-products py-5">
          <h3>Danh sách sản phẩm</h3>
          <table class="table table-bordered table-hover">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Description</th>
                <th scope="col">Giá</th>
                <th scope="col">Giảm giá</th>
                <th scope="col" style="width: 10%"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(product, index) in listProducts" v-bind:key="index">
                <th scope="row">{{ product.id }}</th>
                <td>{{ product.name }}</td>
                <td>{{ product.description }}</td>
                <td>{{ product.price }}</td>
                <td>{{ product.discount_id }}</td>
                <td>
                  <button class="btn btn-danger">
                    <i class="fas fa-trash"></i></button
                  ><button class="btn btn-primary">
                    <i class="fas fa-edit"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="container table-responsive table-brands py-5">
          <h3>Danh sách nhãn hiệu</h3>
          <table class="table table-bordered table-hover">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Description</th>
                <th scope="col">Hình Ảnh</th>
                <th scope="col" style="width: 10%"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(brand, index) in listBrands" v-bind:key="index">
                <th scope="row">{{ brand.id_ }}</th>
                <td>{{ brand.name_brand }}</td>
                <td>{{ brand.desc_brand }}</td>
                <td>{{ brand.image }}</td>
                <td>
                  <button class="btn btn-danger">
                    <i class="fas fa-trash"></i></button
                  ><button class="btn btn-primary">
                    <i class="fas fa-edit"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="container table-responsive table-categories py-5">
          <h3>Danh sách danh mục</h3>
          <table class="table table-bordered table-hover">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Description</th>
                <th scope="col">Hình Ảnh</th>
                <th scope="col" style="width: 10%"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(category, index) in listCategories" v-bind:key="index">
                <th scope="row">{{ category.id }}</th>
                <td>{{ category.name_category }}</td>
                <td>{{ category.desc_category }}</td>
                <td>{{ category.image }}</td>
                <td>
                  <button class="btn btn-danger">
                    <i class="fas fa-trash"></i></button
                  ><button class="btn btn-primary">
                    <i class="fas fa-edit"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="container table-responsive table-orders py-5">
          <h3>Danh sách đơn đặt hàng</h3>
          <table class="table table-bordered table-hover">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Id</th>
                <th scope="col">ID Người dùng</th>
                <th scope="col">Ngày Đặt</th>
                <th scope="col">Địa Chỉ</th>
                <th scope="col">Tổng giá</th>
                <th scope="col" style="width: 10%"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(order, index) in listOrders" v-bind:key="index">
                <th scope="row">{{ order.id }}</th>
                <td>{{ order.id_user }}</td>
                <td>{{ order.orderDate }}</td>
                <td>{{ order.orderAddress }}</td>
                <td>{{ order.totalAmount }}</td>
                <td>
                  <button class="btn btn-danger">
                    <i class="fas fa-trash"></i></button
                  ><button class="btn btn-primary">
                    <i class="fas fa-edit"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="container table-responsive table-user py-5">
          <h3>Danh sách người dùng</h3>
          <table class="table table-bordered table-hover">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Id</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Ngày sinh</th>
                <th scope="col">Email</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col" style="width: 10%"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(user, index) in listUsers" v-bind:key="index">
                <th scope="row">{{ user.id }}</th>
                <td>{{ user.first_name }}</td>
                <td>{{ user.last_name }}</td>
                <td>{{ user.date }}</td>
                <td>{{ user.email }}</td>
                <td>{{ user.phone }}</td>
                <td>
                  <button class="btn btn-danger">
                    <i class="fas fa-trash"></i></button
                  ><button class="btn btn-primary">
                    <i class="fas fa-edit"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      listProducts: [],
      listCategories: [],
      listBrands: [],
      listOrders : [],
      listUsers : []
    };
  },
  methods: {
    async getAllProducts() {
      let self = this;
      await axios({
        method: "get",
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=getAll",
      }).then((response) => {
        if (response.data.status) {
          self.listProducts = response.data.payload;
          console.log(response.data.payload);
        }
      });
    },
    async getAllBrands() {
      let self = this;
      await axios({
        method: "get",
        url: "https://localhost/ecommerce_backend/index.php?controller=brand&action=fetchAll",
      }).then((response) => {
        if (response.data.status) {
          self.listBrands = response.data.payload;
          console.log(response.data.payload);
        }
      });
    },
    async getAllCategories() {
      let self = this;
      await axios({
        method: "get",
        url: "https://localhost/ecommerce_backend/index.php?controller=category&action=fetchAll",
      }).then((response) => {
        if (response.data.status) {
          self.listCategories = response.data.payload;
          console.log(response.data.payload);
        }
      });
    },
    async getAllOrders() {
      let self = this;
      await axios({
        method: "get",
        url: "https://localhost/ecommerce_backend/index.php?controller=order&action=fetchAll",
      }).then((response) => {
        if (response.data.status) {
          self.listOrders = response.data.payload;
          console.log(response.data.payload);
        }
      });
    },
    async getAllUsers() {
      let self = this;
      await axios({
        method: "get",
        url: "https://localhost/ecommerce_backend/index.php?controller=user&action=fetchAll",
      }).then((response) => {
        if (response.data.status) {
          self.listUsers = response.data.payload;
          console.log(response.data.payload);
        }
      });
    },
  },
  created() {
    this.getAllProducts();
    this.getAllBrands();
    this.getAllOrders();
    this.getAllUsers();
    this.getAllCategories();
  },
};
</script>

<style lang="scss" scoped>
a {
  text-decoration: none;
}
i{
  width: 15%;
  margin-right: 10px;
}
table {
  tr {
    th,
    td {
      vertical-align: middle;
    }
  }
  thead {
    tr {
      th {
      }
    }
  }
  tbody {
    tr {
      td {
      }
    }
  }
  button {
    margin-right: 10px;
  }
}

.sidebar-container {
  position: fixed;
  width: 220px;
  height: 100%;
  left: 0;
  overflow-x: hidden;
  overflow-y: auto;
  background: #1a1a1a;
  color: #fff;
}

.content-container {
  padding-top: 20px;
}

.sidebar-logo {
  padding: 10px 15px 10px 30px;
  font-size: 20px;
  background-color: #2574a9;
}

.sidebar-navigation {
  padding: 0;
  margin: 0;
  list-style-type: none;
  position: relative;
}

.sidebar-navigation li {
  background-color: transparent;
  position: relative;
  display: inline-block;
  width: 100%;
  line-height: 20px;
}

.sidebar-navigation li a {
  padding: 10px 15px 10px 30px;
  display: block;
  color: #fff;
}

.sidebar-navigation li .fa {
  margin-right: 10px;
}

.sidebar-navigation li a:active,
.sidebar-navigation li a:hover,
.sidebar-navigation li a:focus {
  text-decoration: none;
  outline: none;
}

.sidebar-navigation li::before {
  background-color: #2574a9;
  position: absolute;
  content: "";
  height: 100%;
  left: 0;
  top: 0;
  -webkit-transition: width 0.2s ease-in;
  transition: width 0.2s ease-in;
  width: 3px;
  z-index: -1;
}

.sidebar-navigation li:hover::before {
  width: 100%;
}

.sidebar-navigation .header {
  font-size: 12px;
  text-transform: uppercase;
  background-color: #151515;
  padding: 10px 15px 10px 30px;
}

.sidebar-navigation .header::before {
  background-color: transparent;
}

.content-container {
  padding-left: 220px;
}
</style>