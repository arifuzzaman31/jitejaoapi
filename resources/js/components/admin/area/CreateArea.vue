<template>
  <div
    id="CreateArea"
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
            <h5 class="modal-title">Create Area</h5>
            <button class="btn btn-default" data-dismiss="modal">X</button>
          </div>
          <div class="modal-body">
            <div class="statbox widget box box-shadow">
              <div class="widget-content widget-content-area">
                <div class="form-group">
                  <label for="FullName"
                    >Area Name <span class="text-danger">*</span></label
                  >
                  <input
                    type="text"
                    class="form-control"
                    v-model="area.name"
                    id="FullName"
                    placeholder="Name"
                  />
                  <span
                    v-if="validation_error.hasOwnProperty('name')"
                    class="text-danger"
                  >
                    {{ validation_error.name[0] }}
                  </span>
                </div>

                <div class="form-group">
                  <label for="FullName"
                    >Area English Name <span class="text-danger">*</span></label
                  >
                  <input
                    type="text"
                    class="form-control"
                    v-model="area.english_name"
                    id="FullName"
                    placeholder="Name"
                  />
                  <span
                    v-if="validation_error.hasOwnProperty('english_name')"
                    class="text-danger"
                  >
                    {{ validation_error.english_name[0] }}
                  </span>
                </div>

                <div class="form-group">
                  <label>Status *</label>
                  <select
                    name="status"
                    class="form-control"
                    v-model="area.status"
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
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";
export default {
  mixins: [Mixin],
  data() {
    return {
      area: {
        name: "",
        english_name: "",
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
        .post(base_url + "admin/area", this.area)
        .then((response) => {
          this.button_name = "Save";
          if (response.data.status === "success") {
            this.successMessage(response.data);
            $("#CreateArea").modal("hide");
            this.clearField();
            EventBus.$emit("area-created");
          } else {
            this.successMessage(response.data);
          }
        })
        .catch((error) => {
          this.button_name = "Save";
          if (error.response.status == 422) {
            this.validation_error = error.response.data.errors;
            this.validationError();
          } else {
            this.successMessage(error);
          }
        });
    },

    clearField() {
      this.area = {
        name: "",
        english_name: "",
        status: 1,
      };
      this.validation_error = {};
    },
  },
};
</script>