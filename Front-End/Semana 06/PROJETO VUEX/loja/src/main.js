import { createApp } from 'vue'
import App from './App.vue'
import store from './store' // <-- Importando a store que você criou

const app = createApp(App)

app.use(store) // <-- Dizendo para o Vue usar o Vuex
app.mount('#app')