<template>
  <h1>test</h1>
  <el-button>Default</el-button>
  {{ !userStore.isLoggedIn }}
  <div v-if="!userStore.isLoggedIn">
    <router-link to="/signup">新規登録</router-link>
  </div>
</template>

<script setup>
import { useUserStore } from '@/stores/userStore'
const userStore = useUserStore()
</script>