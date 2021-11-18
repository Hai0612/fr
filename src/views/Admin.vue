<template>
  <div>
    <div class="sidebar-container">
      <div class="sidebar-logo">E-commerce Web</div>
      <ul class="sidebar-navigation">
        <li class="header">Navigation</li>
        <li @click="showSetting('product')">
          <a href="#">
            <i class="fa fa-home" aria-hidden="true"></i> Product
          </a>
        </li>
        <li @click="showSetting('brand')">
          <a href="#"><i class="fas fa-code-branch" aria-hidden="true"></i> Brand </a>
        </li>
        <li @click="showSetting('category')">
          <a href="#">
            <i class="fas fa-folder-open" aria-hidden="true"></i>   Category
          </a>
        </li>
        <li @click="showSetting('order')">
          <a href="#"> <i class="fa fa-cog" aria-hidden="true"></i> Đơn hàng </a>
        </li>
        <li @click="showSetting('user')">
          <a href="#"> <i class="fa fa-users" aria-hidden="true"></i> Người sử dụng </a>
        </li>
        <li @click="showSetting('info')">
          <a href="#">
            <i class="fa fa-info-circle" aria-hidden="true"></i> Information
          </a>
        </li>
      </ul>
    </div>

    <div class="content-container">
      <div class="container-fluid">
        <!-- Main component for a primary marketing message or call to action -->

        <div v-if="showProduct" class="container table-responsive table-products py-5">
          <div class="section-title">
            <h3>Danh sách sản phẩm</h3>
            <button @click="newProduct = ! newProduct" class="btn btn-success">Thêm sản phẩm</button>
          </div>
          <!-- thêm sản phẩm -->
          <div v-if="newProduct" class="form-new" action="">
            <div class="form-cc">
              <div class="row-cc">
                <div class="cc-field">
                  <div class="cc-title"><h4>Thêm sản phẩm mới</h4></div>
                  <div class="row">
                    
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-4">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="newProductData.id"
                        disabled
                        placeholder="ID sản phẩm"
                      />
                    </div>
                    <div class="col col-sm-8">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="newProductData.name"
                        placeholder="Name"
                      />
                    </div>
                    
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    
                    <div class="col col-sm-2">
                      <select @change="chooseCategory($event)" class="input cc-ddl">
                        <option selected>
                          Danh mục <i class="fas fa-arrow-down"></i>
                        </option>
                        <option v-for="category,index in listCategories" v-bind:key="index">{{category.name_category}}</option>
                      </select>
                    </div>
                    <div class="col col-sm-2">
                     <select @change="chooseBrand($event)" class="input cc-ddl">
                         <option selected>
                          Nhãn hiệu <i class="fas fa-arrow-down"></i>
                        </option>
                        <option v-for="brand,index in listBrands" v-bind:key="index">{{brand.name_brand}}</option>
                      </select>
                    </div>
                    <div class="col col-sm-3">
                      <input
                        type="text"
                        class="input cc-txt"
                        placeholder="Giá"
                        v-model="newProductData.price"
                      />
                    </div>
                    <div class="col col-sm-5">
                      <input
                        type="text"
                        class="input cc-txt"
                        placeholder="Giảm giá"
                        v-model="newProductData.discount_id"
                      />
                    </div>
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-12"><textarea cols="15" rows="15" type="text" class="input cc-txt" placeholder="Mô tả" v-model="newProductData.description" /></div>
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-3"><button @click="addProduct()" class="btn btn-block btn-success">Lưu</button></div>
                  </div>
                </div>
              </div>

             
            </div>
        </div>

          <!-- Chỉnh sửa sản phẩm -->
            <div v-if="isEditProduct" class="form-new" action="">
            <div class="form-cc">
              <div class="row-cc">
                <div class="cc-field">
                  <div class="cc-title"><h4>Chỉnh sửa sản phẩm</h4></div>
                  <div class="row">
                    
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-4">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="productEdit.id"
                        disabled
                        placeholder="ID sản phẩm"
                      />
                    </div>
                    <div class="col col-sm-8">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="productEdit.name"
                        placeholder="Name"
                      />
                    </div>
                    
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    
                    <div class="col col-sm-2">
                      <select @change="editCategoryProduct($event)" class="input cc-ddl">
                        <option selected>
                          Danh mục <i class="fas fa-arrow-down"></i>
                        </option>
                        <option v-for="category,index in listCategories" v-bind:key="index">{{category.name_category}}</option>
                      </select>
                    </div>
                    <div class="col col-sm-2">
                     <select @change="editBrandProduct($event)" class="input cc-ddl">
                        <option selected>
                          Nhãn hiệu <i class="fas fa-arrow-down"></i>
                        </option>
                        <option v-for="brand,index in listBrands" v-bind:key="index">{{brand.name_brand}}</option>

                      
                      </select>
                    </div>
                    <div class="col col-sm-3">
                      <input
                        type="text"
                        class="input cc-txt"
                        placeholder="Giá"
                        v-model="productEdit.price"
                      />
                    </div>
                    <div class="col col-sm-5">
                      <input
                        type="text"
                        class="input cc-txt"
                        placeholder="Giảm giá"
                        v-model="productEdit.discount_id"
                      />
                    </div>
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-12"><textarea cols="15" type="text" class="input cc-txt" placeholder="Mô tả" v-model="productEdit.description" /></div>
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-3"><button @click="changeProduct()" class="btn btn-block btn-success">Lưu</button></div>
                  </div>
                </div>
              </div>

             
            </div>
        </div>

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
                   <button @click="deleteProduct(product.id)" class="btn btn-danger" href="#myModal" data-toggle="modal">
                    <i class="fas fa-trash"></i></button
                  ><button @click="openEditProduct(product.id)" class="btn btn-primary">
                    <i class="fas fa-edit"></i>
                  </button>
                  <!-- <div id="myModal" class="modal fade">
                    <div class="modal-dialog modal-confirm">
                      <div class="modal-content">
                        <div class="modal-body">
                          <p>Chưa có sản phẩm nào để thanh toán.</p>
                        </div>
                        <div class="modal-footer justify-content-center">
                          {{product.id}}
                          <button   type="button" class="btn btn-danger" data-dismiss="modal">Xác nhận</button>
                          <button type="button" class="btn btn-primary" data-dismiss="modal">Hủy</button>
                        </div>
                      </div>
                    </div>
                  </div>   -->


                 
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div v-if="showBrand" class="container table-responsive table-brands py-5">
          <div class="section-title">
            <h3>Danh sách nhãn hiệu</h3>
            <button @click="newBrand = ! newBrand" class="btn btn-success">Thêm nhãn hiệu</button>
          </div>
          <!-- thêm nhãn hiệu -->
           <div v-if="newBrand" class="form-new" action="">
            <div class="form-cc">
              <div class="row-cc">
                <div class="cc-field">
                  <div class="cc-title"><h4>Thêm nhãn hiệu mới</h4></div>
             
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-2">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="newBrandData.id_"
                        disabled
                        placeholder="ID nhãn hiệu phẩm"
                      />
                    </div>
                    <div class="col col-sm-7">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="newBrandData.name_brand"
                        placeholder="Tên nhãn hiệu"
                      />
                    </div>
                    <div class="col col-sm-3">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="newBrandData.image"
                        placeholder="Hình Ảnh"
                      />
                    </div>
                    
                  </div>
                </div>
              </div>

              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-12"><textarea cols="15" type="text" class="input cc-txt" placeholder="Mô tả nhãn hiệu" v-model="newBrandData.desc_brand" /></div>
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-3"><button @click="addBrand()" class="btn btn-block btn-success">Lưu</button></div>
                  </div>
                </div>
              </div>


             
            </div>
        </div>

            <!-- chỉnh sửa nhãn hiệu -->
            <div v-if="isEditBrand" class="form-new" action="">
            <div class="form-cc">
              <div class="row-cc">
                <div class="cc-field">
                  <div class="cc-title"><h4>Chỉnh sửa nhãn hiệu</h4></div>
             
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-2">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="brandEdit.id_"
                        placeholder="ID nhãn hiệu phẩm"
                      />
                    </div>
                    <div class="col col-sm-7">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="brandEdit.name_brand"
                        placeholder="Tên nhãn hiệu"
                      />
                    </div>
                    <div class="col col-sm-3">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="brandEdit.image"
                        placeholder="Hình Ảnh"
                      />
                    </div>
                    
                  </div>
                </div>
              </div>

              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-12"><textarea cols="15" type="text" class="input cc-txt" placeholder="Mô tả nhãn hiệu" v-model="brandEdit.desc_brand" /></div>
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-3"><button @click="changeBrand()" class="btn btn-block btn-success">Lưu</button></div>
                  </div>
                </div>
              </div>


             
            </div>
        </div>

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
                  <button @click="deleteBrand(brand.id_)" class="btn btn-danger">
                    <i class="fas fa-trash"></i></button
                  ><button  @click="openEditBrand(brand.id_)" class="btn btn-primary">
                    <i class="fas fa-edit"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div v-if="showCategory" class="container table-responsive table-categories py-5">
          <div class="section-title">
            <h3>Danh sách danh mục</h3>
            <button @click="newCategory = ! newCategory" class="btn btn-success">Thêm danh mục</button>
          </div>
          <!-- thêm danh mục -->
           <div v-if="newCategory" class="form-new" action="">
            <div class="form-cc">
              <div class="row-cc">
                <div class="cc-field">
                  <div class="cc-title"><h4>Thêm danh mục mới</h4></div>
             
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-2">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="newCategoryData.id_"
                        placeholder="ID danh mục"
                      />
                    </div>
                    <div class="col col-sm-7">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="newCategoryData.name_category"
                        placeholder="Tên danh mục"
                      />
                    </div>
                    <div class="col col-sm-3">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="newCategoryData.image"
                        placeholder="Hình Ảnh"
                      />
                    </div>
                    
                  </div>
                </div>
              </div>

              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-12"><textarea cols="15" type="text" class="input cc-txt" placeholder="Mô tả nhãn hiệu" v-model="newCategoryData.desc_category" /></div>
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-3"><button @click="addCategory()" class="btn btn-block btn-success">Lưu</button></div>
                  </div>
                </div>
              </div>

             
            </div>
        </div>

          <!-- chỉnh sửa danh mục -->
           <div v-if="isEditCategory" class="form-new" action="">
            <div class="form-cc">
              <div class="row-cc">
                <div class="cc-field">
                  <div class="cc-title"><h4>Chỉnh sửa danh mục</h4></div>
             
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-2">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="categoryEdit.id_"
                        placeholder="ID danh mục"
                      />
                    </div>
                    <div class="col col-sm-7">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="categoryEdit.name_category"
                        placeholder="Tên danh mục"
                      />
                    </div>
                    <div class="col col-sm-3">
                      <input
                        type="text"
                        class="input cc-txt"
                        v-model="categoryEdit.image"
                        placeholder="Hình Ảnh"
                      />
                    </div>
                    
                  </div>
                </div>
              </div>

              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-12"><textarea cols="15" type="text" class="input cc-txt" placeholder="Mô tả nhãn hiệu" v-model="categoryEdit.desc_category" /></div>
                  </div>
                </div>
              </div>
              <div class="row-cc">
                <div class="cc-field">
                  <div class="row">
                    <div class="col col-sm-3"><button  @click="changeCategory()" class="btn btn-block btn-success">Lưu</button></div>
                  </div>
                </div>
              </div>

             
            </div>
        </div>


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
                <th scope="row">{{ category.id_ }}</th>
                <td>{{ category.name_category }}</td>
                <td>{{ category.desc_category }}</td>
                <td>{{ category.image }}</td>
                <td>
                  <button @click="deleteCategory(category.id_)" class="btn btn-danger">
                    <i class="fas fa-trash"></i></button
                  ><button @click="openEditCategory(category.id_)" class="btn btn-primary">
                    <i class="fas fa-edit"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div v-if="showOrder" class="container table-responsive table-orders py-5">
          <div class="section-title">
            <h3>Danh sách đơn đặt hàng</h3>
          </div>
          <table class="table table-bordered table-hover">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Id</th>
                <th scope="col">ID Người dùng</th>
                <th scope="col">Ngày Đặt</th>
                <th scope="col">Địa Chỉ</th>
                <th scope="col">Tổng giá</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(order, index) in listOrders" v-bind:key="index">
                <th scope="row">{{ order.id }}</th>
                <td>{{ order.id_user }}</td>
                <td>{{ order.orderDate }}</td>
                <td>{{ order.orderAddress }}</td>
                <td>{{ order.totalAmount }}</td>
             
              </tr>
            </tbody>
          </table>
        </div>
        <div v-if="showUser" class="container table-responsive table-user py-5">
          <div class="section-title">
            <h3>Danh sách người dùng</h3>
          </div>
          <table class="table table-bordered table-hover">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Id</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Ngày sinh</th>
                <th scope="col">Email</th>
                <th scope="col">Số điện thoại</th>
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
      isEditProduct  : 0,
      isEditBrand  : 0,
      isEditCategory  : 0,
      
      productEdit: {},
      categoryEdit: {},
      brandEdit: {},

      newProductData : {},
      newBrandData : {},
      newCategoryData : {},
      showCategory : false,
      showOrder : false,
      showBrand : false,
      showUser : false,
      showProduct : true,
      listProducts: [],
      listCategories: [],
      listBrands: [],
      listOrders : [],
      listUsers : [],
      newProduct : false,
      newBrand: false,
      newCategory : false,
    };
  },
  methods: {
    chooseCategory(event){
      this.newProductData.category = event.target.value;
    },
    chooseBrand(event){
      this.newProductData.brand = event.target.value;
    },
    showSetting(message){
      if(message === 'product'){
        this.showProduct = true;
        this.showCategory = false;
        this.showBrand = false;
        this.showUser = false;
        this.showOrder = false;
      }else if(message === 'order'){
        this.showProduct = false;
        this.showCategory = false;
        this.showBrand = false;
        this.showUser = false;
        this.showOrder = true;
      }else if(message === 'user'){
        this.showProduct = false;
        this.showCategory = false;
        this.showBrand = false;
        this.showUser = true;
        this.showOrder = false;
      }else if(message === 'brand'){
        this.showProduct = false;
        this.showCategory = false;
        this.showBrand = true;
        this.showUser = false;
        this.showOrder = false;
      }else if(message === 'category'){
        this.showProduct = false;
        this.showCategory = true;
        this.showBrand = false;
        this.showUser = false;
        this.showOrder = false;
      }
    },
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
        }
      });
    },
    async addProduct(){
      let self = this;
      console.log(self.newProductData.id)

      axios({
        method: "post",
        data: {
          // id : self.newProductData.id,
          name : self.newProductData.name ,
          description : self.newProductData.description,
          price : self.newProductData.price,
          brand : self.newProductData.brand,
          category : self.newProductData.category,
          discount_id: self.newProductData.discount_id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=addProduct",
      }).then((response) => {
          if(response.data.status == 200){
            self.newProduct = ! self.newProduct
            self.newProductData = {},
            self.getAllProducts();
          }
      });
    },
    async addBrand(){
      let self = this;
       axios({
        method: "post",
        data: {
          name_brand : self.newBrandData.name_brand ,
          desc_brand : self.newBrandData.desc_brand,
          image : self.newBrandData.image,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=brand&action=addbrand",
      }).then((response) => {
          if(response.data.status == 200){
            self.newBrand = ! self.newBrand;
            self.getAllBrands();
          }
        });
    },
    async addCategory(){
      let self = this;
       axios({
        method: "post",
        data: {
          name_category : self.newCategoryData.name_category ,
          desc_category : self.newCategoryData.desc_category,
          image : self.newCategoryData.image,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=category&action=addCategory",
      }).then((response) => {
          if(response.data.status == 200){
            self.newCategory = ! self.newCategory;
            self.getAllCategories();
          }
        });
    },
    async deleteCategory(id){
      console.log(id)
       let self = this;
       axios({
        method: "post",
        data: {
          id_ : id
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=category&action=deleteCategory",
      }).then((response) => {
          if(response.data.status == 200){
            self.getAllCategories();
          }
        });
    },
    async deleteBrand(id){
      console.log(id)
       let self = this;
       axios({
        method: "post",
        data: {
          id_ : id
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=brand&action=deleteBrand",
      }).then((response) => {
          if(response.data.status == 200){
            self.getAllBrands();
          }
        });
    },
    async deleteProduct(id){
      console.log(id)
       let self = this;
       axios({
        method: "post",
        data: {
          id : id
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=deleteProductById",
      }).then((response) => {
          if(response.data.status == 200){
            self.getAllProducts();
          }
        });
    },
    async openEditProduct(id){
        this.isEditProduct = id;
        this.listProducts.forEach(product => {
          if(product.id == id){
            this.productEdit = product;
          }
        });
   
    },
    async openEditBrand(id){
      console.log(id)
        this.isEditBrand = id;
        this.listBrands.forEach(brand => {
          if(brand.id_ == id){
            this.brandEdit = brand;
          }
        });
   
    },
    async openEditCategory(id){
        this.isEditCategory = id;
        this.listCategories.forEach(category => {
          if(category.id_ == id){
            this.categoryEdit = category;
          }
        });
   
    },
    async changeProduct(){
      
       let self = this;
       axios({
        method: "post",
        data: {
          id : self.productEdit.id,
          name : self.productEdit.name,
          description : self.productEdit.description,
          price : self.productEdit.price,
          discount_id : self.productEdit.discount_id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=editProduct",
      }).then((response) => {
          if(response.data.status == 200){
            self.productEdit = {},
            self.isEditProduct = 0;
            self.getAllProducts();
          }
        });
    },
    async changeBrand(){
      
       let self = this;
       axios({
        method: "post",
        data: {
          id_ : self.brandEdit.id_,
          name_brand : self.brandEdit.name_brand,
          desc_brand : self.brandEdit.desc_brand,
          image : self.brandEdit.image,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=brand&action=editBrand",
      }).then((response) => {
          if(response.data.status == 200){
            self.brandEdit = {},
            self.isEditBrand = 0;
            self.getAllBrands();
          }
        });
    },
    async changeCategory(){
       let self = this;
       console.log()
       axios({
        method: "post",
        data: {
          id_ : self.categoryEdit.id_,
          name_category : self.categoryEdit.name_category,
          desc_category : self.categoryEdit.desc_category,
          image : self.categoryEdit.image,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=category&action=editCategory",
      }).then((response) => {
          if(response.data.status == 200){
            self.categoryEdit = {},
            self.isEditCategory = 0;
            self.getAllCategories();
          }
        });
    },
    
    
  },
  created() {
    if(this.$store.state.user.info.first_name !== 'admin'){
        this.$router.push({ name : 'Login'});
    }
    else{
      this.getAllProducts();
      this.getAllBrands();
      this.getAllOrders();
      this.getAllUsers();
      this.getAllCategories();
    }
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
         white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
    }
  }
  button {
    margin-right: 10px;
  }
}
//form
.form-new{
  width: 50%;
  margin: auto;
  .form-cc {
  display: table;
  width: 100%;
  text-align: left;
  padding: 0px 0px 30px 30px;
}
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
  height: 40px;
  padding-left: 15px;
  font-weight: 600;
  font-size: 11pt;
  color: #5e6977;
}
input[type="text"] {
  display: initial;
  padding: 15px;
}
textarea{
  height: 80px !important;
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
  .table-responsive{
    .section-title{
      padding-bottom: 30px;
      display: flex;
      button{
        margin-left: 50%;
      }
    }
  }
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