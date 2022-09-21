<template>
  <div
    id="UpdateRequest"
    class="modal animated fadeInRight custo-fadeInRight show"
    tabindex="-1"
    role="dialog"
    aria-labelledby="addContactModalTitle"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-lg" role="document">
      <form @submit.prevent="update()" role="form">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Update Withdraw Request</h5>
            <button class="btn btn-default" data-dismiss="modal">X</button>
          </div>
          <div class="modal-body">
            <div class="statbox widget box box-shadow">
              <div class="widget-content widget-content-area">
                <div class="form-group">
                  <label for="Description"
                    >Description :</label>
                    <p>{{ withdraw_update.note }}</p>
                </div>

                <div class="form-group">
                  <p>Request Amount : <b>{{ withdraw_update.request_amount }}</b></p>
                    
                </div>

                <div class="form-group">
                    <p>Request Date : {{ withdraw_update.request_date }}</p>
                </div>
                <hr/>
                <div class="form-group">
                  <label for="payment_method"
                    >Payment Method <span class="text-danger">*</span></label
                  >
                  <input
                    type="text"
                    class="form-control"
                    v-model="withdraw_update.payment_method"
                    id="payment_method"
                    placeholder="Cash, bKash, Bank, Rocket, Others"
                  />
                  <span
                    v-if="validation_error.hasOwnProperty('payment_method')"
                    class="text-danger"
                  >
                    {{ validation_error.payment_method[0] }}
                  </span>
                </div>

                <div class="form-group">
                  <label for="payment_date"
                    >Payment Date <span class="text-danger">*</span></label
                  >
                  <input
                    type="date"
                    class="form-control"
                    v-model="withdraw_update.payment_date"
                    id="payment_date"
                    placeholder="Payment Date"
                  />
                  <span
                    v-if="validation_error.hasOwnProperty('payment_date')"
                    class="text-danger"
                  >
                    {{ validation_error.payment_date[0] }}
                  </span>
                </div>

                <div class="form-group">
                  <label>Status <span class="text-danger">*</span></label>
                  <select
                    name="status"
                    class="form-control"
                    v-model="withdraw_update.status"
                  >
                    <option value="1">Paid</option>
                    <option value="0">Non Paid</option>
                  </select>
                  <span
                    v-if="validation_error.hasOwnProperty('status')"
                    class="text-danger"
                  >
                    {{ validation_error.status[0] }}
                  </span>
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
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";
export default {
  mixins: [Mixin],
  data() {
    return {
      withdraw_update: {
        id: null,
        user_id : null,
        request_amount: 0,
        request_date: null,
        note: "",
        payment_date: null,
        payment_method: '',
        status: 0,
      },
      validation_error: {},
      button_name: "Update",
    };
  },

  mounted() {
    var _this = this;
    EventBus.$on("withdraw-update-request", function (data) {
      _this.withdraw_update.id             = data.id;
      _this.withdraw_update.user_id        = data.user_id;
      _this.withdraw_update.request_amount = data.request_amount;
      _this.withdraw_update.request_date   = data.request_date;
      _this.withdraw_update.note           = data.note;
      _this.withdraw_update.payment_date   = data.return_date;
      _this.withdraw_update.payment_method = data.payment_method;
      _this.withdraw_update.status         = data.status;
      $("#UpdateRequest").modal("show");
    });
  },

  methods: {
    update() {
      this.button_name = "Updating...";
      axios
        .put(base_url + "admin/withdraw/update/" + this.withdraw_update.id, this.withdraw_update)
        .then((response) => {
          this.button_name = "Save";
          if (response.data.status === "success") {
            this.successMessage(response.data);
            $("#UpdateRequest").modal("hide");
            this.clearField();
            EventBus.$emit("withdraw-request");
          } else {
            this.validationError(response.data);
          }
        })
        .catch((error) => {
          this.button_name = "Save";
          if (error.response.status == 422) {
            this.validation_error = error.response.data.errors;
            this.validationError();
          } else {
            this.validationError(error);
          }
        });
    },

    clearField() {
      this.withdraw_update = {
        id: null,
        user_id : null,
        request_amount: 0,
        request_date: null,
        note: "",
        payment_date: null,
        payment_method: '',
        status: 0,
      };
      this.validation_error = {};
    },
  },
};
</script>