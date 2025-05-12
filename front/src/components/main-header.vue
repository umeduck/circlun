<template>
  <el-container>
    <el-header>
      <div class="logo">
        さーくる
      </div>
      <el-menu
        mode="horizontal"
        background-color="#409EFF"
        text-color="#fff"
        active-text-color="#ffd04b"
        router
      >
        <el-menu-item index="/">
          Home
        </el-menu-item>
        <el-menu-item
          v-show="!userStore.isLoggedIn"
          index="/signup"
        >
          新規登録
        </el-menu-item>
        <el-menu-item
          v-show="!userStore.isLoggedIn"
          index="/login"
        >
          ログイン
        </el-menu-item>
        <el-menu-item
          v-show="userStore.isLoggedIn"
          index="#"
          @click="logout"
        >
          ログアウト
        </el-menu-item>
      </el-menu>
    </el-header>
  </el-container>
</template>

<script setup>
import { useUserStore } from '@/stores/userStore'

const userStore = useUserStore()

const logout = () => {
  userStore.logout()
}
</script>

<style scoped>
.el-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 60px;
  background-color: #409EFF;
  color: white;
  padding: 0 20px;
}

.logo {
  font-size: 24px;
  font-weight: bold;
}

.el-menu {
  flex-grow: 1;
  justify-content: flex-end;
  background-color: #409EFF;
}
</style>