<template>
  <div>
    <div class="container-fluid">
    <div class="detail-section">
      <div
        data-aos="fade-up"
        data-aos-anchor-placement="center-bottom"
        class="detail-products"
      >
        <div class="product-img">
          <div class="product-img-show">
            <img v-if="listProductImage.length" id="imageIsShowing" v-bind:src="require('../assets/images/products/' + listProductImage[0].url)"  alt="Không có ảnh nào cho sản phẩm này" />
          </div>
          <div class="listImage">
            <div v-for="image, index in listProductImage" v-bind:key="index"  class="image-product-item">
              <img @click="showImage(image.url)" :src="require('../assets/images/products/' + image.url)" alt="" />
            </div>
           
          </div>
        </div>
        <div class="product-detail">
          <h1>{{ product.name }}</h1>
          <p class="price-span">
            <span class="price-span-currency">đ</span
            ><span class="price-value">{{ product.price }}</span>
          </p>
          <p>
            or 4 interest-free payments of <span>$64.75</span> with Afterpay
          </p>
          <div class="product-color">
            <span>Color</span>
            <div>
              <v-btn v-for="color in arrColor" v-bind:key="color" @click="setColor(color)"
                class="mr-2"
                fab
                dark
                height="50px"
                width="50px"
                large
                :color="color"
              >
              </v-btn>
              
            </div>
          </div>
          <div class="product-vote">
            <!-- <i class="fas fa-star"></i><i class="fas fa-star"></i
            ><i class="fas fa-star"></i><i class="fas fa-star"></i
            ><i class="fas fa-star"></i> -->
          </div>
          <div
            data-aos="fade-up"
            data-aos-anchor-placement="center-bottom"
            class="choose-size"
          >
            <v-row>
              <v-col cols="3"> <h3>Size</h3> </v-col>
              <v-col cols="9">
                <v-btn v-for="size in arrSize" v-bind:key="size" depressed @click="setSize(size)">
                  {{ size }}</v-btn
                >
              </v-col>
            </v-row>
          </div>
          <div style="margin-top: 30px">
            <input type="number" class="name-choose" id="" min="0" v-model="quantityBuy">
            Số lượng<span style="margin-left: 20px"></span>
          </div>
          <div class="alert-choose-class" v-if="chooseClassProduct">
                <v-alert
                  dense
                  border="left"
                  type="warning"
                >
                Vui lòng chọn <strong>phân loại hàng</strong> !
                </v-alert>
          </div>
          <div
            data-aos="fade-up"
            data-aos-anchor-placement="center-bottom"
            class="payment"
          >
            <button @click="addToCart"
                  data-toggle="modal"
                  href="#myAddtoCartModal"
                  class="btn btn-primary">Add to cart</button>

                <div v-if="this.colorVariantAddToCart !== null && this.sizeVariantAddToCart !== null" class="text-center">
                  <div id="myAddtoCartModal" class="modal fade">
                    <div class="modal-dialog modal-confirm" >
                      <div class="modal-content">
                        <div class="modal-body">
                          <p style="color: green">Đã thêm vào giỏ hàng.</p>
                        </div>
                        <div class="modal-footer justify-content-center">
                          <a
                            type="button"
                            class="close btn btn-danger"
                            data-dismiss="modal"
                            >Cancel</a
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

            <button class="btn" @click="buyItNow()">Buy it now</button>
            <p>FREE domestic shipping and 30 day returns</p>
          </div>
          <div
            data-aos="fade-up"
            data-aos-anchor-placement="center-bottom"
            class="secured"
          >
            <div class="secured-item">
              <i class="fas fa-camera-retro"></i>
              <p>5 Lenses & 1 Body</p>
            </div>
            <div class="secured-item">
              <i class="fas fa-laptop"></i>
              <p>15" Laptop Sleeve</p>
            </div>
            <div class="secured-item">
              <i class="fas fa-shield-alt"></i>
              <p>5 Lenses & 1 Body</p>
            </div>
          </div>
          <div
            data-aos="fade-up"
            data-aos-anchor-placement="center-bottom"
            class="description-product"
          >
            <h3>Description</h3>
            <p>{{ product.description }}</p>
          </div>

          
        </div>
      </div>
      <div
        class="related-product"
      >
        <h3>Các sản phâm tương tự</h3>
        <div class="related-product-content">
          <ProductCategory :listProducts="listRelatedProduct" />
        </div>
      </div>
      <div
        data-aos="fade-up"
        data-aos-anchor-placement="center-bottom"
        class="reviews-product"
      >
        <div class="vote-product">
          <h3>REVIEWS</h3>
          <div class="vote-action">
          </div>
        </div>
        <div
          data-aos="fade-up"
          data-aos-anchor-placement="center-bottom"
          class="reviews-content"
        >
          <div class="menu-review">
            <div class="menu-left"></div>
            <div class="menu-right">
              <button @click="isShowComment = !isShowComment">
                Write a review
              </button>
            </div>
          </div>
          <div v-if="isShowComment" class="write-comment">
            <h3>Write a comment</h3>
            <v-textarea
              label="One row"
              auto-grow
              autofocus
              outlined
              v-model="newComment"
              rows="1"
              v-on:keyup.enter="addComment"
              row-height="15"
            ></v-textarea>
          </div>
          <div class="filter-reviews">
            <h3>Filter Reviews</h3>
            <div class="text-field">
              <v-text-field label="Search" hide-details="auto"></v-text-field>
            </div>
          </div>
          <div class="list-reviews">
            <h3 v-if="listComments.length">{{ listComments.length }} Reviews</h3>
            <h3 v-else>0 Reviews</h3>
            <div
              v-for="(comment, index) in listComments"
              v-bind:key="index"
              class="review-item"
            >
              <div class="review-item-info">
                <div class="info-user">
                  <img v-bind:src="require('../assets/images/users/' + comment.url)" alt="" />
                  <div>
                    <h4>{{ comment.username }}</h4>
                    <p>
                    </p>
                  </div>
                </div>
                <span>{{ comment.created_id }}</span>
              </div>
              <div class="review-item-content">{{ comment.content }}</div>
            </div>
          </div>
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
      newComment:'',
      isShowComment: false,
      product: {},
      listVariantsProduct: null,
      listComments: [],
      listRelatedProduct: [],
      listProductImage : [],
      arrColor: [],
      arrSize: [],
      colorVariantAddToCart : null,
      sizeVariantAddToCart : null,
      quantityBuy : 1,
      chooseClassProduct: false,
    };
  },
  watch: {
    '$route' (to, from) {
      console.log(to);
      console.log(from);
      this.arrColor = [];
      this.arrSize = [];
      this.sizeVariantAddToCart = null;
      this.colorVariantAddToCart = null;
      this.fetchProduct();
      this.fetchFullImage()
      this.fetchComments();
      this.fetchRelatedProduct();
    }
  },
  components: {
    ProductCategory,
  },
  methods: {
    setColor(color){
      if(this.product.name.substring(0,2) == 'Mũ' || this.product.name.substring(0,3) == 'Túi' || this.product.name.substring(0,4) == 'Giày' || this.product.name.substring(0,3) == 'Dép'){
        this.colorVariantAddToCart = 'Default';
      }
      else{
        this.colorVariantAddToCart = color;
        }
      if(this.sizeVariantAddToCart !== null){
        this.chooseClassProduct = false;
      }
      console.log(this.colorVariantAddToCart)
    },
    setSize(size){
      if(size == 'Default'){
        this.sizeVariantAddToCart = size
      }else if(parseInt(size,10)){
        this.sizeVariantAddToCart = size;
      }
      else{
        this.sizeVariantAddToCart = size.substring(0,1);
      }
      console.log(this.sizeVariantAddToCart);
      this.updatePrice(this.sizeVariantAddToCart);
      if(this.colorVariantAddToCart !== null){
        this.chooseClassProduct = false;
      }
    },
    async updatePrice(size){
      console.log(this.product.id_product);
      let self = this;
      await axios({
        method: "post",
        data: {
          size : size, 
          id_product : self.product.id_product,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=variant&action=fetchPriceBySize",
      }).then((response) => {
        if(response.data.status == 200){
          console.log(response.data.payload[0].price);
          self.product.price = response.data.payload[0].price;
        }
      });
    },
    async addToCart(){
      if(this.sizeVariantAddToCart === null || this.colorVariantAddToCart === null){
        this.chooseClassProduct = true;
      }else{
        this.chooseClassProduct = false;
      }
      if(this.$store.state.user.info.id){
        console.log(this.sizeVariantAddToCart)
        console.log(this.colorVariantAddToCart)
        console.log(this.listVariantsProduct)
        let productTempVariant = null;
        this.listVariantsProduct.forEach(element =>{
            if(element.size == this.sizeVariantAddToCart && element.color == this.colorVariantAddToCart){
              productTempVariant = element;
              productTempVariant['quantity'] = this.quantityBuy;
            }
        });
        if(productTempVariant !== null){
            let self = this;
            await axios({
              method: "post",
              data: {
                id_user: self.$store.state.user.info.id,
                id_variant: productTempVariant.id,
                quantity : productTempVariant['quantity'],
              },
              url: "https://localhost/ecommerce_backend/index.php?controller=cart&action=addToCart",
            }).then((response) => {
              console.log(response.data.status);
              this.$store.dispatch('changeCart');
              self.completeAddToCart();
            });
            }
     
      }else{
        this.$store.state.oldUrl = '/detail/'.concat(this.$route.params.id);
        this.$router.push({ path: '/login' });

      }
    },
    addComment(){
        if(!this.$store.state.user.info.id){
          this.$store.state.oldUrl = '/detail/'.concat(this.product.id_product);
          this.$router.push({ name : 'Login'});
        }
   
        let self = this;
        axios({
          method: "post",
          data:{
            id_user : self.$store.state.user.info.id,
            content : self.newComment,
            id_product : self.product.id_product,
          },
          url: "https://localhost/ecommerce_backend/index.php?controller=comment&action=addComment",
        }).then((response) => {
          if(response.data.status == 200){
            self.newComment = '';
            self.fetchComments()
          }
        });
      },
    fetchProduct() {
      let self = this;
      const id = this.$route.params.id;
      axios({
        method: "post",
        data: {
          id: id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=getByIndex&id=".concat(
          id
        ),
      }).then((response) => {
        console.log(response.data)
        self.listVariantsProduct = response.data.payload;
        self.product = response.data.payload[0];
        console.log(self.product)
        this.filterColor();
        this.filterSize();
      });
    },
    fetchComments() {
      let self = this;
      const id = this.$route.params.id;
      axios({
        method: "post",
        data: {
          id: id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=comment&action=getByIdProduct&id_product=".concat(
          id
        ),
      }).then((response) => {
        if(response.data.status == 200){
          self.listComments = response.data.payload;
          console.log(self.listComments)
        }
      });
    },
    async fetchRelatedProduct() {
      let self = this;
      const id = this.$route.params.id;
      axios({
        method: "post",
        data: {
          id: id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=getRelated&id=".concat(
          id
        ),
      }).then((response) => {
        if (response.data.status) {
          console.log(response.data.payload)
          self.listRelatedProduct = response.data.payload;
        }
      });
    },
    async fetchFullImage(){
      let self = this;
      const id = this.$route.params.id;
      axios({
        method: "post",
        data: {
          id: id,
        },
        url: "https://localhost/ecommerce_backend/index.php?controller=product&action=getImage&id=".concat(
          id
        ),
      }).then((response) => {
        if (response.data.status) {
          console.log(response.data.payload)
          self.listProductImage = response.data.payload;
        }
      });
    },
    filterColor() {
      let arrColor = [];
      this.listVariantsProduct.forEach((element) => {
        if(element.color == "Default"){
          arrColor.push('white')
        }else
        arrColor.push(element.color);
      });
      arrColor = arrColor.filter(function (item, pos) {
        return arrColor.indexOf(item) == pos;
      });
      this.arrColor = arrColor;
      console.log(this.arrColor);

    
    },
    filterSize() {
      let arrSize = [];
      this.listVariantsProduct.forEach((element) => {
        arrSize.push(element.size);
      });
      arrSize = arrSize.filter(function (item, pos) {
        return arrSize.indexOf(item) == pos;
      });

      if(parseInt(arrSize[0], 10)){
        arrSize.forEach((size) =>{
          console.log(size)
          this.arrSize.push(size);
        })
      }else{
          arrSize.forEach((size) => {
          if(size == 'S'){
            this.arrSize.push('S 40-50KG');
          }
          if(size == 'D'){
            this.arrSize.push('D');
          }
          if(size == 'Default'){
            this.arrSize.push('Default');
          }
          if(size == 'M'){
            this.arrSize.push('M 44-55KG');
          }
          if(size == 'L'){
            this.arrSize.push('L 50-65KG');
          }
          if(size == 'XL'){
            this.arrSize.push('XL 65-80KG');
          }
        });
      }
      
    },
    showImage(url){
      document.getElementById('imageIsShowing').src = require('../assets/images/products/' + url);
    },
    completeAddToCart() {
      setTimeout(() => {
        document.getElementsByClassName("close")[0].click();
      }, 1000);
    },
    buyItNow(){
      if(this.$store.state.user.info.id){
          this.$router.push({path: '/cart'});
      }else{
        this.$store.state.oldUrl = '/cart/';
        this.$router.push({ path: '/login' });
      }
    }
  },

  created() {
    if(localStorage.getItem('info') !== null){
        this.$store.state.user.info = JSON.parse(localStorage.getItem('info'));
      }
    this.fetchProduct();
    this.fetchRelatedProduct();
    this.fetchFullImage();
    this.fetchComments();
    
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
  background: linear-gradient(to right top, #fce4bf, #fcefdb);
}
.detail-section{
  width: 70%;
  margin: auto;

}
button {
  position: relative;
  padding: 15px 30px;
  margin: 0 25px;
  background-color: black;
  color: white;
  z-index: 1;
}
button::before {
  color: black;
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 0%;
  background-color: white;
  transition: all 0.3s;
  z-index: -1;
}
button:hover {
  color: black;
  box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px,
    rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px,
    rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
  &:before {
    height: 100%;
  }
}
.detail-products {
  display: flex;
  .product-img {
    .listImage {
      margin-top: 20px;
      text-align: center;
      display: flex;
      justify-content: center;
      height: 10vh;
      .image-product-item {
        padding: 3px;
        border: 2px solid rgba(black, 0.2);
        margin: 4px;
        height: 100%;
        img {
          height: 100%;
          width: 5vw;
          background-size: cover;
          background-repeat: no-repeat;
        }
      }
      .image-product-item:hover {
        cursor: pointer;
      }
    }
    width: 60%;
    .product-img-show {
      img {
        padding: 5%;
        text-align: center;
        width: 100%;
        height: 90vh;
      }
    }
  }
  .product-detail {
    margin-top: 4vh;
    max-width: 40%;
    h1 {
      font-weight: 400;
      font-size: 36px;
      line-height: 140%;
      letter-spacing: 0.04em;
      margin-bottom: 20px;
    }
    p.price-span {
      padding: 15px 10px;
      background: #ebe9e9;
      position: relative;
      font-size: 26px;
      font-weight: 700;

      .price-span-currency {
        color: orangered;
        position: absolute;
        top: 0px;
      }
      .price-value {
        color: orangered;
        padding-left: 20px;
      }
    }
    p {
      margin-top: 20px;
      line-height: 140%;
      span {
        color: black;
        font-weight: 600;
      }
    }
    .product-color {
      span {
        font-weight: 600;
        font-size: 26px;
      }
      div {
        margin-top: 20px;
      }
    }
    .product-vote {
      margin-top: 20px;
      i {
        color: rgb(221, 174, 18);
        font-size: 24px;
        margin-right: 2px;
      }
    }
    .choose-size {
      margin-top: 25px;
      h3 {
        text-transform: capitalize;
        flex-shrink: 0;
        align-items: center;
      }
      button {
        margin: 5px 10px;
      }
    }
    .payment {
      text-align: center;
      margin-top: 20px;
      margin-bottom: 30px;
      padding-top: 30px;
      border-top: 1px solid rgba($color: black, $alpha: 0.5);
      p {
        font-size: 18px;
        font-weight: 500;
      }
    }
    .secured {
      padding-top: 30px;
      margin-bottom: 30px;
      border-top: 1px solid rgba($color: black, $alpha: 0.5);
      display: flex;
      .secured-item {
        width: calc(100% / 3);
        text-align: center;
        i {
          font-size: 30px;
        }
      }
    }
    .description-product {
      margin-bottom: 30px;
      h3 {
      }
      p {
        max-width: 90%;
        overflow: hidden;
        line-height: 140%;
        font-weight: 500;
      }
    }
    .features-product {
      border-top: 1px solid rgba($color: black, $alpha: 0.5);
      padding-top: 20px;
      padding-bottom: 20px;
      i {
        float: right;
        font-size: 20px;
      }
    }
  }
}
.reviews-product {
  .vote-product {
    text-align: center;
    h3 {
      font-size: 40px;
      line-height: 140%;
      margin-bottom: 40px;
    }
    .vote-action {
      span:first-child {
        font-size: 24px;
        font-weight: 600;
        margin-right: 10px;
      }
      i {
        font-size: 24px;
        color: rgb(226, 177, 13);
        margin-right: 20px;
      }
    }
  }
  .reviews-content {
    .menu-review {
      padding-top: 10px;
      padding-bottom: 10px;
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid black;

      .menu-left {
        padding-bottom: 20px;
      }
      .menu-right {
      }
    }
    .write-comment {
      margin-top: 100px;
      padding-left: 100px;
      width: 50%;
      h3 {
        padding-left: 100px;
        padding-bottom: 20px;
      }
    }
    .filter-reviews {
      margin-top: 70px;
      h3 {
      }
      .text-field {
        width: 30%;
      }
    }
    .list-reviews {
      margin-top: 30px;
      .review-item {
        border-bottom: 1px solid rgba(0, 0, 0, 0.151);
        padding-top: 30px;
        padding-bottom: 30px;
        display: flex;
        .review-item-info {
          width: 40%;
          display: flex;
          .info-user {
            display: flex;
            img {
              height: 50px;
              border-radius: 50%;
              padding-right: 30px;
            }
            div {
              margin-right: 50px;
              h4 {
                font-size: 20px;
                font-weight: normal;
              }
              p {
                padding-left: 20px;
                color: yellowgreen;
              }
            }
          }
        }
        .review-item-content {
        }
      }
    }
  }
}
.related-product {
  padding-top: 2vh;
  h3 {
    font-size: 2rem;
    color: rgba(0, 0, 0, 0.84);
    font-weight: 500;
  }
  .related-product-content {
    padding-top: 30px;
  }
}
.name-choose{
  background: white;
  text-align: center;
  padding: 4px;
  border: 1px solid rgba(0, 0, 0, 0.32);
}
.quantityBuy  + span{
  margin-left: 10px;
}
.modal-confirm{
  margin-top: 25%;
}
.alert-choose-class{
  padding: 20px 25px;
}
.close{
  display: none;
}
</style>