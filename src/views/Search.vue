<template>
  <div class="container-fluid">
    <div class="categories-preview">
      <div class="categories-preview-content">
        <h2>Sản phẩm của chúng tôi</h2>
        <div class="categories-preview-extend">
          <span><i class="fas fa-square"></i> </span>
          <router-link to="/contact"
            >Contact Me
          </router-link>
        </div>
      </div>
    </div>
    <div class="container-category">
      <div class="categories-content">
        <div class="row">
          <div class="col col-sm-3 categories-filter">

             <v-card
              class="mx-auto"
              max-width="400"
            >
              <v-list>
                <v-list-item-group
                  active-class="border"
                  v-model="selectedItem"
                  color="indigo"
                >
                <v-subheader class="list-group-title" @click="hideCategory()">Danh Mục</v-subheader>
                 <template v-if="!isShowCategory">
                  <v-list-item
                    v-for="(item, i) in listCategories"
                    :key="i"
                  >
                    <v-list-item-icon>
                      <v-icon v-text="item.icon"></v-icon>
                    </v-list-item-icon>

                    <v-list-item-content @click="showByCategory(item.text)">
                      <v-list-item-title v-text="item.text"></v-list-item-title>
                    </v-list-item-content>
                  </v-list-item>
                 </template>
                </v-list-item-group>
              </v-list>
            </v-card>

            <v-card
              class="mx-auto"
              max-width="400"
            >
              <v-list>
                <v-list-item-group
                  active-class="border"
                  color="indigo"
                >
                <v-subheader class="list-group-title" @click="hidePrice()">Giá</v-subheader>
                  <template v-if="!isShowPrice">
                  <v-list-item

                    v-for="(item, i) in listPrices"
                    :key="i+5"
                  >
                    <v-list-item-icon>
                      <v-icon v-text="item.icon"></v-icon>
                    </v-list-item-icon>

                    <v-list-item-content @click="showByPrice(item.text)">
                      <v-list-item-title v-text="item.text"></v-list-item-title>
                    </v-list-item-content>
                  </v-list-item>
                  </template>
                </v-list-item-group>
              </v-list>
              
            </v-card>

          <v-card
              class="mx-auto"
              max-width="400"
            >
              <v-list>
                <v-list-item-group
                  active-class="border"
                  color="indigo"
                >
                <v-subheader class="list-group-title" @click="hideBrand()">Nhãn hiệu</v-subheader>

                  <template v-if="!isShowBrand">
                    <v-list-item
                    v-for="(item, i) in listBrands"
                    :key="i+5"
                  >
                    <v-list-item-icon>
                      <v-icon v-text="item.icon"></v-icon>
                    </v-list-item-icon>

                    <v-list-item-content @click="showByBrand(item.text)">
                      <v-list-item-title v-text="item.text"></v-list-item-title>
                    </v-list-item-content>
                  </v-list-item>
                  </template>
                </v-list-item-group>
              </v-list>
              
            </v-card>

            <v-card
              class="mx-auto"
              max-width="400"
            >
              <v-list>
                <v-list-item-group
                  
                  color="indigo"
                >
                <v-subheader class="list-group-title" @click="hideStatus()">Tình trạng</v-subheader>
                  <template v-if="!isShowStatus">
                  <v-list-item

                    v-for="(item, i) in listStates"
                    :key="i+5"
                  >
                    <v-list-item-icon class="v-list-item__icon">
                      <v-icon v-text="item.icon"></v-icon>
                    </v-list-item-icon>

                    <v-list-item-content @click="showByState(item.text)">
                      <v-list-item-title v-text="item.text"></v-list-item-title>
                    </v-list-item-content>
                  </v-list-item>
                  </template>
                </v-list-item-group>
              </v-list>
              
            </v-card>
          </div>
          <div class="col col-sm-9 categories-items">
            <ProductCategory :listProducts="listProducts" />
            <!-- <div class="row">
                  <div v-for="(book, index) in listBooks" class="col col-sm-4" v-bind:key="index">
                     <Product/>
                  </div>
                </div> -->
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
      listProducts: {},
      listCategories: [
        {
          icon: 'mdi-assistant',
          text: 'Trouser',
        },
        {
          icon: 'mdi-assistant',
          text: 'Hat',
        },
        {
          icon: 'mdi-assistant',
          text: 'Socks',
        },
        {
          icon: 'mdi-assistant',
          text: 'Shirt',
        },
        {
          icon: 'mdi-assistant',
          text: 'T-shirt',
        },
      ],
        listBrands: [
        {
          icon: 'mdi-source-branch',
          text: 'Adidas',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Nike',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Louis Vuitton',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Dolce&Gabanna',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Louis Vuitton',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Gucci',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Zara',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Chanel',
        },
      ],
      listPrices: [
        {
          icon: 'mdi-alert-circle',
          text: "0 - 500.000",
        },
        {
          icon: 'mdi-alert-circle',
          text: "Từ 500.000 - 1 triệu",
        },
        {
          icon: 'mdi-cart',
          text: "Từ 1 - 5 triệu",
        },
        {
          icon: 'mdi-cart',
          text: "Từ 5 - 10 triệu",
        },
        {
          icon: 'mdi-cart',
          text: "Trên 10 triệu",
        },
      ],
      listStates: [
        {
          icon: 'mdi-source-branch',
          text: "Sản phẩm mới",
        },
        {
          icon: 'mdi-wifi',
          text: "Sản phẩm cũ",
        },
      ],
      selectedItem : null,

      isShowBrand: false,
      isShowCategory: false,
      isShowPrice: false,
      isShowStatus: false,

      model: ["Carrots"],
      sortCategory: "",
      sortPrice: "",
      sortBrand: "",
      sortState: "",
      text : null,
    };
  },
  watch:{
    '$route.params.category': function(){
      if(localStorage.getItem('info') !== null){
        this.$store.state.user.info = JSON.parse(localStorage.getItem('info'));
      }


    this.fetchProductByCategory();
    this.getAllBrands();
    this.getAllCategories();
    this.listCategories.forEach((category,index) =>{
      if(category.text.toUpperCase() == this.$route.params.category.toUpperCase()){
        this.selectedItem = index;
      }
    });
    },
    '$route' (to, from) {
      console.log(to)
      console.log(from)
    this.searchMachine();
    }
  },
  methods: {
    
    showByCategory(category) {
      if(this.sortCategory == category){
        this.sortCategory = '';
      }else{
        this.sortCategory = category;
      }
      this.sortByOption();

    },
    showByBrand(brand) {
      if(this.sortBrand == brand){
        this.sortBrand = '';
      }else{
        this.sortBrand = brand;
      }
      this.sortByOption();
    },
    showByPrice(price) {
      if(this.sortPrice == price){
        this.sortPrice = '';
      }else{
        this.sortPrice = price;
      }
      this.sortByOption();
     
    },
    showByState(state) {
      this.sortState = state;
      this.text = 'hello';
      this.sortByOption();
    },
    async getAllBrands() {
      let self = this;
        await axios({
        method: "get",
        url: "https://localhost/ecommerce_backend/index.php?controller=brand&action=fetchAll",
      }).then((response) => {
        if (response.data.status) {
          self.listBrands = [];

          for(let i = 0 ; i < response.data.payload.length; i++){
            self.listBrands.push({
              icon: 'mdi-source-branch',
              text : response.data.payload[i].name_brand
            });
          }
        }
      });
    },
    searchMachine(){
        
      let self = this;
        axios({
          method: "post",
          data: {
            searchText : self.$route.params.text
          },
          url: "https://localhost/ecommerce_backend/index.php?controller=product&action=searchMachine",
        }).then((response) => {
          if(response.data.status == 200){
            self.listProducts = response.data.payload
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
          self.listCategories = [];
         for(let i = 0 ; i < response.data.payload.length; i++){
            self.listCategories.push({
              icon: 'mdi-source-branch',
              text : response.data.payload[i].name_category
            });
          }
        }
      });
    },
    fetchProductByCategory() {
      let self = this;
      this.sortCategory = this.$route.params.category;
      const productLine = this.$route.params.category;
      axios({
        method: "post",
        data: {
          category: productLine,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=getByCategory&category=".concat(
          productLine
        ),
      }).then((response) => {
        console.log(response.data.payload)
        self.listProducts = response.data.payload;
        self.listCategories.forEach((category,index) =>{
            if(category.text.toUpperCase() == this.$route.params.category.toUpperCase()){
              this.selectedItem = index;
            }
        });
      });
    },
    sortByOption() {
      let self = this;
      axios({
        method: "post",
        data: {
           category: self.sortCategory,
           brand: self.sortBrand,
           price : self.sortPrice,
           state: self.sortState
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=category&action=getByOption",
      }).then((response) => {
        if (response.data.status == 200) {
          self.listProducts = response.data.payload;
          console.log(response.data)
        }
      });
    },
    hideCategory(){
      this.isShowCategory = !this.isShowCategory;
      this.fetchProductByCategory();
    },
    hideBrand(){
      this.isShowBrand = !this.isShowBrand;
      this.sortBrand = ''
      this.fetchProductByCategory()
    },
    hidePrice(){
      this.isShowPrice = !this.isShowPrice;
      this.sortPrice = ''
      this.fetchProductByCategory()
    },
    hideStatus(){
      this.isShowStatus = !this.isShowStatus;
      this.sortState = ''
      this.fetchProductByCategory()
    }
  },

  components: {
    ProductCategory,
  },
  created() {
    if(localStorage.getItem('info') !== null){
        this.$store.state.user.info = JSON.parse(localStorage.getItem('info'));
      }
    this.getAllBrands();
    this.getAllCategories();
    this.fetchProductByCategory();
    this.searchMachine();

    // this.listCategories.forEach((category,index) =>{
    //   if(category.text.toUpperCase() == this.$route.params.category.toUpperCase()){
    //     this.selectedItem = index;
    //   }
    // });
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
.container-fluid {
  padding: 0;
  min-height: 100vh;
  background: linear-gradient(to right top, #fce1b5, #f5e4c8);
}
.container-category{
  width: 70%;
  margin: auto;

}
.categories-preview {
  background: linear-gradient(to bottom, white, #16d1e0);
  color: Black;
  padding: 100px;
  padding-bottom: 100px;
  padding-left: 300px;
  .categories-preview-content {
    h2 {
      color: #ff0000;
      font-size: 56px;
      font-weight: 800;
      letter-spacing: 3px;
      span {
        color: red;
      }
    }
    .categories-preview-extend {
      font-size: 25px;
      span {
        margin-right: 5px;
        color: red;
      }
      a {
        text-decoration: none;
        color: black; 
        i {
          transition: all 0.5s ease;
          color: red;
        }
      }
      a:hover {
        i {
          margin-left: 10px;
        }
      }
    }
  }
}
.categories-content {
  padding: 100px 0px;
  .categories-filter {
  }
  .categories-items {
    padding-right: 100px;
    .row {
      .col {
      }
    }
  }
}
.list-group-title{
  cursor: pointer;
  color: #c1441b !important;
  font-weight: 700;
  text-align: center;
}
.list-group-title:hover{
  background-color: #00d4ff;
}
</style>