<template>
  <h1>test</h1>
  <el-button>Default</el-button>
  {{ !userStore.isLoggedIn }}
  <div v-if="!userStore.isLoggedIn">
    <router-link to="/signup">新規登録</router-link>
  </div>
  <div v-if="!userStore.isLoggedIn">
    <router-link to="/login">ログイン</router-link>
  </div>
  <div v-if="userStore.isLoggedIn">
    <el-button type="primary" @click="logout">ログアウト</el-button>
  </div>
</template>

<script setup>
import { useUserStore } from '@/stores/userStore'

const userStore = useUserStore()

const logout = () => {
  userStore.logout()
}
</script>