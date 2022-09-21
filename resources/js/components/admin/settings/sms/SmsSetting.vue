<template>
  <div class="row">
    <div class="col-sm-6 b-r">
      <div class="widget widget-table-two">
      <div class="widget-content">
      <form @submit.prevent="update()" role="form">
        <div class="form-group">
          <label>Provider Name*</label>
          <input
            v-model="form.provider_name"
            type="text"
            placeholder="Site Name"
            class="form-control"
          />
        </div>

        <div class="form-group">
          <label>API KEY*</label>
          <input
            v-model="form.api_key"
            type="text"
            placeholder="Title"
            class="form-control"
          />
        </div>

        <div class="form-group">
          <label>API Secret</label>
          <input
            v-model="form.api_secret"
            type="text"
            placeholder="Sitemap Link"
            class="form-control"
          />
        </div>
        <div class="form-group">
          <label>New Bid SMS</label>
          <select class="form-control" v-model="form.new_bid_sms">
              <option selected value="">Choose One ...</option>
              <option value="1">ON</option>
              <option value="0">OFF</option>
          </select>
        </div>

        <div class="form-group">
          <label>Confirm Bid SMS</label> <br />
          <select class="form-control" v-model="form.confirm_bid_sms">
              <option selected value="">Choose One ...</option>
              <option value="1">ON</option>
              <option value="0">OFF</option>
          </select>
        </div>

        <div class="form-group">
          <label>Demand SMS by Location</label> <br />
          <select class="form-control" v-model="form.demand_sms_location_status">
              <option selected value="">Choose One ...</option>
              <option value="1">By Location</option>
              <option value="0">For All</option>
          </select>
        </div>

        <div class="form-group">
          <label>Demand SMS Status</label>
          <select class="form-control" v-model="form.demand_sms_status">
              <option selected value="">Choose One ...</option>
              <option value="1">ON</option>
              <option value="0">OFF</option>
          </select>
        </div>

        <!-- <div class="form-group">
          <label>Service Status</label>
          <select class="form-control" v-model="form.service_status">
              <option selected value="">Choose One ...</option>
              <option value="1">ON</option>
              <option value="0">OFF</option>
          </select>
        </div> -->

        <div class="form-group">
          <label>Status</label>
          <select class="form-control" v-model="form.status">
              <option selected value="">Choose One ...</option>
              <option value="1">ON</option>
              <option value="0">OFF</option>
          </select>
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
        provider_name: "",
        api_key: "",
        api_secret: "",
        new_bid_sms: 1,
        confirm_bid_sms: 1,
        demand_sms_location_status: 1,
        demand_sms_status: 1,
        service_status: 1,
        status: 1
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

    _this.getSmsSetting();

    EventBus.$on("sms-created", function () {
      _this.getSmsSetting();
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

    getSmsSetting() {
      axios.get(base_url + "admin/sms/1").then((response) => {
        this.form.id = response.data.id;
        this.form.provider_name = response.data.provider_name;
        this.form.api_key = response.data.api_key;
        this.form.api_secret = response.data.api_secret;
        this.form.new_bid_sms = response.data.new_bid_sms;
        this.form.confirm_bid_sms = response.data.confirm_bid_sms;
        this.form.demand_sms_location_status = response.data.demand_sms_location_status;
        this.form.demand_sms_status = response.data.demand_sms_status;
        this.form.service_status = response.data.service_status;
        this.form.status = response.data.status;
      });
    },

    update() {
      this.button_name = "Updating...";
      axios
        .put(base_url + "admin/sms/"+this.form.id, this.form)
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