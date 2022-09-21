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
          @keyup="getCategory()"
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
                <th>Category Name</th>
                <th class="">Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="(category, index) in categories.data"
                :key="category.id"
              >
                <td class="text-center">{{ index + 1 }}</td>
                <td class="text-primary">{{ category.name }}</td>
                <td class="">
                  <span
                    class="shadow-none badge outline-badge-primary"
                    v-if="category.status == 1"
                    >Active</span
                  >
                  <span class="shadow-none badge outline-badge-danger" v-else
                    >inactive</span
                  >
                </td>
                <td>
                  <a
                    class="btn btn-dark mb-2 mr-2 rounded-circle"
                    @click="edit(category.id)"
                    title="Edit"
                    ><i class="fa fa-edit"></i
                  ></a>
                  <a
                    class="btn btn-danger mb-2 mr-2 rounded-circle"
                    @click="movetoTrash(category.id)"
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
        <pagination :pageData="categories"></pagination>
      </div>
    </div>

    <category-edit></category-edit>
  </div>
</template>


<script>
// Import component
import Loading from "vue-loading-overlay";
// Import stylesheet
import "vue-loading-overlay/dist/vue-loading.css";
import { EventBus } from "../../../../vue-assets";
import Pagination from "../../../pagination/Pagination";
import CategoryEdit from "./EditCategory";
import Mixin from "../../../../mixin";
export default {
  mixins: [Mixin],
  components: {
    Loading,
    CategoryEdit,
    pagination: Pagination,
  },
  data() {
    return {
      categories: [],
      keyword: "",
      isLoading: false,
    };
  },
  mounted() {
    this.getCategory();
    var _this = this;
    EventBus.$on("created-category", function () {
      _this.getCategory();
    });
  },
  methods: {
    getCategory(page = 1) {
      this.isLoading = true;
      axios
        .get(
          base_url +
            "admin/category-list?page=" +
            page +
            "&keyword=" +
            this.keyword
        )
        .then((response) => {
          this.categories = response.data;
          this.isLoading = false;
        });
    },
    edit(value) {
      EventBus.$emit("edit-category", value);
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
          axios.delete(base_url + "admin/category/" + id).then((res) => {
            this.successMessage(res.data);
            this.getCategory();
          });
        }
      });
    },
    pageClicked(page) {
      this.getCategory(page);
    },
  },
};
</script>