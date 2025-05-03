import axios from 'axios'
import { useUserStore } from '@/stores/userStore'

const api = axios.create({
  baseURL: `${process.env.VUE_APP_BASE_API_URL_V1}`,
  withCredentials: false,
})

api.interceptors.request.use((config) => {
  const auth = useUserStore()

  if (auth.tokenHeaders['access-token']) {
    config.headers = {
      ...config.headers,
      'Content-Type': 'application/json',
      'access-token': auth.tokenHeaders['access-token'],
      'client': auth.tokenHeaders['client'],
      'uid': auth.tokenHeaders['uid'],
      'token-type': auth.tokenHeaders['token-type'],
      'expiry': auth.tokenHeaders['expiry'],
    }
  }

  return config
})

export default api
