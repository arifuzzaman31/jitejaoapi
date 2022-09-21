<template>
<div class="widget-content">
    <div class="table-responsive" style="min-height: 400px">
      <div class="row">
        <div class="form-group col-md-3">
          <input
            type="text"
            class="form-control mb-2"
            placeholder="Search By Title or Expire-Date"
            @keyup="getNilam()"
            v-model="keyword"
          />
        </div>
        <div class="form-group col-md-2">
          	<select id="dtype" @change="getNilam()" class="form-control" v-model="condition">
	            <option selected value="">Choose by Condition</option>
	            <option value="1">নতুন</option>
	            <option value="0">পূরাতন</option>
	        </select>
        </div>
        <div class="form-group col-md-2">
          	<button type="button" @click="clearNilam()"  class="btn btn-danger px-3"> Clear</button>
        </div>
      </div>
      <table class="table table-bordered table-hover mb-4">
        <thead>
          <tr>
            <th>User</th>
            <th>Title</th>
            <th>Base Price</th>
            <th>Condition</th>
            <th>Status</th>
            <th class="text-center">Exp. Date</th>
            <th class="text-center">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="nilam in all_nilam.data">
            <td>{{ nilam.user.name }}</td>
            <td>{{ nilam.title }}</td>
            <td>{{ nilam.base_price }}</td>
            <td>{{ nilam.product_condition }}</td>
            <td>
            	<span v-if="nilam.status == 'Active'" class="text-success">
                {{ nilam.status }}
              </span>
              <span v-else class="text-danger">
                {{ nilam.status }}
              </span>
            </td>
            <td class="text-center">
              <span class="text-success">{{
                nilam.expire_date
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
                    :href="url+'admin/nilam/bid/'+nilam.id"
                    >View Bid</a
                  >
                  
                  <a
                    class="dropdown-item"
                    href=""
                    @click.prevent="NilamtoTrash(nilam.id)"
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
          <pagination v-if="all_nilam.meta" :pageData="all_nilam.meta"></pagination>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";
import Pagination from "../../pagination/Pagination";

export default {
  mixins: [Mixin],
  props: ["front_url"],
  components: {
    'pagination' : Pagination,
  },
  data() {
    return {
      all_nilam: [],
      keyword: "",
      condition: "",
      url: base_url,
    };
  },

  mounted() {
    var _this = this;
    _this.getNilam();
    EventBus.$on("refresh-nilam", function () {
      _this.getNilam();
    });
  },

  methods: {
    getNilam(page = 1) {
      axios
        .get(
          base_url +
            "admin/get-nilam?page=" +
            page +
            "&keyword=" +
            this.keyword+
            	"&condition=" +
            		this.condition+
              "&category=pending"
        )
        .then((response) => {
          if (response.data.status != "error") {
            this.all_nilam = response.data;
            // console.log(response.data)
          }
        })
        .catch((error) => {
          console.log(error.response.data.errors);
        });
    },

    pageClicked(pageNo) {
      var vm = this;
      vm.getNilam(pageNo);
    },

    NilamtoTrash(id) {
      Swal.fire(
        {
          title: "Are you sure ?",
          text: "The Nilam will be removed!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!",
        },
        () => {}
      ).then((result) => {
        if (result.value) {
          axios.delete(base_url + "admin/nilam/" + id).then((res) => {
            this.successMessage(res.data);
            EventBus.$emit("refresh-nilam");
          });
        }
      });
    },

    clearNilam(){
    	this.all_nilam = []
	    this.keyword = ""
	    this.condition = ""
	    this.getNilam()
    }
  },
};
</script>