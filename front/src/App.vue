<template>
  <main-header />
  <router-view />
</template>

<script>
import MainHeader from './components/main-header.vue'
export default {
  name: 'App',
  components: {
    MainHeader
  }
}
</script>

<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
header {
  background-color: #42b983;
  padding: 10px;
}

nav ul {
  list-style-type: none;
  padding: 0;
}

nav ul li {
  display: inline;
  margin-right: 10px;
}

footer {
  text-align: center;
  padding: 10px;
  background-color: #f1f1f1;
  position: fixed;
  bottom: 0;
  width: 100%;
}
</style>
