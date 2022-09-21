require('./vue-assets');


/***
 * this js file will hold all auth related components 
 */

Vue.component('company-login', require('./components/auth/company/CompanyLogin.vue').default);
Vue.component('company-register', require('./components/auth/company/CompanyRegister.vue').default);
Vue.component('admin-login', require('./components/auth/admin/AdminLogin.vue').default);

var app = new Vue({

    el: '#app'
});
