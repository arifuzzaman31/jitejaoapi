<template>
<div class="widget-content">
    <div class="table-responsive" style="min-height: 400px">
      <div class="row">
        <div class="form-group col-md-3">
          <input
            type="text"
            class="form-control mb-2"
            placeholder="Search By Title or Expire-Date"
            @keyup="getWithdrawRequest()"
            v-model="keyword"
          />
        </div>
       
        <div class="form-group col-md-2">
          	<button type="button" @click="clearNilam()"  class="btn btn-danger px-3"> Clear</button>
        </div>
      </div>
      <table class="table table-bordered table-hover mb-4">
        <thead>
          <tr>
            <th>SL</th>
            <th>User</th>
            <th>Req. Amount</th>
            <th>Request Date</th>
            <th>Note</th>
            <th>Status</th>
            <th>Paid By</th>
            <th>Payment Method</th>
            <th class="text-center">Payment Date</th>
            <th class="text-center">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(withdraw,index) in all_request.data" :key="index">
            <td>{{ index + 1 }}</td>
            <td>{{ withdraw.user.name }}</td>
            <td>{{ withdraw.request_amount }}</td>
            <td>{{ withdraw.request_date }}</td>
            <td>{{ withdraw.note }}</td>
            <td>
            	<span v-if="withdraw.status == 0" class="text-danger">
                Non Paid
              </span>
              <span v-else class="text-success">
                Paid
              </span>
            </td>
            <td>{{ withdraw.admin.name }}</td>
            <td>{{ withdraw.payment_method }}</td>
            <td>{{ withdraw.return_date }}</td>
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
                    href="#" @click.prevent="withdrawUpdate(withdraw)"
                    >Update</a
                  >
                  
                  <a
                    class="dropdown-item"
                    href="#"
                    @click.prevent="withdrawtoTrash(withdraw.id)"
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
          <pagination v-if="all_request.meta" :pageData="all_request.meta"></pagination>
        </div>
      </div>
    </div>
      <update-request />
  </div>
</template>
<script>
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";
import Pagination from "../../pagination/Pagination";
import UpdateRequest from "./UpdateRequest";

export default {
  mixins: [Mixin],
  props: ["front_url"],
  components: {
    'update-request' : UpdateRequest,
    'pagination' : Pagination,
  },
  data() {
    return {
      all_request: [],
      keyword: "",
      url: base_url,
    };
  },

  mounted() {
    var _this = this;
    _this.getWithdrawRequest();
    EventBus.$on("withdraw-request", function () {
      _this.getWithdrawRequest();
    });
  },

  methods: {
    getWithdrawRequest(page = 1) {
      axios
        .get(
          base_url +
            "admin/get-withdraw-request?page=" +
            page +
            "&keyword=" +
            this.keyword
        )
        .then((response) => {
            this.all_request = response.data;
        })
        .catch((error) => {
          console.log(error.response.data.errors);
        });
    },

    pageClicked(pageNo) {
      var vm = this;
      vm.getWithdrawRequest(pageNo);
    },

    withdrawUpdate(data){
      EventBus.$emit("withdraw-update-request", data);
    },

    withdrawtoTrash(id) {
      Swal.fire(
        {
          title: "Are you sure ?",
          text: "The Request will be removed!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!",
        },
        () => {}
      ).then((result) => {
        if (result.value) {
          axios.delete(base_url + "admin/withdraw/" + id).then((res) => {
            this.successMessage(res.data);
            EventBus.$emit("refresh-nilam");
          });
        }
      });
    },

    clearNilam(){
    	this.all_request = []
	    this.keyword = ""
	   
	    this.getWithdrawRequest()
    }
  },
};
</script>