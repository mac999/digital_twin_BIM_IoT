import Vue from 'vue'
import App from './App.vue'

import 'semantic-ui-css/semantic.css';
import router from './router'
import * as VueGoogleMaps from "vue2-google-maps";

Vue.use(VueGoogleMaps, {
  load: {
    key: "AIzaSyDMW8CSvTVs3_OQRH6rJ_e4YwKKfQ_1hJI",
    libraries: "places" // necessary for places input
  }
});

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
