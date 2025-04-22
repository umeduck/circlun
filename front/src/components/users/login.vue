<template>
  <el-main>
    <el-form
      ref="formRef"
      :model="form"
      :rules="rules"
      label-width="auto"
    >
      <!-- メールアドレス -->
      <el-form-item
        label="メールアドレス"
        prop="email"
      >
        <el-input
          v-model="form.email"
          placeholder="メールアドレスを入力"
        />
      </el-form-item>
      <!-- パスワード -->
      <el-form-item
        label="パスワード"
        prop="password"
      >
        <el-input
          v-model="form.password"
          type="password"
          placeholder="パスワードを入力"
          show-password
        />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          @click="submitForm"
        >
          ログイン
        </el-button>
        <el-button
          type="primary"
          @click="toTop"
        >
          Topへ戻る
        </el-button>
      </el-form-item>
    </el-form>
  </el-main>
</template>

<script setup>
import { reactive, ref, h } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'
import { useUserStore } from '@/stores/userStore'
import { ElNotification } from 'element-plus'

// routerのインスタンスを作成
const router = useRouter()

const formRef = ref(null)
const form = reactive({
  email: 'j_16.masa@docomo.ne.jp',
  password: 'testtest'
})

const userStore = useUserStore()

const submitForm = () => {
  formRef.value.validate((valid) => {
    if (valid) {
      console.log('送信データ:', form);
      // Rails APIへPOSTリクエスト
      axios
        .post('http://localhost:3000/api/v1/auth/sign_in', {
          email: form.email, password: form.password
        })
        .then((response) => {
          console.log('ログイン成功:', response.data);
          userStore.setUser(response.data)
          ElNotification({ message: h('i', { style: 'color: teal' }, 'ログインが成功しました'),})
          router.push('/')
        })
        .catch((error) => {
          console.error('ログイン失敗:', error.response.data);
          ElNotification({ message: h('i', { style: 'color: teal' }, 'ログインに失敗しました'),})
        });
    } else {
      console.log('バリデーションエラー');
      return false;
    }
  });
}

// Topへ戻るボタンの処理
const toTop = () => {
  router.push('/')
}
</script>