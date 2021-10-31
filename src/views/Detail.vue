<template>
    <section>
        <section class="detail-products">
            <div class="product-img">
                <div>
                    <img src="../assets/images/clother.jpg" alt="">
                </div>
            </div>
            <div class="product-detail">
                <h1>Alpha Globetrotter Camera Backpack</h1>
                <span class="price-span">$259.00</span>
                <p>or 4 interest-free payments of <span>$64.75</span> with Afterpay</p>
                <div class="product-color">
                    <span>Color</span>
                    <div>
                        <v-btn
                        class="mr-2"
                        fab
                        dark
                        height="50px"
                        width="50px"
                        large
                        color="purple"
                        >
                        </v-btn>
                        <v-btn
                        class="mr-2"
                        height="50px"
                        width="50px"
                        fab
                        dark
                        large
                        color="green"
                        >
                        </v-btn>
                        <v-btn
                        class="mr-2"
                        height="50px"
                        width="50px"
                        fab
                        dark
                        large
                        color="red"
                        >
                        </v-btn>
                    </div>
                </div>
                <div class="product-vote">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                </div>
                <div class="payment">
                    <button class="btn">Add to cart</button>
                    <button class="btn">Buy it now</button>
                    <p>FREE domestic shipping and 30 day returns</p>
                </div>
                <div class="secured">
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
                <div class="description-product">
                    <h3>Description</h3>
                    <p>Offering maximum organization and functionality, the Alpha Globetrotter Camera Backpack is the bag that does it all. Our best seller for over 7 years running.</p>
                    <p>Our camera bags are known for their durability and rugged, good looks. Whether you’re taking a day trip around town or a walkabout in a foreign land, the Alpha Globetrotter will keep you cool and dry wherever your next adventure takes you.</p>
                </div>
                
                <div class="features-product">
                    <h3>Features <i class="fas fa-plus"></i></h3>
                </div>
                <div class="features-product">
                    <h3>Weight & Dimenstion <i class="fas fa-plus"></i></h3>
                </div>
                <div class="features-product">
                    <h3>Shipping & Returns <i class="fas fa-plus"></i></h3>
                </div>
            </div>
        </section>
        <section class="reviews-product">
            <div class="vote-product">
                <h3>REVIEWS</h3>
                <div class="vote-action">
                    <span>4.9</span> <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i> <span>107 Reviews, 40 Questions</span>
                </div>
            </div>
            <div class="reviews-content">
                <div class="menu-review">
                    <div class="menu-left">
                        <button>Reviews</button>
                        <button>Questions</button>
                    </div>
                    <div class="menu-right">
                        <button @click="isShowComment = !isShowComment">Write a review</button>
                        <button>Ask a review</button>
                    </div>
                </div>
                <div v-if="isShowComment" class="write-comment">
                    <h3>Write a comment</h3>
                    <v-textarea
                    label="One row"
                    auto-grow
                    autofocus
                    outlined
                    rows="1"
                    row-height="15"
                    ></v-textarea>
                </div>
                <div class="filter-reviews">
                    <h3>Filter Reviews</h3>
                    <div class="text-field">
                        <v-text-field
                        label="Search"
                        hide-details="auto"
                        ></v-text-field>
                    </div>
                </div>
                <div class="list-reviews">
                    <h3>107 Reviews</h3>
                    <div class="review-item">
                        <div class="review-item-info">
                            <div class="info-user">
                                <img src="../assets/images/icon.jpg" alt="">
                                <div>
                                    <h4>Rachel P.Verified Buyer</h4>
                                    <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
                                </div>
                            </div>
                            <span>12/09/2021</span>
                        </div>
                        <div class="review-item-content">So Helpful</div>
                    </div>
                    <div class="review-item">
                        <div class="review-item-info">
                            <div class="info-user">
                                <img src="../assets/images/icon.jpg" alt="">
                                <div>
                                    <h4>Rachel P.Verified Buyer</h4>
                                    <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
                                </div>
                            </div>
                            <span>12/09/2021</span>
                        </div>
                        <div class="review-item-content">So Helpful</div>
                    </div><div class="review-item">
                        <div class="review-item-info">
                            <div class="info-user">
                                <img src="../assets/images/icon.jpg" alt="">
                                <div>
                                    <h4>Rachel P.Verified Buyer</h4>
                                    <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
                                </div>
                            </div>
                            <span>12/09/2021</span>
                        </div>
                        <div class="review-item-content">So Helpful</div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    
