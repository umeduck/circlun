<template>
  <el-main class="main-content">
    <el-text
      class="mx-1 form-title"
      size="large"
    >
      サークル新規登録
    </el-text>
    <el-form
      ref="formRef"
      :model="form"
      :rules="rules"
      label-width="auto"
      style="text-align: center;"
    >
      <!-- サークル名 -->
      <el-form-item :label="formLabel.name">
        <el-input
          v-model="formValue.name"
          placeholder="サークル名を入力"
        />
      </el-form-item>
      <!-- サークル種別(後々) -->
      <!-- サークルの目的 -->
      <el-form-item :label="formLabel.objective">
        <el-input
          v-model="formValue.objective"
          placeholder="サークルの目的を入力"
        />
      </el-form-item>
      <!-- サークルの平均年齢 -->
      <el-form-item :label="formLabel.avg_age" porp="name">
        <el-input
          v-model="formValue.avg_age"
          placeholder="サークルの平均年齢を入力"
        />
      </el-form-item>
      <!-- サークルの人数 -->
      <el-form-item :label="formLabel.count" porp="name">
        <el-input
          v-model="formValue.count"
          placeholder="サークルの人数を入力"
        />
      </el-form-item>
      <!-- 活動場所 -->
      <el-form-item :label="formLabel.prefectures">
        <el-select
          v-model="formValue.prefectures"
          placeholder="都道府県選択"
        >
          <el-option
            label="東京"
            value="1"
          />
          <el-option
            label="大阪"
            value="2"
          />
        </el-select>
      </el-form-item>
      <!-- サークル設立年数 -->
      <el-form-item :label="formLabel.foundation_years">
        <el-input
          v-model="formValue.foundation_years"
          placeholder="サークル設立年数を入力"
        />
      </el-form-item>
      <!-- 概要 -->
      <el-form-item :label="formLabel.note">
        <el-input
          v-model="formValue.note"
          type="textarea"
        />
      </el-form-item>
      <el-form-item label-position="top">
        <el-space
          direction="horizontal"
          alignment="center"
          :size="20"
        >
          <el-button
            type="primary"
            @click="openConfirmDialog()"
          >
            確認
          </el-button>
          <!-- <el-button @click="confirmDa()">Reset</el-button> -->
        </el-space>
      </el-form-item>
    </el-form>
    <el-dialog
      v-model="showDialog"
      title="入力確認"
      destroy-on-close
      width="80%"
    >
      <div class="dialog-title">
        以下の内容で送信してよろしいですか？
      </div>
      <el-table
        :show-header="false"
        :data="form"
        border
        style="width: 100%; margin-top: 20px;"
      >
        <el-table-column
          prop="label"
          width="150px"
        />
        <el-table-column prop="value" />
      </el-table>

      <template #footer>
        <div class="button-group">
          <el-button
            type="success"
            @click="showDialog = false"
          >
            戻る
          </el-button>
          <el-button
            type="danger"
            @click="submitForm"
          >
            送信
          </el-button>
        </div>
      </template>
    </el-dialog>
  </el-main>
</template>
<script setup>
import { reactive, ref, computed } from 'vue'
import axios from 'axios'
import { useUserStore } from '@/stores/userStore'
// import { storeToRefs } from 'pinia'

const userStore = useUserStore()
// const userId  = storeToRefs(userStore)

const form = computed(() => [
  { label: formLabel.name, value: formValue.name },
  { label: formLabel.objective, value: formValue.objective },
  { label: formLabel.avg_age, value: formValue.avg_age },
  { label: formLabel.count, value: formValue.count },
  { label: formLabel.prefectures, value: formValue.prefectures },
  { label: formLabel.foundation_years, value: formValue.foundation_years },
  { label: formLabel.note, value: formValue.note },
])

const formLabel = reactive({
  name: 'サークル名',
  kind: '1',
  objective: '目的',
  avg_age: '平均年齢',
  count: '人数',
  prefectures: '都道府県',
  foundation_years: '設立年数',
  note: '備考',
})

const formValue = reactive({
  name: '名前',
  kind: '種類',
  objective: '目的',
  avg_age: '平均年齢',
  count: '12',
  prefectures: '1',
  foundation_years: '2000',
  note: '備考',
})

const showDialog = ref(false)
function openConfirmDialog () {
  showDialog.value = true
  console.log(userStore.$state.user.data.id)
}
const submitForm = async () => {
  const url = `${process.env.VUE_APP_BASE_URL_V1}circles`
  try {
    const response = await axios.post(url, formValue)
    console.log(response.data)
  } catch (error) {
    console.error('エラー:', error.response?.data || error.message)
  }
}
</script>
<style scoped>
.main-content {
  max-width: 800px;
  margin: 10px auto; /* 中央揃え */
  padding: 0 150px;
  text-align: center;
}
.form-title{
  font-size: 20px;
  font-weight: bold;
}
</style>