<template>
  <div class="container-fluid">
    <div class="categories-preview">
      <div class="categories-preview-content">
        <h2>Accessories</h2>
        <div class="categories-preview-extend">
          <span><i class="fas fa-square"></i> </span>
          <router-link to="/contact"
            >Contact Me
            <i class="fas fa-chevron-circle-right"></i>
          </router-link>
        </div>
      </div>
    </div>
    <div class="container-category">
      <div class="categories-content">
        <div class="row">
          <div class="col col-sm-3 categories-filter">

            <v-card class="mx-auto" max-width="500">
              <v-list-group no-action sub-group>
                <template v-slot:activator>
                  <v-list-item-content>
                    <v-list-item-title>Danh mục</v-list-item-title>
                  </v-list-item-content>
                </template>
                <v-list-item-group v-model="model">
                  <template v-for="(item, i) in listCategorys">
                    <v-divider v-if="!item" :key="`divider-${i}`"></v-divider>

                    <v-list-item
                      @click="showByCategory(item)"
                      v-else
                      :key="`item-${i}`"
                      :value="item"
                      active-class="deep-purple--text text--accent-4"
                    >
                      <template v-slot:default="{ active }">
                        <v-list-item-content :style="{
                              'padding-left':'15%'
                            }">
                          <v-list-item-title v-text="item"> </v-list-item-title>
                        </v-list-item-content>

                        <v-list-item-action>
                          <v-checkbox
                            :input-value="active"
                            color="deep-purple accent-4"
                          ></v-checkbox>
                        </v-list-item-action>
                      </template>
                    </v-list-item>
                  </template>
                </v-list-item-group>
              </v-list-group>
            </v-card>

            <v-card class="mx-auto" max-width="500">
              <v-list-group no-action sub-group>
                <template v-slot:activator>
                  <v-list-item-content>
                    <v-list-item-title>Nhãn hiệu</v-list-item-title>
                  </v-list-item-content>
                </template>
                <v-list-item-group v-model="model">
                  <template v-for="(item, i) in listBrands">
                    <v-divider v-if="!item" :key="`divider1-${i}`"></v-divider>

                    <v-list-item
                      @click="showByBrand(item)"
                      v-else
                      :key="`item1-${i}`"
                      :value="item"
                      active-class="deep-purple--text text--accent-4"
                    >
                      <template v-slot:default="{ yes }">
                        <v-list-item-content :style="{
                              'padding-left':'15%'
                            }">
                          <v-list-item-title v-text="item"></v-list-item-title>
                        </v-list-item-content>

                        <v-list-item-action>
                          <v-checkbox
                            :input-value="yes"
                            color="deep-purple accent-4"
                          ></v-checkbox>
                        </v-list-item-action>
                      </template>
                    </v-list-item>
                  </template>
                </v-list-item-group>
              </v-list-group>
            </v-card>

            <v-card class="mx-auto" max-width="500">
              <v-list-group no-action sub-group>
                <template v-slot:activator>
                  <v-list-item-content>
                    <v-list-item-title>Giá</v-list-item-title>
                  </v-list-item-content>
                </template>
                <v-list-item-group v-model="model">
                  <template v-for="(item, i) in listPrices">
                    <v-divider v-if="!item" :key="`divider-${i}`"></v-divider>

                    <v-list-item
                      @click="showByPrice(item)"
                      v-else
                      :key="`item-${i}`"
                      :value="item"
                      active-class="deep-purple--text text--accent-4"
                    >
                      <template v-slot:default="{ active }">
                        <v-list-item-content :style="{
                              'padding-left':'15%'
                            }">
                          <v-list-item-title v-text="item"></v-list-item-title>
                        </v-list-item-content>

                        <v-list-item-action>
                          <v-checkbox
                            :input-value="active"
                            color="deep-purple accent-4"
                          ></v-checkbox>
                        </v-list-item-action>
                      </template>
                    </v-list-item>
                  </template>
                </v-list-item-group>
              </v-list-group>
            </v-card>

            <v-card class="mx-auto" max-width="500">
              <v-list-group no-action sub-group>
                <template v-slot:activator>
                  <v-list-item-content>
                    <v-list-item-title>Tình trạng</v-list-item-title>
                  </v-list-item-content>
                </template>
                <v-list-item-group v-model="model">
                  <template v-for="(item, i) in listStates">
                    <v-divider v-if="!item" :key="`divider-${i}`"></v-divider>

                    <v-list-item
                      @click="showByState(item)"
                      v-else
                      :key="`item-${i}`"
                      :value="item"
                      active-class="deep-purple--text text--accent-4"
                    >
                      <template v-slot:default="{ active }">
                        <v-list-item-content :style="{
                              'padding-left':'15%'
                            }">
                          <v-list-item-title v-text="item"></v-list-item-title>
                        </v-list-item-content>

                        <v-list-item-action>
                          <v-checkbox
                            :input-value="active"
                            color="deep-purple accent-4"
                          ></v-checkbox>
                        </v-list-item-action>
                      </template>
                    </v-list-item>
                  </template>
                </v-list-item-group>
              </v-list-group>
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
      listCategorys: ["Trouser", "Hat", "", "Socks", "Shirt", "T-shirt"],
      listBrands: ["Adidas", "Nike", "Louis Vuitton", "Dolce&Gabanna", "Gucci","Zara", "Chanel"],
      listPrices: [
        "0 - 500.000",
        "Dưới 1 triệu",
        "Từ 1 - 5 triệu",
        "Từ 5 - 10 triệu",
        "Trên 10 triệu",
      ],
      listStates: ["Sản phẩm mới", "Sản phẩm cũ"],

      model: ["Carrots"],
      sortCategory: "",
      sortPrice: "",
      sortBrand: "",
      sortState: "",
      text : null,
    };
  },
  methods: {
    
    showByCategory(category) {
      this.sortCategory = category;
      this.sortByOption();

    },
    showByBrand(brand) {
      this.sortBrand = brand;
      this.sortByOption();
    },
    showByPrice(price) {
      this.sortPrice = price;
      this.sortByOption();
    },
    showByState(state) {
      this.sortState = state;
      this.text = 'hello';
      this.sortByOption();
    },
    fetchProductByCategory() {
      let self = this;
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
        self.listProducts = response.data.payload;
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
  },

  components: {
    ProductCategory,
  },
  created() {
    this.fetchProductByCategory();
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
  background-image: url("../assets/images/Contact-me.png");
  color: Black;
  padding: 150px;
  padding-bottom: 150px;
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
</style>