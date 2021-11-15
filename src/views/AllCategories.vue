<template>
  <div data-aos="fade-up"
     data-aos-anchor-placement="center-bottom" class="container-fluid">
    <div class="section-allcategories">
      <v-breadcrumbs :items="items" class="pt-10" 
        >
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
                  :src="category.image"
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
    if(localStorage.getItem('info') !== null){
        this.$store.state.user.info = JSON.parse(localStorage.getItem('info'));
      }
    this.fetchAllCategories()
  },
  components:{
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
.section-allcategories {
  width: 70%;
  margin: auto;
  .all-categories {
    padding-bottom: 100px;
    display: flex;
    flex-wrap: wrap;
    .categories-item {
      padding: 30px 10px;
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
              height: 23vh;
              background-size: cover;
              background-repeat: no-repeat;
            }
          }
          .categories-item-content-name {
            h3 {
              padding-top: 20px;
              text-align: center;
              color: rgba(0, 0, 0, 0.8);
              font-size: 1.25rem;
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
