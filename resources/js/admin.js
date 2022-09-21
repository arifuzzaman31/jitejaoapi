require('./vue-assets');
// require('./bootstrap.js');

import VueLazyload from 'vue-lazyload';
Vue.use(VueLazyload)

// with options
Vue.use(VueLazyload, {
  preLoad: 1.3,
  error: 'dist/error.png',
  loading: 'dist/loading.gif',
  attempt: 1
})

Vue.component('dashboard', require('./components/admin/Dashboard.vue').default);
//Admin component
Vue.component('view-admin', require('./components/admin/admin/Admin.vue').default);
Vue.component('create-admin', require('./components/admin/admin/CreateAdmin.vue').default);

//Admin component
Vue.component('view-role', require('./components/admin/admin/role/Role.vue').default);
Vue.component('create-role', require('./components/admin/admin/role/CreateRole.vue').default);

//Customer component
// Vue.component('view-buyer', require('./components/admin/customer/buyer/Buyer.vue').default);
Vue.component('view-seller', require('./components/admin/customer/Seller.vue').default);

//Demand component
Vue.component('view-demand', require('./components/admin/demand/Demand.vue').default);
Vue.component('withdraw-request', require('./components/admin/withdraw/WithdrawRequest.vue').default);

//Nilam component
Vue.component('view-nilam', require('./components/admin/nilam/Nilam.vue').default);
Vue.component('complete-nilam', require('./components/admin/nilam/CompletedNilam.vue').default);
Vue.component('expired-nilam', require('./components/admin/nilam/ExpiredNilam.vue').default);
Vue.component('nilam-bid', require('./components/admin/nilam/NilamBid.vue').default);

var app = new Vue({
  el: '#content'
});