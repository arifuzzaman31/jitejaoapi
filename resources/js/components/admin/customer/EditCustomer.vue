<template>
  <div>
    <div class="vld-parent">
      <loading
        :active.sync="isLoading"
        :is-full-page="true"
        :color="'#5e62ff'"
        :height="100"
        :width="100"
      ></loading>
    </div>

    <div class="row">
      <div
        id="UpdateCustomer"
        class="modal animated fadeInRight custo-fadeInRight show"
        tabindex="-1"
        role="dialog"
        aria-labelledby="addContactModalTitle"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-xl" role="document">
          <form @submit.prevent="update()" role="form">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Update Customer</h5>
              </div>
              <div class="modal-body">
                <i class="flaticon-cancel-12 close" data-dismiss="modal"></i>
                <div class="add-contact-box">
                  <div class="add-contact-content text-left">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Seller Badge</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="user.seller_badge"
                          >
                            <option value="">Seller Badge</option>
                            <option value="0">No Badge</option>
                            <option value="1">Silver</option>
                            <option value="2">Blue</option>
                            <option value="3">Pink</option>
                          </select>
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Buyer Badge</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="user.buyer_badge"
                          >
                            <option value="">Buyer Badge</option>
                            <option value="0">No Badge</option>
                            <option value="1">Silver</option>
                            <option value="2">Blue</option>
                            <option value="3">Pink</option>
                          </select>
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Seller Permission</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="user.is_seller"
                          >
                            <option value="">Choose Status</option>
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Post Permission</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="user.post_permission"
                          >
                            <option value="">Choose Status</option>
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Bid Permission</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="user.bid_permission"
                          >
                            <option value="">Choose Status</option>
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                          </select>
                        </div>
                      </div>

                      <!-- <div class="col-md-6 mt-1">
                        <div class="contact-name">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Expired Date</label>
                          <input
                            type="date"
                            class="form-control"
                            id="head-name"
                            v-model="user.subscription_expired_at"
                          />
                          <span
                            v-if="
                              validation_error.hasOwnProperty('subscription_expired_at')
                            "
                            class="text-danger"
                          >
                            {{ validation_error.subscription_expired_at[0] }}
                          </span>
                        </div>
                      </div> -->
            
                      <div class="col-md-6">
                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Status</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="user.status"
                          >
                            <option value="">Choose Status</option>
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary">
                  {{ button_name }}
                </button>

                <button class="btn btn-default" data-dismiss="modal">
                  <i class="flaticon-delete-1"></i> Close
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
// Import component
import Loading from "vue-loading-overlay";
// Import stylesheet
import "vue-loading-overlay/dist/vue-loading.css";
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";

export default {
  mixins: [Mixin],
  components: {
    Loading
  },
  data() {
    return {
      user: {
        id : '',
        average_saling_rating: "",
        average_buying_rating: "",
        seller_badge: "",
        buyer_badge: "",
        is_seller: 0,
        post_permission: 0,
        bid_permission: 0,
        subscription_expired_at: "",
        status: 1
      },
      place : '',
      isLoading: false,
      validation_error: {},
      button_name: "Update",
    };
  },
  mounted() {
    var _this = this;
    EventBus.$on("customer-update", function (value) {
      _this.clearField()
      _this.user.id = value;
      // _this.category = value;
      _this.getThisUser(value)
      $("#UpdateCustomer").modal("show");
    });
  },
  methods: {

    getThisUser(id){
        axios.get(base_url+'admin/user/'+id)
        .then(response => {
            this.user.seller_badge = response.data.seller_badge
            this.user.buyer_badge = response.data.buyer_badge
            this.user.is_seller = response.data.is_seller
            this.user.post_permission = response.data.post_permission
            this.user.bid_permission = response.data.bid_permission
            this.user.subscription_expired_at = response.data.subscription_expired_at
            this.user.post_permission = response.data.post_permission
            this.user.status = response.data.status
        })
        .catch(error => {
          console.log(error.response.data.errors)
        })
    },

    update() {
      this.isLoading = true;
      this.button_name = "Updating...";
      axios
        .put(base_url+'admin/user/'+this.user.id, this.user)
        .then((response) => {
          this.successMessage(response.data);
          this.clearField();
          $("#UpdateCustomer").modal("hide");
          this.isLoading = false;
          EventBus.$emit('customer-created');
          this.button_name = "Update";
        })
        .catch((error) => {
          if (error.response.status == 422) {
            this.validation_error = error.response.data.errors;
            // console.log(this.validation_error);
            this.validationError();
            this.button_name = "Update";
            this.isLoading = false;
          } else {
            this.successMessage(err);
            this.button_name = "Update";
            this.isLoading = false;
          }
        });
    },

    getQuantityUnit() {
      axios
        .get(base_url + "admin/quantity-unit-list?no_pagination=yes&status=1")
        .then((response) => {
          this.quantity_units = response.data;
        });
    },

    customUnitLabel({ name, english_name }) {
      return `${name} - (${english_name})`;
    },

    clearField() {
      this.user = {
        id : '',
        average_saling_rating: "",
        average_buying_rating: "",
        seller_badge: "",
        buyer_badge: "",
        is_seller: "",
        post_permission: "",
        bid_permission: "",
        subscription_expired_at: "",
        post_permission: "",
        status: 0
      }
      this.isLoading = false;
      this.validation_error = {};
      this.button_name = "Update";
    },
  },
};
</script>