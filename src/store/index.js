import { createStore } from 'vuex'


import axios from 'axios'
export default createStore({
  state:{
    user: {
      
    },
      carts : [
        // {
        //     id_book : 'CR_1',
        //     name : 'Huck and Tom', 
        //     bookLine : 'Cartoon',
        //     quantity: 3,
        //     ordered: 42,
        //     price: 42,
        //     author: 'Mark Twain',
        //     publisher: 'Adventures',
        //     views : 534,
        //     description: 'lorem',
        //     image: 'https://image.freepik.com/free-vector/retro-magazine-cover-vintage-comic-book-vector-template-book-cover-comic-cartoon-page-illustration_53562-4842.jpg',
        // },
        // {
        //   id_book : 'CR_2',
        //   name : 'Huckleberry Finn ', 
        //   bookLine : 'Cartoon',
        //   quantity: 2,
        //   ordered: 42,
        //   price: 36.5,
        //   author: 'Mark Twain',
        //   publisher: 'Adventures',
        //   views : 534,
        //   description: 'lorem',
        //   image: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1347486315l/3362881.jpg',
        // },
        // {
        //   id_book : 'CR_3',
        //   name : 'Hopelessly Lost', 
        //   bookLine : 'Cartoon',
        //   quantity: 1,
        //   ordered: 42,
        //   price: 19,
        //   author: 'Mark Twain',
        //   publisher: 'Adventures',
        //   views : 534,
        //   description: 'lorem',
        //   image: 'https://images-na.ssl-images-amazon.com/images/I/716v1OkL5wL._SR200,200_.jpg',
        // },
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
    const self = this;

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
        let x = this.getters.total;
    },
    increQuantity(state, id_book){
      let item = state.carts.find(ele => ele.id_book == id_book);
      if(item){
        let self = this;
        axios({
        method: 'post',
        data:{
          id_book : id_book,
          quantity : parseInt(item.quantity) + 1,
        },
        url: 'https://localhost/banhang/index.php?controller=cart&action=editBookInCart',
        }).then((response) => {
            if(response.data.status){
              item.quantity++;
            }
        });
      }

      
    },
    decreQuantity(state,id_book){
      let item = state.carts.find(ele => ele.id_book == id_book);
      if(item){
        let self = this;
        axios({
        method: 'post',
        data:{
          id_book : id_book,
          quantity : parseInt(item.quantity) - 1,
        },
        url: 'https://localhost/banhang/index.php?controller=cart&action=editBookInCart',
        }).then((response) => {
            if(response.data.status){
              item.quantity--;
            }
        });
      }
    },
    getCart(state, data){
        let self = this;
        axios({
        method: 'post',
        data:{
          id_user : data['id_user'],
          username : data['username'],
        },
        url: 'https://localhost/banhang/index.php?controller=cart&action=index',
        }).then((response) => {
            if(response.data.status){
              state.carts = response.data.payload;
            }
        });
    }
  },
   actions: {
    async addToCart({commit} , book){
       commit("addCart" , book);
    },
    async increQuantityOfItem({commit}, id_book){
      commit("increQuantity", id_book);
    },
    async decreQuantityOfItem({commit}, id_book){
      commit("decreQuantity", id_book);
    },
    async totalItem({commit}, ){
      commit("total");
    },
    async getCartByUser({commit}, data){
      commit("getCart", data);
    },
    async setUser({commit},data){
      let self = this;
      axios({
        method: 'post',
        data:{
          username : data.username
        },
        url: 'https://localhost/banhang/index.php?controller=user&action=getloginUser',
      }).then((response) => {
            if(response.data.status){
              self.state.user = response.data.payload
            }
      });

    }
  },
  modules: {
  }
})
