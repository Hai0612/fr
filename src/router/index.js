import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login.vue')
  },  
  
  {
    path:'/categories',
    name:'Categories',
    component : () => import('../views/Categories.vue')
  },
  {
    path:'/categories/:category',
    name:'ShowCategory',
    component : () => import('../views/Categories.vue')
  },
 
 
  {
    path: '/cart',
    name: 'Cart',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Cart.vue')
  },
  {
    path:'/checkout',
    name:'Checkout', 
    component : () => import('../views/Checkout.vue')
  },
 
  {
    path: '/detail/:id_book',
    name: 'Detail',
    props: true,
    component: () => import('../views/Detail.vue')
  },
 
  {
    path: '/:catchAll(.*)',
    name: 'NotFound',
    component :() => import('../views/NotFound.vue')
  }
]


const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
