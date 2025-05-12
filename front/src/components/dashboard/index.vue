<template>
  <el-container style="height: 100vh;">
    <!-- ヘッダー -->
    <el-header>
      <el-menu
        mode="horizontal"
        :default-active="activeMenu"
        @select="activeMenu = $event"
      >
        <el-menu-item index="1">メンバー管理</el-menu-item>
        <el-menu-item index="2">スケジュール管理</el-menu-item>
        <el-menu-item index="3">金銭管理</el-menu-item>
        <el-menu-item index="4">募集管理</el-menu-item>
      </el-menu>
    </el-header>

    <!-- メインコンテナ -->
    <el-container>
      <el-main>
        <el-row :gutter="20">
          <el-col :span="6" v-for="card in cards" :key="card.title">
            <el-card class="dashboard-card" shadow="hover" @click="onCardClick(card)">
              <div class="card-content">
                <el-icon>
                  <component :is="card.icon" />
                </el-icon>
                <p>{{ card.title }}</p>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </el-main>

      <!-- 右：カレンダー -->
      <el-aside width="300px" style="padding: 20px;">
        <el-calendar v-model="selectedDate" />
      </el-aside>
    </el-container>
  </el-container>
</template>

<script setup>
import { ref } from 'vue'
import {
  UserFilled,
  Calendar,
  Coin,
  Promotion
} from '@element-plus/icons-vue'

const activeMenu = ref('1')
const selectedDate = ref(new Date())

const cards = [
  { title: 'メンバー管理', icon: UserFilled, route: '/members' },
  { title: 'スケジュール管理', icon: Calendar, route: '/studios' },
  { title: '金銭管理',       icon: Coin,           route: '/billing' },
  { title: '募集管理',   icon: Promotion, route: '/locations' },
]
function onCardClick(card) {
  // クリック時の遷移など
  // 例: router.push(card.route)
  console.log('clicked', card.title)
}
</script>

<style scoped>
.dashboard-card {
  cursor: pointer;
}
.card-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 120px;
}
.card-content p {
  margin: 8px 0 0;
  font-size: 14px;
}
.card-content .el-icon {
  font-size: 62px;
}
</style>
