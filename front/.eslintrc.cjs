/* .eslintrc.cjs -------------------------------------------------- */
module.exports = {
  root: true,           // モノレポでなければ true で OK
  env: {
    browser: true,
    node: true,
    es2021: true,       // ECMAScript 2021 構文対応
  },
  /* ❶ 既定ルールセットを継承 */
  extends: [
    'eslint:recommended',            // JS 基本ルール
    'plugin:vue/vue3-recommended',   // Vue 3 推奨ルール
  ],

  /* ❷ パーサ設定（ほぼデフォルトで可） */
  parserOptions: {
    ecmaVersion: 2021,
    sourceType: 'module',
  },

  /* ❸ プロジェクト固有の上書き／追加ルール */
  rules: {
    // ────────────────────────────────
    // ここが今回のポイント
    // ────────────────────────────────
    'vue/multi-word-component-names': 'off',

    // 他に追加したいルールがあれば下に書く
    // 例: console.log を禁止 → 'no-console': 'warn',
  },

  /* ❹ グローバル変数宣言（defineOptions など） */
  globals: {
    defineOptions: 'readonly',
  },
};