</template>
<script>
export default {
    data(){
        return {
            isShowComment : false,
        }
    },
    components:{
    }
}
</script>
<style lang="scss" scoped>
  .detail-products{ 
      padding: 100px 200px;
      display: flex;
      .product-img{
          width: 60%;
          img{
              text-align: center;
              width: 90%;
              height: 120vh;
          }
      }
      .product-detail{
          max-width: 40%;
          h1{
            font-weight: 400;
            font-size: 36px;
            line-height: 140%;
            letter-spacing: .04em;
            margin-bottom: 20px;
          }
          span.price-span{
              font-size: 26px;
              font-weight: 700;
          }
          p{
              margin-top: 20px;
              line-height: 140%;
              span{
                  color: black;
                  font-weight: 600;
              }
          }
          .product-color{
              span{
                  font-weight: 600;
                  font-size: 26px;
              }
              div{
                  margin-top: 20px;
                
              }
          }
          .product-vote{
                  margin-top: 20px;
              i{
                  color: rgb(221, 174, 18);
                  font-size: 24px;
                  margin-right: 2px;
              }
          }
          .payment{
              text-align: center;
              margin-top: 20px;
              margin-bottom: 30px;
              padding-top: 30px;
              border-top: 1px solid rgba($color: black, $alpha: 0.5);
              p{
                  font-size: 18px;
                  font-weight: 500;
              }
              button{ 
                position: relative;
                padding: 15px 40px;
                margin-right: 25px;
                margin-left: 25px ;
                width: calc(50% - 50px);
                background-color: black;
                color: white;
                z-index: 1;
                }
                button::before {
                    color: black;
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 100%;
                    height: 0%;
                    background-color: white;
                    transition: all .3s;
                    z-index: -1;
                }
                button:hover {
                    color: black;
                    box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
                    &:before {
                        height: 100%;
                        }
                    a{
                        color: black;
                    }
                }
          }
          .secured{
              padding-top: 30px;
              margin-bottom: 30px;
              border-top: 1px solid rgba($color: black, $alpha: 0.5);   
              display: flex;
              .secured-item{
                  width: calc(100% / 3);
                  text-align: center;
                  i{
                      font-size: 30px;
                  }
              }
          }
          .description-product{
              margin-bottom: 30px;  
              h3{

              }
              p{
                  max-width: 90%;
                  overflow: hidden;
                  line-height: 140%;
                  font-weight: 500;
              }
          }
          .features-product{
              border-top: 1px solid rgba($color: black, $alpha: 0.5);   
              padding-top: 20px;
              padding-bottom: 20px;
              i{
                  float: right;
                  font-size: 20px;
              }
          }
      }
  }  
  .reviews-product{
      .vote-product{
          text-align: center;
          h3{
              font-size: 40px;
              line-height: 140%;
              margin-bottom: 40px;
          }
          .vote-action{
              span:first-child{
                  font-size: 24px;
                  font-weight: 600;
                  margin-right: 10px;
              }
              i{
                  font-size: 24px;
                  color: rgb(226, 177, 13);
                  margin-right: 20px;
              }
          }
          
      }
      .reviews-content{
          margin: 150px 200px;
          .menu-review{
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid black;
            button{ 
                position: relative;
                padding: 15px 40px;
                margin-right: 25px;
                font-size: 23px;
                margin-left: 25px ;
                background-color: black;
                color: white;
                z-index: 1;
                }
            .menu-left{
                padding-bottom: 20px;
            }
            .menu-right{
            }
          }
          .write-comment{
              margin-top: 100px;
              padding-left: 100px;
              width: 50%;
              h3{
                  padding-left: 100px;
                  padding-bottom: 20px;
              }
          }
         .filter-reviews{
             margin-top: 70px;
             h3{

             }
             .text-field{
                 width: 30%;
             }
             
         }
         .list-reviews{
             margin-top: 30px;
             .review-item{
                 border-bottom: 1px solid rgba(0, 0, 0, 0.151);
                 padding-top: 30px;
                 padding-bottom: 30px;
                 display: flex;
                 .review-item-info{
                     width: 40%;
                     display: flex;
                     .info-user{
                         display: flex;
                         img{
                         height: 50px;
                         border-radius: 50%;
                         padding-right: 30px;
                         }
                         div{
                             margin-right: 50px;
                             h4{
                                 font-size: 20px;
                                 font-weight: normal;
                             }
                             p{
                                padding-left: 20px;
                                color: yellowgreen;
                             }
                         }
                    }
                     

                 }
                 .review-item-content{

                 }
             }
         }
      }
  }
</style>