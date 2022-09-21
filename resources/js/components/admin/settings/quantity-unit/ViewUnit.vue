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
      <div class="col-md-6 mb-1">
        <input
          type="text"
          class="form-control"
          v-model="keyword"
          @keyup="getUnit()"
          placeholder="Please Search By Name"
        />
      </div>
    </div>

    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive">
          <table class="table mb-4">
            <thead>
              <tr>
                <th class="text-center">#</th>
                <th>Unit Name</th>
                <th>Unit English Name</th>
                <th class="">Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(unit, index) in units.data" :key="unit.id">
                <td class="text-center">{{ index + 1 }}</td>
                <td class="text-primary">{{ unit.name }}</td>
                <td class="text-primary">{{ unit.english_name }}</td>
                <td class="">
                  <span
                    class="shadow-none badge outline-badge-primary"
                    v-if="unit.status == 1"
                    >Active</span
                  >
                  <span class="shadow-none badge outline-badge-danger" v-else
                    >Inactive</span
                  >
                </td>
                <td>
                  <a
                    class="btn btn-dark mb-2 mr-2 rounded-circle"
                    @click="edit(unit)"
                    title="Edit"
                    ><i class="fa fa-edit"></i
                  ></a>
                  <a
                    class="btn btn-danger mb-2 mr-2 rounded-circle"
                    @click="movetoTrash(unit.id)"
                    title="Delete"
                    ><i class="fa fa-trash" aria-hidden="true"></i
                  ></a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-12 text-center">
        <!-- include pagination here  -->
        <pagination :pageData="units"></pagination>
      </div>
    </div>

    <unit-edit></unit-edit>
  </div>
</template>


<script>
// Import component
import Loading from "vue-loading-overlay";
// Import stylesheet
import "vue-loading-overlay/dist/vue-loading.css";
import { EventBus } from "../../../../vue-assets";
import Pagination from "../../../pagination/Pagination";
import UnitEdit from "./EditUnit";
import Mixin from "../../../../mixin";
export default {
  mixins: [Mixin],
  components: {
    Loading,
    UnitEdit,
    pagination: Pagination,
  },
  data() {
    return {
      units: [],
      keyword: "",
      isLoading: false,
    };
  },
  mounted() {
    this.getUnit();
    var _this = this;
    EventBus.$on("created-unit", function () {
      _this.getUnit();
    });
  },
  methods: {
    getUnit(page = 1) {
      this.isLoading = true;
      axios
        .get(
          base_url +
            "admin/quantity-unit-list?page=" +
            page +
            "&keyword=" +
            this.keyword
        )
        .then((response) => {
          this.units = response.data;
          this.isLoading = false;
        });
    },
    edit(value) {
      EventBus.$emit("edit-unit", value);
    },
    movetoTrash(id) {
      Swal.fire(
        {
          title: "Are you sure ?",
          text: "You won't be able to revert this!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!",
        },
        () => {}
      ).then((result) => {
        if (result.value) {
          axios.delete(base_url + "admin/quantity-unit/" + id).then((res) => {
            this.successMessage(res.data);
            this.getUnit();
          });
        }
      });
    },
    pageClicked(page) {
      this.getUnit(page);
    },
  },
};
</script>