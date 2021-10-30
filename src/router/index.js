import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'

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
    path:'/signup',
    name:'Signup',
    component : () => import('../views/Signup.vue')
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
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path:'/contact',
    name:'Contact', 
    component : () => import('../views/Contact.vue')
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
    path: '/pre',
    name: 'Pre',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Pre.vue')
  },
  {
    path: '/detail/:id_book',
    name: 'Detail',
    props: true,
    component: () => import('../views/Detail.vue')
  },
  {
    path: '/edit/:id_book',
    name: 'Edit',
    props: true,
    component: () => import('../views/Edit.vue')
  },
  {
    path: '/:catchAll(.*)',
    name: 'NotFound',
    component :() => import('../views/NotFound.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
