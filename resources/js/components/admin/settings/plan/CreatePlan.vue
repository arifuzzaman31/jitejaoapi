<template>
  <div
    id="CreatePlan"
    class="modal animated fadeInRight custo-fadeInRight show"
    tabindex="-1"
    role="dialog"
    aria-labelledby="addContactModalTitle"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-lg" role="document">
      <form @submit.prevent="store()" role="form">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Create plan</h5>
            <button class="btn btn-default" data-dismiss="modal">X</button>
          </div>
          <div class="modal-body">
            <div class="statbox widget box box-shadow">
              <div class="widget-content widget-content-plan">
                <div class="form-group">
                  <label for="FullName"
                    >Plan Name <span class="text-danger">*</span></label
                  >
                  <input
                    type="text"
                    class="form-control"
                    v-model="plan.plan_name"
                    id="FullName"
                    placeholder="Name"
                  />
                  <span
                    v-if="validation_error.hasOwnProperty('plan_name')"
                    class="text-danger"
                  >
                    {{ validation_error.plan_name[0] }}
                  </span>
                </div>
                <div class="form-group">
                  <label for="FullName"
                    >Total Month <span class="text-danger">*</span></label
                  >
                  <input
                    type="text"
                    class="form-control"
                    v-model="plan.total_month"
                    id="FullName"
                    placeholder="Name"
                  />
                  <span
                    v-if="validation_error.hasOwnProperty('total_month')"
                    class="text-danger"
                  >
                    {{ validation_error.total_month[0] }}
                  </span>
                </div>
                <div class="form-group">
                  <label for="FullName"
                    >Total Amount <span class="text-danger">*</span></label
                  >
                  <input
                    type="text"
                    class="form-control"
                    v-model="plan.total_amount"
                    id="FullName"
                    placeholder="Name"
                  />
                  <span
                    v-if="validation_error.hasOwnProperty('total_amount')"
                    class="text-danger"
                  >
                    {{ validation_error.total_amount[0] }}
                  </span>
                </div>

                <div class="form-group">
                  <label for="FullName"
                    >Discount <span class="text-danger">*</span></label
                  >
                  <input
                    type="text"
                    class="form-control"
                    v-model="plan.discount"
                    id="FullName"
                    placeholder="Name"
                  />
                  <span
                    v-if="validation_error.hasOwnProperty('discount')"
                    class="text-danger"
                  >
                    {{ validation_error.discount[0] }}
                  </span>
                </div>
                <div class="form-group">
                  <label for="FullName"
                    >Final Amount <span class="text-danger">*</span></label
                  >
                  <input
                    type="text"
                    class="form-control"
                    :value="
                      (plan.final_amount = plan.total_amount - plan.discount)
                    "
                    id="FullName"
                    placeholder="Name"
                  />
                  <span
                    v-if="validation_error.hasOwnProperty('final_amount')"
                    class="text-danger"
                  >
                    {{ validation_error.total_amount[0] }}
                  </span>
                </div>

                <div class="form-group">
                  <label>Status *</label>
                  <select
                    name="status"
                    class="form-control"
                    v-model="plan.status"
                  >
                    <option value="1">Active</option>
                    <option value="0">Inactive</option>
                  </select>
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
import { EventBus } from "../../../../vue-assets";
import Mixin from "../../../../mixin";
export default {
  mixins: [Mixin],
  data() {
    return {
      plan: {
        plan_name: "",
        total_month: 0,
        total_amount: 0,
        discount: 0,
        final_amount: 0,
        status: 1,
      },
      validation_error: {},
      button_name: "Save",
    };
  },

  methods: {
    store() {
      this.button_name = "Saving...";
      axios
        .post(base_url + "admin/subscription", this.plan)
        .then((response) => {
          this.button_name = "Save";
          if (response.data.status === "success") {
            this.successMessage(response.data);
            $("#CreatePlan").modal("hide");
            this.clearField();
            EventBus.$emit("plan-created");
          } else {
            this.validationError(response.data);
          }
          this.button_name = "Save";
        })
        .catch((error) => {
          this.button_name = "Save";
          if (error.response.status == 422) {
            this.validation_error = error.response.data.errors;
            this.validationError();
          } else {
            this.successMessage(error.data);
          }
        });
    },

    clearField() {
      this.plan = {
        plan_name: "",
        total_month: 0,
        total_amount: 0,
        discount: 0,
        final_amount: 0,
        status: 1,
      };
      this.validation_error = {};
    },
  },
};
</script>