<template>
  <div class="widget-content layout-spacing">
    <div class="layout-px-spacing">
      <div class="row layout-top-spacing">
        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
          <div class="widget widget-account-invoice-two">
            <div class="widget-content">
              <div class="account-box">
                <div class="">
                  <h5 class="">Total User</h5>
                  <h2 class="m-auto text-center text-light">
                    {{ total_user }}
                  </h2>
                </div>
                <div class="acc-action">
                  <div class="">
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-plus"
                      >
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line></svg
                    ></a>
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-credit-card"
                      >
                        <rect
                          x="1"
                          y="4"
                          width="22"
                          height="16"
                          rx="2"
                          ry="2"
                        ></rect>
                        <line x1="1" y1="10" x2="23" y2="10"></line></svg
                    ></a>
                  </div>
                  <a :href="url + 'admin/buyer'">Go to User</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
          <div class="widget widget-account-invoice-two">
            <div class="widget-content">
              <div class="account-box">
                <div class="">
                  <h5 class="">Last Week User</h5>
                  <h2 class="m-auto text-center text-light">
                    {{ lastweek_user }}
                  </h2>
                </div>
                <div class="acc-action">
                  <div class="">
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-plus"
                      >
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line></svg
                    ></a>
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-credit-card"
                      >
                        <rect
                          x="1"
                          y="4"
                          width="22"
                          height="16"
                          rx="2"
                          ry="2"
                        ></rect>
                        <line x1="1" y1="10" x2="23" y2="10"></line></svg
                    ></a>
                  </div>
                  <a :href="url + 'admin/buyer'">Go to User</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
          <div class="widget widget-account-invoice-two">
            <div class="widget-content">
              <div class="account-box">
                <div class="">
                  <h5 class="">Last Month User</h5>
                  <h2 class="m-auto text-center text-light">
                    {{ lastmonth_user }}
                  </h2>
                </div>
                <div class="acc-action">
                  <div class="">
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-plus"
                      >
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line></svg
                    ></a>
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-credit-card"
                      >
                        <rect
                          x="1"
                          y="4"
                          width="22"
                          height="16"
                          rx="2"
                          ry="2"
                        ></rect>
                        <line x1="1" y1="10" x2="23" y2="10"></line></svg
                    ></a>
                  </div>
                  <a :href="url + 'admin/buyer'">Go to User</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
          <div class="widget widget-account-invoice-two">
            <div class="widget-content">
              <div class="account-box">
                <div class="">
                  <h5 class="">Demand</h5>
                  <h2 class="m-auto text-center text-light">
                    {{ total_demand }}
                  </h2>
                </div>
                <div class="acc-action">
                  <div class="">
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-plus"
                      >
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line></svg
                    ></a>
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-credit-card"
                      >
                        <rect
                          x="1"
                          y="4"
                          width="22"
                          height="16"
                          rx="2"
                          ry="2"
                        ></rect>
                        <line x1="1" y1="10" x2="23" y2="10"></line></svg
                    ></a>
                  </div>
                  <a :href="url + 'admin/get-demands'">Go to Demand</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
          <div class="widget widget-account-invoice-two">
            <div class="widget-content">
              <div class="account-box">
                <div class="">
                  <h5 class="">Last Week Demand</h5>
                  <h2 class="m-auto text-center text-light">
                    {{ lastweek_demand }}
                  </h2>
                </div>
                <div class="acc-action">
                  <div class="">
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-plus"
                      >
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line></svg
                    ></a>
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-credit-card"
                      >
                        <rect
                          x="1"
                          y="4"
                          width="22"
                          height="16"
                          rx="2"
                          ry="2"
                        ></rect>
                        <line x1="1" y1="10" x2="23" y2="10"></line></svg
                    ></a>
                  </div>
                  <a :href="url + 'admin/get-demands'">Go to Demand</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
          <div class="widget widget-account-invoice-two">
            <div class="widget-content">
              <div class="account-box">
                <div class="">
                  <h5 class="">Last Month Demand</h5>
                  <h2 class="m-auto text-center text-light">
                    {{ lastmonth_demand }}
                  </h2>
                </div>
                <div class="acc-action">
                  <div class="">
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-plus"
                      >
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line></svg
                    ></a>
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-credit-card"
                      >
                        <rect
                          x="1"
                          y="4"
                          width="22"
                          height="16"
                          rx="2"
                          ry="2"
                        ></rect>
                        <line x1="1" y1="10" x2="23" y2="10"></line></svg
                    ></a>
                  </div>
                  <a :href="url + 'admin/get-demands'">Go to Demand</a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
          <div class="widget widget-account-invoice-two">
            <div class="widget-content">
              <div class="account-box">
                <div class="">
                  <h5 class="">Total Bid</h5>
                  <h2 class="m-auto text-center text-light">{{ total_bid }}</h2>
                </div>
                <div class="acc-action">
                  <div class="">
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-plus"
                      >
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line></svg
                    ></a>
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-credit-card"
                      >
                        <rect
                          x="1"
                          y="4"
                          width="22"
                          height="16"
                          rx="2"
                          ry="2"
                        ></rect>
                        <line x1="1" y1="10" x2="23" y2="10"></line></svg
                    ></a>
                  </div>
                  <a href="#">Bid</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
          <div class="widget widget-account-invoice-two">
            <div class="widget-content">
              <div class="account-box">
                <div class="">
                  <h5 class="">Last Week Bid</h5>
                  <h2 class="m-auto text-center text-light">
                    {{ lastweek_bid }}
                  </h2>
                </div>
                <div class="acc-action">
                  <div class="">
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-plus"
                      >
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line></svg
                    ></a>
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-credit-card"
                      >
                        <rect
                          x="1"
                          y="4"
                          width="22"
                          height="16"
                          rx="2"
                          ry="2"
                        ></rect>
                        <line x1="1" y1="10" x2="23" y2="10"></line></svg
                    ></a>
                  </div>
                  <a href="#">Bid</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
          <div class="widget widget-account-invoice-two">
            <div class="widget-content">
              <div class="account-box">
                <div class="">
                  <h5 class="">Last Month Bid</h5>
                  <h2 class="m-auto text-center text-light">
                    {{ lastmonth_bid }}
                  </h2>
                </div>
                <div class="acc-action">
                  <div class="">
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-plus"
                      >
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line></svg
                    ></a>
                    <a href="javascript:void(0);"
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-credit-card"
                      >
                        <rect
                          x="1"
                          y="4"
                          width="22"
                          height="16"
                          rx="2"
                          ry="2"
                        ></rect>
                        <line x1="1" y1="10" x2="23" y2="10"></line></svg
                    ></a>
                  </div>
                  <a href="#">Bid</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Mixin from "../../mixin";
export default {
  mixins: [Mixin],
  data() {
    return {
      total_user: 0,
      lastweek_user: 0,
      lastmonth_user: 0,
      total_demand: 0,
      lastweek_demand: 0,
      lastmonth_demand: 0,
      total_bid: 0,
      lastweek_bid: 0,
      lastmonth_bid: 0,
      isLoading: false,
      url: base_url,
    };
  },

  created() {
    this.getDashboardData();
  },

  methods: {
    getDashboardData() {
      this.isLoading = true;
      axios
        .get(base_url + "admin/dashboard")
        .then((response) => {
          this.isLoading = false;
          this.total_user = response.data.total_user;
          this.lastweek_user = response.data.lastweek_user;
          this.lastmonth_user = response.data.lastmonth_user;
          this.total_demand = response.data.total_demand;
          this.lastweek_demand = response.data.lastweek_demand;
          this.lastmonth_demand = response.data.lastmonth_demand;
          this.total_bid = response.data.total_bid;
          this.lastweek_bid = response.data.lastweek_bid;
          this.lastmonth_bid = response.data.lastmonth_bid;
        })
        .catch((error) => {
          console.log(error.response.data.errors);
        });
    },
  },
};
</script>