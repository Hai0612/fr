<template>
  <div class="tes">
    <div class="container">
      <v-breadcrumbs :items="items">
        <template v-slot:divider>
          <v-icon>mdi-forward</v-icon>
        </template>
      </v-breadcrumbs>
      <div class="all-categories">
        <div v-for="category, index in listCategories" v-bind:key="index" class="categories-item">
          <router-link
            :to="{ name: 'ShowCategory', params: { category: category.name_category } }"
          >
            <div class="categories-item-content">
              <div class="categories-item-content-img">
                <img
                  src="https://cf.shopee.vn/file/18fd9d878ad946db2f1bf4e33760c86f_tn"
                  alt=""
                />
              </div>
              <div class="categories-item-content-name">
                <h3>{{ category.name_category}}</h3>
              </div>
            </div>
          </router-link>
        </div>
      
      </div>
    </div>
  </div>
</template>
<script>
import axios from 'axios';
export default {
  data: () => ({
    items: [
      {
        text: "Dashboard",
        disabled: false,
        href: "home",
      },

      {
        text: "Danh mục",
        disabled: false,
        href: "category",
      },
    ],
    listCategories : {},
  }),
  methods:{
    fetchAllCategories() {
      let self = this;
      const id = this.$route.params.id;
      axios({
        method: "post",
        data: {
          id: id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=category&action=fetchAll",
      }).then((response) => {
        self.listCategories = response.data.payload;
      });
    },
  },
  created(){
    this.fetchAllCategories()
  }
};
</script>
<style lang="scss" scoped>
.tes {
  background: rgb(235, 232, 232);
}
.container {
  width: 60%;
  .all-categories {
    display: flex;
    flex-wrap: wrap;
    .categories-item {
      border-right: 1px solid rgba(0, 0, 0, 0.15);
      border-left: 1px solid rgba(0, 0, 0, 0.15);
      border-bottom: 1px solid rgba(0, 0, 0, 0.25);
      background-color: #fdfdfd;

      width: 25%;
      a {
        text-decoration: none;
        display: block;
        .categories-item-content {
          .categories-item-content-img {
            img {
              width: 100%;
              background-size: cover;
              background-repeat: no-repeat;
            }
          }
          .categories-item-content-name {
            h3 {
              text-align: center;
              color: rgba(0, 0, 0, 0.8);
              font-size: 0.875rem;
              line-height: 1.25rem;
              margin: 0 auto;
              display: -webkit-box;
              -webkit-box-orient: vertical;
              -webkit-line-clamp: 2;
              overflow: hidden;
              max-height: 2.5 rem;
            }
          }
        }
      }
    }
  }
}
</style>