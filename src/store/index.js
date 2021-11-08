import Vue from 'vue'
import Vuex from 'vuex'
// import axios from 'axios'
Vue.use(Vuex)

export default new Vuex.Store({
  state:{
    user: {
      token: {

      },
      test: "eeee",
      info: {
      },
      info1 : {
        hai : 'hello',
      }
    },
    user1 : {

    },
    temporaryCart : [
    ],

      total : 0,
    },
  getters: {
    total: state => {
      let sum = 0;
      console.log(state.carts)
       state.carts.forEach(ele => sum += ele.quantity);
       console.log(sum);
       return sum;
    }
  },
  mutations: {
    addCart(state, book){

      let flag = false;
      state.carts.forEach(element => {
        if(element.id_book == book.id_book){
          element.quantity++;
          flag = true;
        }
        return;
      });
       if(!flag){
          state.carts.push({...book, quantity: 1});    
        }
    },
    addTemporaryCart(state, variant){
      let flag = false;
      state.temporaryCart.forEach(element => {
        if(element.id_variant == variant.id_variant){
          flag = true;
        }
      });
      if(!flag){
          // state.carts.push({...book, quantity: 1});    
          state.temporaryCart.push(variant);
        }
    },
    incQuanTempCart(state, id_variant){
      state.temporaryCart.forEach(element => {
        if(element.id_variant == id_variant){
          element.quantity++;
        }
      });
    },
    decQuanTempCart(state, id_variant){
      state.temporaryCart.forEach(element => {
        if(element.id_variant == id_variant){
          if(element.quantity > 0){
            element.quantity--;
          }else{
            this.deleTempCart(state, id_variant);
          }
        }
      });
    },
    deleTempCart(state, id_variant){
      state.temporaryCart.forEach((element,index) => {
        if(element.id_variant == id_variant){
          state.temporaryCart.remove(index)
        }
      });
    },

    // increQuantity(state, id_book){
    //   let item = state.carts.find(ele => ele.id_book == id_book);
    //   if(item){
    //     let self = this;
    //     axios({
    //     method: 'post',
    //     data:{
    //       id_book : id_book,
    //       quantity : parseInt(item.quantity) + 1,
    //     },
    //     url: 'https://localhost/BTL_ecommerce/index.php?controller=cart&action=editBookInCart',
    //     }).then((response) => {
    //         if(response.data.status){
    //           item.quantity++;
    //         }
    //     });
    //   }

      
    // },
    // decreQuantity(state,id_book){
    //   let item = state.carts.find(ele => ele.id_book == id_book);
    //   if(item){
    //     let self = this;
    //     axios({
    //     method: 'post',
    //     data:{
    //       id_book : id_book,
    //       quantity : parseInt(item.quantity) - 1,
    //     },
    //     url: 'https://localhost/BTL_ecommerce/index.php?controller=cart&action=editBookInCart',
    //     }).then((response) => {
    //         if(response.data.status){
    //           item.quantity--;
    //         }
    //     });
    //   }
    // },
    // getCart(state, data){
    //     let self = this;
    //     axios({
    //     method: 'post',
    //     data:{
    //       id_user : data['id_user'],
    //       username : data['username'],
    //     },
    //     url: 'https://localhost/BTL_ecommerce/index.php?controller=cart&action=index',
    //     }).then((response) => {
    //         if(response.data.status){
    //           state.carts = response.data.payload;
    //         }
    //     });
    // }
    setToken(state, token){
      state.user.token = token;
    }
  },
   actions: {
    async setToken({commit} , token){
      commit("setToken" , token);
    },
      async addTemporaryCart({commit} , variant){
        commit("addTemporaryCart" , variant);
    },
    async decQuanTempCart({commit},id_variant){
      commit("decQuanTempCart" , id_variant);
      
    },
    async incQuanTempCart({commit},id_variant){
      commit("incQuanTempCart" , id_variant);
      
    },
    async deleTempCart({commit},id_variant){
      commit("deleTempCart" , id_variant);
      
    }
  },
  modules: {
  }
})
