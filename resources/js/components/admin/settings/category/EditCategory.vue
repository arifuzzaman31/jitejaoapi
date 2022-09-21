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
        id="UpdateCategory"
        class="modal animated fadeInRight custo-fadeInRight show"
        tabindex="-1"
        role="dialog"
        aria-labelledby="addContactModalTitle"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-xl" role="document">
          <form @submit.prevent="store()" role="form">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Update Category</h5>
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
                            v-if="category.new_icon"
                            v-lazy="category.new_icon"
                            style="height: 100px"
                          />
                          <img
                            v-else
                            v-lazy="category.icon"
                            style="height: 100px"
                          />
                          <input
                            type="file"
                            class="form-control"
                            id="icon"
                            @change="onIconChanged($event)"
                          />
                          <span
                            v-if="validation_error.hasOwnProperty('new_icon')"
                            class="text-danger"
                          >
                            {{ validation_error.new_icon[0] }}
                          </span>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="contact-name mt-2">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Category Image</label>
                          <img
                            v-if="category.new_image"
                            v-lazy="category.new_image"
                            style="height: 100px"
                          />
                          <img
                            v-else
                            v-lazy="category.image"
                            style="height: 100px"
                          />
                          <input
                            type="file"
                            class="form-control"
                            id="icon"
                            @change="onCategoryImageChanged($event)"
                          />
                          <span
                            v-if="validation_error.hasOwnProperty('new_image')"
                            class="text-danger"
                          >
                            {{ validation_error.new_image[0] }}
                          </span>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="contact-name mt-2">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Seo Image</label>
                          <img
                            v-if="category.new_seo_image"
                            v-lazy="category.new_seo_image"
                            style="height: 100px"
                          />
                          <img
                            v-else
                            v-lazy="category.seo_image"
                            style="height: 100px"
                          />
                          <input
                            type="file"
                            class="form-control"
                            id="icon"
                            @change="onSeoImageChanged($event)"
                          />
                          <span
                            v-if="validation_error.hasOwnProperty('new_seo_image')"
                            class="text-danger"
                          >
                            {{ validation_error.new_seo_image[0] }}
                          </span>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="contact-name mt-2">
                          <i class="flaticon-user-11"></i>
                          <label for="head-name">Banner Image</label>
                          <img
                            v-if="category.new_banner"
                            v-lazy="category.new_banner"
                            style="height: 100px"
                          />
                          <img
                            v-else
                            v-lazy="category.banner"
                            style="height: 100px"
                          />
                          <input
                            type="file"
                            class="form-control"
                            id="icon"
                            @change="onBannerImageChanged($event)"
                          />
                          <span
                            v-if="validation_error.hasOwnProperty('new_banner')"
                            class="text-danger"
                          >
                            {{ validation_error.new_banner[0] }}
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
import VueLazyload from 'vue-lazyload';

export default {
  mixins: [Mixin],
  components: {
    Loading, Multiselect,VueLazyload
  },
  data() {
    return {
      category: {
        id : '',
        name: "",
        english_name: "",
        icon: "",
        image: "",
        seo_image: "",
        banner: "",
        new_icon: "",
        new_image: "",
        new_seo_image: "",
        new_banner: "",
        status: 1,
        quantity_unit: [],
      },
      isLoading: false,
      validation_error: {},
      quantity_units: [],
      button_name: "Update",
    };
  },
  mounted() {
    this.getQuantityUnit();
    var _this = this;
    EventBus.$on("edit-category", function (value) {
      _this.clearField()
      _this.getQuantityUnit()
      _this.category.id = value;
      // _this.category = value;
      _this.getThisCategory(value)
      $("#UpdateCategory").modal("show");
    });
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
        this.category.new_icon = e.target.result;
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
        this.category.new_image = e.target.result;
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
        this.category.new_seo_image = e.target.result;
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
        this.category.new_banner = e.target.result;
      };
      reader.readAsDataURL(file);
    },

    getThisCategory(id){
        axios.get(base_url+'admin/category/'+id)
        .then(response => {
            this.category.id = response.data.data.id
            this.category.name = response.data.data.name
            this.category.english_name = response.data.data.english_name
            this.category.icon = response.data.data.icon
            this.category.image = response.data.data.image
            this.category.seo_image = response.data.data.seo_image
            this.category.banner = response.data.data.banner
            this.category.quantity_unit = [... response.data.data.quantity_unit]
            this.category.status = response.data.data.status
        })
        .catch(error => {
          console.log(error.response.data.errors)
        })
    },

    store() {
      this.isLoading = true;
      this.button_name = "Updating...";
      axios
        .put(base_url+'admin/category/'+this.category.id, this.category)
        .then((response) => {
          if(response.data.status == 'success'){
            this.successMessage(response.data);
            this.clearField();
            $("#UpdateCategory").modal("hide");
            EventBus.$emit("created-category");
          } else {
            this.validationError(response.data);
          }
          this.isLoading = false;
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
            this.validationError(error);
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
      this.category = {
        id : '',
        name: "",
        english_name: "",
        icon: "",
        image: "",
        seo_image: "",
        banner: "",
        new_icon: "",
        new_image: "",
        new_seo_image: "",
        new_banner: "",
        status: 1,
        quantity_unit: [],
      }
      this.quantity_units = []
      this.isLoading = false;
      this.validation_error = {};
      this.button_name = "Update";
    },
  },
};
</script>
<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>