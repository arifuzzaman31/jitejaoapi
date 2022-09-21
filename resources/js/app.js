require('./bootstrap');
// require('./vue-assets');
window.Vue = require('vue');

Vue.component('welcome', require('./components/WelcomeComponent.vue').default);

var app = new Vue({
    el: '#app'
});