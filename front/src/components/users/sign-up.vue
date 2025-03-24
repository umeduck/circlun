<template>
  <el-main>
    <el-form :model="form" :rules="rules" ref="formRef" label-width="auto">
      <!-- 名前 -->
      <el-form-item label="名前" porp="name">
        <el-input
          v-model="form.name"
          placeholder="名前を入力"
        />
      </el-form-item>
      <!-- メールアドレス -->
      <el-form-item label="メールアドレス" prop="email">
        <el-input
          v-model="form.email"
          placeholder="メールアドレスを入力"
        />
      </el-form-item>
      <!-- ポジション -->
      <el-form-item label="ポジション" prop="position">
        <el-input
         v-model="form.position"
         placeholder="ポジションを入力"
        />
      </el-form-item>
      <!-- パスワード -->
      <el-form-item label="パスワード" prop="password">
        <el-input
          v-model="form.password"
          type="password"
          placeholder="パスワードを入力"
          show-password
        />
      </el-form-item>
      <!-- パスワード(確認) -->
      <el-form-item label="パスワード確認" prop="password_confirmation">
        <el-input
          v-model="form.password_confirmation"
          type="password"
          placeholder="パスワード確認を入力"
          show-password
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm">登録</el-button>
        <el-button type="primary" @click="toTop">Topへ戻る</el-button>
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
  name: '名前',
  email: 'j_16.masa@docomo.ne.jp',
  position: 'レフト',
  password: 'testtest',
  password_confirmation: 'testtest'
})

const userStore = useUserStore()

// バリデーションルール
const rules = {
  name: [
    { required: true, message: '名前は必須です', trigger: 'blur' }
  ],
  email:[
    {required: true,message: 'メールアドレスは必須です',trigger: 'blur',},
    {type: 'email',message: '正しいメールアドレスを入力してください',trigger: ['blur', 'change'],},
  ],
  position:[
    {required: true,message: 'ポシジョンは必須です',trigger: 'blur',},
  ],
  password: [
    { required: true, message: 'パスワードは必須です', trigger: 'blur' },
    { min: 8, message: '8文字以上で入力してください', trigger: 'blur' },
  ],
  password_confirmation: [
    { required: true, message: 'パスワード確認は必須です', trigger: 'blur' },
    {
      validator: (rule, value, callback) => {
        if (value !== form.password) {
          callback(new Error('パスワードが一致しません'));
        } else {
          callback();
        }
      },
      trigger: 'blur',
    },
  ],
};

const submitForm = () => {
  formRef.value.validate((valid) => {
    if (valid) {
      console.log('送信データ:', form);
      // Rails APIへPOSTリクエスト
      axios
        .post('http://localhost:3000/api/v1/auth', {
          name: form.name, email: form.email, position: form.position, password: form.password
        })
        .then((response) => {
          console.log('登録成功:', response.data);
          userStore.setUser(response.data)
          ElNotification({ message: h('i', { style: 'color: teal' }, '登録が完了しました'),})
          router.push('/')
        })
        .catch((error) => {
          console.error('登録失敗:', error.response.data);
          alert(`エラー: ${error.response.data.message || '登録に失敗しました'}`);
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