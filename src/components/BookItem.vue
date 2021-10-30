<template>
        <div class="card">
          <div v-if="currentUser.admin" @click="deleteBookItem" class="manage">
            <i class="fas fa-bars"></i>
          </div>
          <div class="manage-content">
            <div>
              <button @click="changeShowDelete" class="btn"><i class="fas fa-trash-alt"></i></button>
              <router-link :to="{ 'name' : 'Edit', params:{id_book : values.id_book}}"><i class="fas fa-edit"></i></router-link>
            </div>
          </div>
             <router-link :to="{ name: 'Detail', params: { id_book: values.id_book }}">
              <img :src="values.image" alt="img">
              </router-link>
              <div class="card-body">
                  <h4 class="nameBook">{{ values.name }}</h4>
                  <p class="authorBook">{{ values.author }}</p>
                  <div class="detail">
                    <div class="view">
                      <i class="fas fa-star"></i>
                      <i class="fas fa-star"></i>
                      <i class="fas fa-star"></i>
                      <p>{{ values.views}}</p>
                    </div>
                    <div class="price">
                      <span>${{ values.price}}</span>
                    </div>
                    
                  </div>
              </div>
          <div v-if="deleteShow" class="delete">
            <div class="delete-content">
                <div class="delete-title">
                  <h3>Do you want to delete this book?
                  </h3>
                </div>
                <div class="delete-body">
                  <button @click="deleteShow = false" type="button" class="btn" data-bs-dismiss="alert" aria-label="Close"><i class="fas fa-times"></i></button>
                  <button @click="deleteBookItem" type="button" class="btn" data-bs-dismiss="alert" aria-label="Close"><i class="fas fa-check"></i></button>
                </div>
            </div>
          </div>
          </div>
</template>
<script>
import axios from 'axios'
export default {
    data(){
      return {
        username : '',
        deleteShow : false,
      }
    },
    props: {
      values:{
        type:Object
      }
    },
    watch:{
      values:{
        deep:true,
        immediate:true,
        hanler(vl){
          console.log(vl);
        }
      }
    },
    computed:{
      currentUser(){
        return {admin:true}
      }
    },
    methods:{
        changeShowDelete(){
            this.deleteShow = !this.deleteShow;
            // event.target.closest('.card').getElementsByClassName('card-body')[0].style.opacity = '0.3';
            // event.target.closest('.card').querySelectorAll('img')[0].style.opacity = '0.3';
        },
        deleteBookItem(){
           let self = this ;
          self.$emit('delete-item',self.values)
        },
        manageTasks(mes){
          // if(document.getElementById('edit_' + mes).style.display == 'block'){
          //   document.getElementById('edit_' + mes).style.display = 'none';
          // }else{
          //   document.getElementById('edit_' + mes).style.display = 'block';
          // }

        },
    },

}
</script>
<style lang="scss" scoped>
        .card{
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            img{
              width: 100%;
              height: 260px;
              margin-top: 5px;
            }
          .card-body{     
              padding: 0.5rem;
              .detail{
                display: flex;
                align-items: center;
                flex-direction: row;
                .view{
                  width: 60%;
                  display: inline-block;
                  i{
                    color:rgb(233, 182, 15);
                  }
                }
                .price{
                  margin-left: 40px;
                  span{
                    color: red;
                    font-size: 24px;
                  }
                }
              }
              h4{
                margin: 0;
                font-size: 18px;
                font-weight: 500;
                min-height: 60px;
                padding: 0;
                overflow: hidden;
              }
              p{
                margin: 0;
                padding: 0;
                overflow: hidden;
              }
              .authorBook{
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
              }
          }
        .manage{
          padding: 7px;
          background: rgb(95, 93, 89);
          font-size: 20px;
          position:absolute;
          top: 0;
          right: 0;
        }   
        .manage-content{
          position: absolute;
          top: 0;
          right: 15%;
          display: none;
          background: wheat;
          button{
            padding: 0;
            margin-top: -9px;
          }
          i{
            padding: 10px;
            font-size: 22px;
          }
          i:hover{
            background: whitesmoke;
            cursor: pointer;
          }
        }   
        .delete{
          position: absolute;
          top: 20%;
          box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
          border-radius: 7px;
          background: rgba($color: wheat, $alpha: 1.0);
          margin: 10px;
          padding: 10px 20px;
          .delete-content{
            h3{
              font-size: 15px;
            }
            .delete-body{
              text-align: center;
              button:hover{
                background: rgba($color: crimson, $alpha: 0.5);
                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
              }
            }
          }
        }
      }
      .card:hover{
        box-shadow: rgba(100, 100, 111, 0.4) 0px 7px 29px 0px;
      }
</style>