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
    path: '/home',
    name: 'Home',
    component: Home
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login.vue')
  },  
  {
    path: '/signup',
    name: 'Signup',
    component: () => import('../views/Signup.vue')
  }, 
  {
    path: '/test',
    name: 'Test',
    component: () => import('../views/Test.vue')
  },  
  {
    path: '/checkout2',
    name: 'Check',
    component: () => import('../views/Checkout2.vue')
  }, 
  {
    path:'/categories',
    name:'Categories',
    component : () => import('../views/AllCategories.vue')
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
    path: '/user',
    name: 'User',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/User.vue')
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/admin',
    name: 'Admin',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Admin.vue')
  },
  
  {
    path:'/checkout',
    name:'Checkout', 
    component : () => import('../views/Checkout.vue')
  },
 
  {
    path: '/detail/:id',
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
