require('./vue-assets');

import VueLazyload from 'vue-lazyload';
Vue.use(VueLazyload)

// with options
Vue.use(VueLazyload, {
  preLoad: 1.3,
  error: 'dist/error.png',
  loading: 'dist/loading.gif',
  attempt: 1
})
//Payment component
Vue.component('payment-setting', require('./components/admin/settings/payment/Paymentsetting.vue').default);
Vue.component('bid-setting', require('./components/admin/settings/bid/BidSetting.vue').default);
Vue.component('view-coupon', require('./components/admin/offers/coupon/Coupon.vue').default);
Vue.component('create-coupon', require('./components/admin/offers/coupon/CreateCoupon.vue').default);

// payment plan 
Vue.component('create-plan', require('./components/admin/settings/plan/CreatePlan.vue').default);
Vue.component('view-plan', require('./components/admin/settings/plan/viewPlan.vue').default);

// Send Coupon
Vue.component('create-user-coupon', require('./components/admin/offers/sendcoupon/CreateUserCoupon.vue').default);
Vue.component('view-user-coupon', require('./components/admin/offers/sendcoupon/ViewUserCoupon.vue').default);

//report component
Vue.component('payment-report', require('./components/admin/report/PaymentReport.vue').default);

//Area component
Vue.component('create-area', require('./components/admin/area/CreateArea.vue').default);
Vue.component('view-area', require('./components/admin/area/ViewArea.vue').default);

//Unit component
Vue.component('create-unit', require('./components/admin/settings/quantity-unit/CreateUnit.vue').default);
Vue.component('view-unit', require('./components/admin/settings/quantity-unit/ViewUnit.vue').default);

//category components 
Vue.component('create-category', require('./components/admin/settings/category/CreateCategory.vue').default);
Vue.component('view-category', require('./components/admin/settings/category/ViewCategory.vue').default);

// Seo Settings
Vue.component('seo-settings', require('./components/admin/settings/seo/SeoSetting.vue').default);

// Seo Settings
Vue.component('sms-setting', require('./components/admin/settings/sms/SmsSetting.vue').default);

var app = new Vue({
  el: '#content'
});