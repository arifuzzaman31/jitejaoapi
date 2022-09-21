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
        id="UpdateUnit"
        class="modal animated fadeInRight custo-fadeInRight show"
        tabindex="-1"
        role="dialog"
        aria-labelledby="addContactModalTitle"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          <form @submit.prevent="store()" role="form">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Update Unit</h5>
              </div>
              <div class="modal-body">
                <i class="flaticon-cancel-12 close" data-dismiss="modal"></i>
                <div class="add-contact-box">
                  <div class="add-contact-content text-left">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="contact-name">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Unit Name</label>
                          <input
                            type="text"
                            class="form-control"
                            id="head-name"
                            v-model="unit.name"
                            placeholder="Unit Name"
                          />
                          <span
                            v-if="validation_error.hasOwnProperty('name')"
                            class="text-danger"
                          >
                            {{ validation_error.name[0] }}
                          </span>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="contact-name">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Unit English Name</label>
                          <input
                            type="text"
                            class="form-control"
                            id="head-name"
                            v-model="unit.english_name"
                            placeholder="Unit English Name"
                          />
                          <span
                            v-if="
                              validation_error.hasOwnProperty('english_name')
                            "
                            class="text-danger"
                          >
                            {{ validation_error.english_name[0] }}
                          </span>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="contact-email">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Status</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="unit.status"
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
import { EventBus } from "../../../../vue-assets";
import Mixin from "../../../../mixin";
export default {
  mixins: [Mixin],
  components: {
    Loading,
  },
  data() {
    return {
      unit: {
        id: "",
        name: "",
        english_name: "",
        status: 1,
      },
      isLoading: false,
      validation_error: {},
      button_name: "Update",
    };
  },
  mounted() {
    var _this = this;
    EventBus.$on("edit-unit", function (value) {
      _this.clearField()
      _this.unit = value;
      $("#UpdateUnit").modal("show");
    });
  },
  methods: {
    store(page = 1) {
      this.isLoading = true;
      this.button_name = "Updating...";
      axios
        .put(base_url + "admin/quantity-unit/" + this.unit.id, this.unit)
        .then((response) => {
          if(response.data.status == 'success'){
            this.successMessage(response.data);
            this.clearField();
            $("#UpdateUnit").modal("hide");
          } else {
            this.validationError(response.data);
          }
          this.isLoading = false;
          this.button_name = "Update";
            EventBus.$emit("created-unit");
        })
        .catch((error) => {
          if (error.response.status == 422) {
            this.validation_error = error.response.data.errors;
            console.log(this.validation_error);
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
    clearField() {
      this.unit = {
        id: "",
        name: "",
        status: 1,
      };
      this.isLoading = false;
      this.validation_error = {};
      this.button_name = "Update";
    },
  },
};
</script>