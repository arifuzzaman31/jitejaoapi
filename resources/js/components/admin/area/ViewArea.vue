<template>
  <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    <div class="widget widget-table-two">
      <div class="widget-content">
        <div class="table-responsive">
          <table class="table text-center">
            <thead>
              <tr>
                <th class="th-content">Name</th>
                <th class="th-content">English Name</th>
                <th class="th-content">Status</th>
                <th class="th-content">Action</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="area in areas.data" :key="area.id">
                <td class="td-content">{{ area.area_name }}</td>
                <td class="td-content">{{ area.area_english_name }}</td>
                <td class="td-content">
                  <span
                    :class="
                      area.status == 1
                        ? 'badge badge-success'
                        : 'badge badge-warning'
                    "
                  >
                    {{ area.status == 1 ? "Active" : "Inactive" }}</span
                  >
                </td>
                <td class="td-content text-center">
                  <a
                    @click="Editarea(area)"
                    class="btn btn-warning rounded-circle"
                    type="button"
                    title="Edit"
                  >
                    <i class="fa fa-edit"></i>
                  </a>

                  <a
                    @click="deleteArea(area.id)"
                    class="btn btn-danger rounded-circle"
                    type="button"
                    title="Delete"
                    ><i class="fa fa-trash"></i
                  ></a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <div>
          <pagination :pageData="areas"></pagination>
        </div>
      </div>
    </div>
    <div>
      <update-area />
    </div>
  </div>
</template>
<script>
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";
import Updatearea from "./EditArea";
import Pagination from "../../pagination/Pagination";

export default {
  components: {
    pagination: Pagination,
    "update-area": Updatearea,
  },
  data() {
    return {
      keyword: "",
      areas: [],
      url: base_url,
    };
  },

  mounted() {
    var _this = this;
    _this.getArea();
    EventBus.$on("area-created", function () {
      _this.getArea();
    });
  },

  methods: {
    getArea(page = 1) {
      axios
        .get(base_url + "admin/area-list?page=" + page)
        .then((response) => {
          this.areas = response.data;
        })
        .catch((error) => {
          console.log("Some error Occure!");
        });
    },

    Editarea(value) {
      EventBus.$emit("update-area", value);
    },

    deleteArea(id) {
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
          axios.delete(base_url + "admin/area/" + id).then((res) => {
            EventBus.$emit("area-created");
            this.successMessage(res.data);
          });
        }
      });
    },

    pageClicked(pageNo) {
      var vm = this;
      vm.getArea(pageNo);
    },
  },
};
</script>