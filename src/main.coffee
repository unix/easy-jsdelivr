import Vue from 'vue'
import Copy from 'vue-clipboard2'
import ZeitUI from '@zeit-ui/vue'
import App from './app.vue'
import components from './components'
import '@zeit-ui/vue/dist/zeit-ui.css'

Vue.use ZeitUI
Vue.use Copy
components.install Vue

Vue.config.productionTip = off

(new Vue
  render: (h) => h App)
  .$mount '#app'
