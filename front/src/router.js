
import { createRouter, createWebHistory } from 'vue-router'


import Home from './components/HelloWorld.vue'
import SignUp from './components/users/sign-up.vue';
import Login from './components/users/login.vue';
import CirclesNew from './components/circles/new.vue'

const routes = [
  { path: '/', component: Home },
  { path: '/signup', component: SignUp },
  { path: '/login', component: Login },
  { path: '/circles/new', component: CirclesNew },
];


const router = createRouter({
  history: createWebHistory(process.env.VUE_APP_BASE_URL),
  routes
})

export default router