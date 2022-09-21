<template>
  <div class="row">
    <div class="col-sm-8 b-r">
      <div class="widget widget-table-two">
      <div class="widget-content">
      <form @submit.prevent="update()" role="form">
        <div class="form-group">
          <label>Site Name*</label>
          <input
            v-model="form.site_name"
            type="text"
            placeholder="Site Name"
            class="form-control"
          />
        </div>

        <div class="form-group">
          <label>Title*</label>
          <input
            v-model="form.title"
            type="text"
            placeholder="Title"
            class="form-control"
          />
        </div>

        <div class="form-group">
          <label>Sitemap Link</label>
          <input
            v-model="form.sitemap_link"
            type="text"
            placeholder="Sitemap Link"
            class="form-control"
          />
        </div>
        <div class="form-group">
          <label>Author</label>
          <input
            v-model="form.author"
            type="text"
            placeholder="Author"
            class="form-control"
          />
        </div>

        <div class="form-group">
          <label>Meta Image</label> <br />
          <div class="fileinput fileinput-new">
            <span class="btn btn-primary"
              ><span class="fileinput-new"><i class="fa fa-camera"></i></span>
              <span class="fileinput-exists">Change Image</span
              ><input type="file" id="file3" ref="file" @change="onMetaChange"
            /></span>
          </div>
        </div>

        <div class="form-group">
          <label for="keyword">Search Keyword</label>
          <textarea
            class="form-control"
            id="keyword"
            placeholder="Add Keyword Using comma. exp: abc,xyz"
            rows="4"
            v-model="form.seo_keyword"
            >{{ form.seo_keyword }}</textarea
          >
        </div>

        <div class="form-group">
          <label for="description">Description</label>
          <textarea
            class="form-control"
            id="description"
            v-model="form.description"
            rows="4"
          ></textarea>
        </div>

        <div style="margin-bottom: 20px">
          <button class="btn btn-lg btn-primary float-right" type="submit">
            <strong>{{ button_name }}</strong>
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
    <div class="col-sm-4">
      <div class="row mx-auto">
        <div class="col-12 text-center">
          <h5 class="mb-2">Seo Image Preview</h5>
          <p v-if="form.new_meta_image != ''">
            <img class="img-responsive img-fluid" :src="form.new_meta_image" />
          </p>

          <p class="text-center" v-else>
            <img :src="form.view_meta_image" class="img-responsive img-fluid" />
          </p>
        </div>
      </div>
    </div>

    <div
      class="col-md-12"
      v-if="validation_error"
      style="margin-top: 20px; margin-bottom: 10px"
    >
      <div class="form-group">
        <div>
          <ul>
            <li class="text-danger" v-for="error in validation_error">
              {{ error[0] }}
            </li>
          </ul>
        </div>
      </div>
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
      form: {
        id: "",
        title: "",
        site_name: "",
        new_meta_image: "",
        view_meta_image: "",
        sitemap_link: "",
        author: "",
        description: "",
        seo_keyword: "",
      },
      isLoading: false,
      button_name: "Update",
      url: base_url,
      validation_error: null,
      tags: [],
    };
  },

  mounted() {
    // this  will not work in eventBus that why
    // we are initializing with _this

    var _this = this;

    _this.getSetting();

    EventBus.$on("seo-created", function () {
      _this.getSetting();
    });
  },

  methods: {
    onMetaChange(e) {
      this.form.new_meta_image = "";
      let files = e.target.files || e.dataTransfer.files;
      if (!files.length) return;
      this.createMeta(files[0]);
    },
    createMeta(file) {
      let reader = new FileReader();
      let vm = this;
      reader.onload = (e) => {
        vm.form.new_meta_image = e.target.result;
      };
      reader.readAsDataURL(file);
    },

    getSetting() {
      axios.get(base_url + "admin/setting/seo").then((response) => {
        this.form.id = response.data.data.id;
        this.form.site_name = response.data.data.site_name;
        this.form.title = response.data.data.title;
        this.form.view_meta_image = response.data.data.meta_image;
        this.form.sitemap_link = response.data.data.sitemap_link;
        this.form.author = response.data.data.author;
        this.form.description = response.data.data.description;
        this.form.seo_keyword = response.data.data.keyword;
      });
    },

    update() {
      this.button_name = "Updating...";
      //  this.feildData()
      axios
        .post(base_url + "admin/update/seo", this.form)
        .then((response) => {
          if (response.data.status === "success") {
            this.successMessage(response.data);
            EventBus.$emit("seo-created");
            this.validation_error = null;
          } else {
            this.validationError(response.data);
          }
          this.button_name = "Update";
        })
        .catch((err) => {
          if (err.response.status == 422) {
            this.validation_error = err.response.data.errors;
            this.validationError();
            this.button_name = "Update";
          } else {
            this.validationError(err.data);

            this.button_name = "Update";
          }
        });
    },
  },
};
</script>