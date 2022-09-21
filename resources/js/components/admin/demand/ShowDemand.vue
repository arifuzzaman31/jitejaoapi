<template>
  <div
    id="showDemandModal"
    class="modal animated fadeInRight custo-fadeInRight show"
    tabindex="-1"
    role="dialog"
    aria-labelledby="addContactModalTitle"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">View Demand</h5>
          <button class="btn btn-outline-danger" data-dismiss="modal">X</button>
        </div>
        <div class="modal-body">
          <div class="card mb-3">
            <div class="card-header bg-transparent">
              <strong>Name :</strong>
              <p>
                {{ demand.user
                }}<span v-if="demand.area != 'N/A'">, {{ demand.area }}</span>
              </p>
            </div>
            <div class="card-body text-success">
              <h5 class="card-title">{{ demand.title }}</h5>
              <p class="card-text my-4" v-html="demand.description"></p>
            </div>
            <div class="text-center">
              <img
                class="img-fluid"
                :src="demand.image_one"
                v-if="demand.image_one"
                :alt="demand.user"
              />
              <!-- <img class="img-fluid" :src="demand.image_one" v-if="demand.image_two" :alt="demand.user"> -->
              <img
                class="img-fluid"
                :src="demand.image_three"
                v-if="demand.image_three"
                :alt="demand.user"
              />
            </div>

            <div class="d-flex justify-content-around mb-4">
              <div class="card" style="width: 18rem">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">
                    <strong>Category :</strong> {{ demand.category }}
                  </li>
                  <li class="list-group-item">
                    <strong>Quantity :</strong> {{ demand.quantity }}
                  </li>
                  <li class="list-group-item">
                    <strong>Quantity Unit :</strong>
                    {{ demand.quantity_unit.name }}
                  </li>
                  <li class="list-group-item">
                    <strong>Budget :</strong> {{ demand.minimum_budget }} -
                    {{ demand.maximum_budget }}
                  </li>
                  <li class="list-group-item">
                    <strong>Fixed Budget :</strong> {{ demand.fixed_budget }}
                  </li>
                  <li class="list-group-item">
                    <strong>Confirm Amount :</strong>
                    {{ demand.confirmed_amount }}
                  </li>
                  <li class="list-group-item">
                    <strong>Confirm To :</strong> {{ demand.confirmed_to }}
                  </li>
                </ul>
              </div>
              <!-- <div class="row">
                                <img class="img-fluid" :src="demand.image_one" v-if="demand.image_one" :alt="demand.user">
                                <img class="img-fluid" :src="demand.image_three" v-else="demand.image_three" :alt="demand.user">
                            </div> -->
              <div class="card" style="width: 18rem">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">
                    <strong>Expire Date :</strong> {{ demand.expire_date }}
                  </li>
                  <li class="list-group-item">
                    <strong>Total Like :</strong> {{ demand.total_like }}
                  </li>
                  <li class="list-group-item">
                    <strong>Total Bid :</strong> {{ demand.total_bid }}
                  </li>
                  <li class="list-group-item">
                    <strong>Bid Status :</strong> {{ demand.bid_status }}
                  </li>
                  <li class="list-group-item">
                    <strong>Status :</strong> {{ demand.status }}
                  </li>
                  <li class="list-group-item">
                    <strong>SMS Status :</strong> {{ demand.sms_status }}
                  </li>
                  <li class="list-group-item">
                    <strong>Notification Status :</strong>
                    {{ demand.notification_status }}
                  </li>
                </ul>
              </div>
            </div>
            <div class="card-footer text-center">
              <a
                :href="front_url + '/demand/' + demand.id + '/' + demand.slug"
                class="btn btn-primary"
                target="_blank"
                >Visit Front Side</a
              >
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-default" data-dismiss="modal">
            <i class="flaticon-delete-1"></i> Close
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";

export default {
  mixins: [Mixin],
  props: ["front_url"],
  components: {},
  data() {
    return {
      demand: {
        id: "",
        user: "",
        category: "",
        area: "",
        title: "",
        slug: "",
        description: "",
        image_one: "",
        image_two: "",
        image_three: "",
        quantity: "",
        quantity_unit: "",
        budget_type: "",
        minimum_budget: "",
        maximum_budget: "",
        fixed_budget: "",
        confirmed_amount: "",
        confirmed_to: "",
        expire_date: "",
        total_like: "",
        total_bid: "",
        bid_status: "",
        status: "",
        sms_status: "",
        notification_status: "",
        created_at: "",
      },
      validation_error: {},
      url: base_url,
      button_name: "Update",
    };
  },

  mounted() {
    var _this = this;
    EventBus.$on("demand-show", function (id) {
      _this.getBuyerDemand(id);
      $("#showDemandModal").modal("show");
    });
  },

  methods: {
    getBuyerDemand(id) {
      axios
        .get(base_url + "admin/demand/" + id)
        .then((response) => {
          this.demand.id = response.data.data.id;
          this.demand.user = response.data.data.user.name;
          this.demand.category = response.data.data.category.name;
          this.demand.area = response.data.data.area.area_name;
          this.demand.quantity_unit = response.data.data.quantity_unit.name;
          this.demand.title = response.data.data.title;
          this.demand.slug = response.data.data.slug;
          this.demand.description = response.data.data.description;
          this.demand.image_one = response.data.data.image_one_small;
          this.demand.image_two = response.data.data.image_two_small;
          this.demand.image_three = response.data.data.default_mid_image;
          this.demand.quantity = response.data.data.quantity;
          this.demand.quantity_unit = response.data.data.quantity_unit;
          this.demand.budget_type = response.data.data.budget_type;
          this.demand.minimum_budget = response.data.data.minimum_budget;
          this.demand.maximum_budget = response.data.data.maximum_budget;
          this.demand.fixed_budget = response.data.data.fixed_budget;
          this.demand.confirmed_amount = response.data.data.confirmed_amount;
          this.demand.confirmed_to = response.data.data.confirmed_to;
          this.demand.expire_date = response.data.data.expire_date;
          this.demand.total_like = response.data.data.total_like;
          this.demand.total_bid = response.data.data.total_bid;
          this.demand.bid_status = response.data.data.bid_status;
          this.demand.status = response.data.data.status;
          this.demand.sms_status = response.data.data.sms_status;
          this.demand.notification_status =
            response.data.data.notification_status;
        })
        .catch((error) => {
          console.log(error.response.data.errors);
        });
    },
  },
};
</script>