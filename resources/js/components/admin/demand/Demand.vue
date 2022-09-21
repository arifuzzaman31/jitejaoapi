<template>
  <div class="widget-content">
    <div class="table-responsive" style="min-height: 400px">
      <div class="row">
        <div class="form-group col-md-3">
          <input
            type="text"
            class="form-control mb-2"
            placeholder="Search By Title or Expire-Date"
            @keyup="getDemand()"
            v-model="keyword"
          />
        </div>
      </div>
      <table class="table table-bordered table-hover mb-4">
        <thead>
          <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Title</th>
            <!-- <th>Image</th> -->
            <th>Qty</th>
            <th>Budget</th>
            <th class="text-center">Exp. Date</th>
            <th class="text-center">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="demand in demands.data">
            <td>{{ demand.user.name }}</td>
            <td>{{ demand.category.name }}</td>
            <td>{{ demand.title }}</td>
            <!-- <td> demand.image_one </td> -->
            <td>{{ demand.quantity }} {{ demand.quantity_unit.name }}</td>
            <td>{{ demand.minimum_budget }}-{{ demand.maximum_budget }}</td>
            <td class="text-center">
              <span class="text-success">{{
                demand.expire_date | dateToString
              }}</span>
            </td>
            <td class="text-center">
              <div class="btn-group">
                <button
                  type="button"
                  class="btn btn-dark btn-sm dropdown-toggle dropdown-toggle-split"
                  id="dropdownMenuReference4"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                  data-reference="parent"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="feather feather-chevron-down"
                  >
                    <polyline points="6 9 12 15 18 9"></polyline>
                  </svg>
                </button>
                <div
                  class="dropdown-menu"
                  aria-labelledby="dropdownMenuReference4"
                >
                  <a
                    class="dropdown-item"
                    href=""
                    @click.prevent="viewBid(demand.id)"
                    >View Bid</a
                  >
                  <a
                    class="dropdown-item"
                    href=""
                    @click.prevent="viewDemand(demand.id)"
                    >View Demand</a
                  >
                  <a
                    class="dropdown-item"
                    href=""
                    @click.prevent="DemandtoTrash(demand.id)"
                    >Delete</a
                  >
                </div>
              </div>
            </td>
          </tr>
        </tbody>
      </table>

      <div class="row">
        <div class="col-md-12 text-center mb-10 mt-10">
          <pagination v-if="demands.meta" :pageData="demands"></pagination>
        </div>
      </div>
    </div>
    <div>
      <show-bid></show-bid>
      <show-demand :front_url="front_url"></show-demand>
    </div>
  </div>
</template>
<script>
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";
import Pagination from "../../pagination/Pagination";
import ShowBid from "./Bid.vue";
import ShowDemand from "./ShowDemand.vue";

export default {
  mixins: [Mixin],
  props: ["front_url"],
  components: {
    Pagination,
    ShowDemand,
    ShowBid,
  },
  data() {
    return {
      demands: [],
      keyword: "",
      by_status: "",
      url: base_url,
    };
  },

  mounted() {
    var _this = this;
    _this.getDemand();
    EventBus.$on("refresh-demand", function () {
      _this.getDemand();
    });
  },

  methods: {
    getDemand(page = 1) {
      axios
        .get(
          base_url +
            "admin/get-all-demand?page=" +
            page +
            "&keyword=" +
            this.keyword
        )
        .then((response) => {
          if (response.data.status != "error") {
            this.demands = response.data;
          }
        })
        .catch((error) => {
          console.log(error.response.data.errors);
        });
    },

    pageClicked(pageNo) {
      var vm = this;
      vm.getDemand(pageNo);
    },

    viewDemand(id) {
      // console.log(value)
      EventBus.$emit("demand-show", id);
    },

    viewBid(id) {
      // console.log(id)
      EventBus.$emit("show-bid", id);
    },

    DemandtoTrash(id) {
      Swal.fire(
        {
          title: "Are you sure ?",
          text: "The picture will be removed!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!",
        },
        () => {}
      ).then((result) => {
        if (result.value) {
          axios.delete(base_url + "admin/demand/" + id).then((res) => {
            this.successMessage(res.data);
            EventBus.$emit("refresh-demand");
          });
        }
      });
    },
  },
};
</script>