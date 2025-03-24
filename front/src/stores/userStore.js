import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    user: null
  }),
  actions: {
    setUser(data) {
      this.user = data
    },
    logout() {
      this.user = null
    }
  },
  getters: {
    isLoggedIn: (state) => !!state.user
  },
  persist: {
    storage: localStorage,
  },
})