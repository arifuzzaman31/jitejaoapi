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
        id="CreateCategory"
        class="modal animated fadeInLeft custo-fadeInLeft show"
        tabindex="-1"
        role="dialog"
        aria-labelledby="addContactModalTitle"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-xl" role="document">
          <form @submit.prevent="store()" role="form">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Create New Category</h5>
              </div>
              <div class="modal-body">
                <i class="flaticon-cancel-12 close" data-dismiss="modal"></i>
                <div class="add-contact-box">
                  <div class="add-contact-content text-left">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="contact-name">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Category Name (Bangla)</label>
                          <input
                            type="text"
                            class="form-control"
                            id="head-name"
                            v-model="category.name"
                            placeholder="Category Name"
                          />
                          <span
                            v-if="validation_error.hasOwnProperty('name')"
                            class="text-danger"
                          >
                            {{ validation_error.name[0] }}
                          </span>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="contact-name">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">English Name</label>
                          <input
                            type="text"
                            class="form-control"
                            id="head-name"
                            v-model="category.english_name"
                            placeholder="Category Enlgish Name"
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
                      <div class="col-md-6">
                        <div class="contact-name mt-2">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Icon</label>
                          <img
                            v-if="category.icon"
                            :src="category.icon"
                            style="height: 100px"
                          />
                          <input
                            type="file"
                            class="form-control"
                            id="icon"
                            @change="onIconChanged($event)"
                          />
                          <span
                            v-if="validation_error.hasOwnProperty('icon')"
                            class="text-danger"
                          >
                            {{ validation_error.icon[0] }}
                          </span>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="contact-name mt-2">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Category Image</label>
                          <img
                            v-if="category.image"
                            :src="category.image"
                            style="height: 100px"
                          />
                          <input
                            type="file"
                            class="form-control"
                            id="icon"
                            @change="onCategoryImageChanged($event)"
                          />
                          <span
                            v-if="validation_error.hasOwnProperty('image')"
                            class="text-danger"
                          >
                            {{ validation_error.image[0] }}
                          </span>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="contact-name mt-2">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Seo Image</label>
                          <img
                            v-if="category.seo_image"
                            :src="category.seo_image"
                            style="height: 100px"
                          />
                          <input
                            type="file"
                            class="form-control"
                            id="icon"
                            @change="onSeoImageChanged($event)"
                          />
                          <span
                            v-if="validation_error.hasOwnProperty('seo_image')"
                            class="text-danger"
                          >
                            {{ validation_error.seo_image[0] }}
                          </span>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="contact-name mt-2">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Banner Image</label>
                          <img
                            v-if="category.banner"
                            :src="category.banner"
                            style="height: 100px"
                          />
                          <input
                            type="file"
                            class="form-control"
                            id="icon"
                            @change="onBannerImageChanged($event)"
                          />
                          <span
                            v-if="validation_error.hasOwnProperty('banner')"
                            class="text-danger"
                          >
                            {{ validation_error.banner[0] }}
                          </span>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Quantity Unit</label>
                          <multiselect
                            v-model="category.quantity_unit"
                            placeholder="Search and Add Quantity Unit"
                            :custom-label="customUnitLabel"
                            track-by="id"
                            :options="quantity_units"
                            :multiple="true"
                          ></multiselect>
                          <span
                            v-if="
                              validation_error.hasOwnProperty('quantity_unit')
                            "
                            class="text-danger"
                          >
                            {{ validation_error.quantity_unit[0] }}
                          </span>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Status</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="category.status"
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
import Multiselect from "vue-multiselect";
export default {
  mixins: [Mixin],
  components: {
    Loading,
    Multiselect,
  },
  data() {
    return {
      category: {
        name: "",
        english_name: "",
        icon: "",
        image: "",
        seo_image: "",
        banner: "",
        status: 1,
        quantity_unit: [],
      },
      isLoading: false,
      validation_error: {},
      button_name: "Save",
      quantity_units: [],
    };
  },
  mounted() {
    this.clearField()
    this.getQuantityUnit();
  },
  methods: {
    // icon
    onIconChanged(e) {
      let files = e.target.files || e.dataTransfer.files;
      if (!files.length) return;
      this.createIconImage(files[0]);
    },
    createIconImage(file) {
      let reader = new FileReader();
      reader.onload = (e) => {
        this.category.icon = e.target.result;
      };
      reader.readAsDataURL(file);
    },
    // icon

    // category iamge
    onCategoryImageChanged(e) {
      let files = e.target.files || e.dataTransfer.files;
      if (!files.length) return;
      this.createCategoryImage(files[0]);
    },
    createCategoryImage(file) {
      let reader = new FileReader();
      reader.onload = (e) => {
        this.category.image = e.target.result;
      };
      reader.readAsDataURL(file);
    },
    // category image

    // seo iamge
    onSeoImageChanged(e) {
      let files = e.target.files || e.dataTransfer.files;
      if (!files.length) return;
      this.createSeoImage(files[0]);
    },
    createSeoImage(file) {
      let reader = new FileReader();
      reader.onload = (e) => {
        this.category.seo_image = e.target.result;
      };
      reader.readAsDataURL(file);
    },
    // seo image

    // banner iamge
    onBannerImageChanged(e) {
      let files = e.target.files || e.dataTransfer.files;
      if (!files.length) return;
      this.createBannerImage(files[0]);
    },
    createBannerImage(file) {
      let reader = new FileReader();
      reader.onload = (e) => {
        this.category.banner = e.target.result;
      };
      reader.readAsDataURL(file);
    },
    // seo image

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
    store(page = 1) {
      this.isLoading = true;
      this.button_name = "Saving...";
      axios
        .post(base_url + "admin/category", this.category)
        .then((response) => {
          if(response.data.status == 'success'){
            this.successMessage(response.data);
            this.clearField();
            $("#CreateCategory").modal("hide");
            EventBus.$emit("created-category");
          } else {
            this.validationError(response.data);
          }
          this.isLoading = false;
          this.button_name = "Save";
        })
        .catch((error) => {
          this.button_name = "Save";
          this.isLoading = false;
          if (error.response.status == 422) {
            this.validation_error = error.response.data.errors;
            this.validationError();
          } else {
            this.validationError(error);
          }
        });
    },
    clearField() {
      this.category = {
        name: "",
        english_name: "",
        icon: "",
        image: "",
        seo_image: "",
        banner: "",
        status: 1,
        quantity_unit: [],
      };
      this.quantity_units = []
      this.isLoading = false;
      this.validation_error = {};
      this.button_name = "Save";
    },
  },
};
</script>
<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>