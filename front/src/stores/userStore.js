import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    tokenHeaders: {
      'access-token': '',
      'client': '',
      'uid': '',
      'token-type': '',
      'expiry': '',
    },
    user: null
  }),
  actions: {
    setUser(data) {
      this.tokenHeaders = {
        'access-token': data.headers['access-token'],
        'client': data.headers['client'],
        'uid': data.headers['uid'],
        'token-type': data.headers['token-type'],
        'expiry': data.headers['expiry'],
      }
      this.user = data
    },
    logout() {
      this.tokenHeaders = {
        'access-token': '',
        'client': '',
        'uid': '',
        'token-type': '',
        'expiry': '',
      }
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