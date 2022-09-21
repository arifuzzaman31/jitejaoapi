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
        id="showDemandList"
        class="modal animated fadeInRight custo-fadeInRight show"
        tabindex="-1"
        role="dialog"
        aria-labelledby="addContactModalTitle"
        aria-hidden="true"
      >
        <div class="modal-dialog custom-modal" role="document">
          
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Demand of Buyer</h5>
                <button class="btn btn-default float-right" data-dismiss="modal">X</button>
              </div>
              <div class="modal-body">
                <div class="widget-content">
                    <div class="table-responsive" style="min-height:400px;">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control mb-2"  placeholder="Search By Name or Phone" @keyup="getBuyerDemand()" v-model="keyword">
                            </div>
                        </div>
                        <table class="table table-bordered table-hover mb-4">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Image</th>
                                    <th>Buyer</th>
                                    <th>Category</th>
                                    <th>Quantity</th>
                                    <th>Unit</th>
                                    <th>Expire Date</th>
                                    <th>Total Bid</th>
                                    <th class="text-center">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="demand in demands.data">
                                    <td>{{ demand.title }}</td>
                                    <td>{{ demand.image_one }}</td>
                                    <td>{{ demand.user.name }}</td>
                                    <td>{{ demand.category.english_name }}</td>
                                    <td>{{ demand.quantity }}</td>
                                    <td>{{ demand.quantity_unit.english_name }}</td>
                                    <td>{{ demand.expire_date | dateToString }}</td>
                                    <td>{{ demand.total_bid }}</td>
                                    <td class="text-center">
                                        <span v-if="demand.bid_status > 0">Confirmed</span><span v-else>Not Confirmed</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                               
                         <div class="row">
                            <div class="col-md-12 text-center mb-10 mt-10">
                                <pagination v-if="demands.length > 0" :pageData="demands"></pagination>
                            </div>
                         </div>
                    </div>
                   <!-- <div>
                       
                   </div> -->      
                                          
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
    </div>
  </div>
</template>
<script>

import { EventBus } from '../../../vue-assets';
import Mixin from "../../../mixin";
import Pagination from "../../pagination/Pagination";

// Import component
import Loading from "vue-loading-overlay";
import "vue-loading-overlay/dist/vue-loading.css";

export default {
    mixins : [Mixin],
    components: {
       Pagination, Loading
    },
    data(){
        return {
            demands : [],
            isLoading: false,
            keyword : '',
            by_status : '',
            url : base_url
        }
    },

   
    mounted(){
        var _this = this
        // _this.getBuyerDemand()
        EventBus.$on('demand-list', function(id){
           _this.getBuyerDemand(id)
           $("#showDemandList").modal("show");
        })
    },

    methods : {
        getBuyerDemand(id, page = 1){
            axios.get(base_url+'admin/buyer/'+id+'/demand?page='+page+'&keyword='+this.keyword)
            .then(response => {
                if(response.data.status != 'error'){
                    this.demands = response.data
                }
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        pageClicked(pageNo){
            var vm = this;
            vm.getBuyer(pageNo);
        },

        trashCustomer(id){
            Swal.fire({
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
                axios
                    .delete(base_url +'admin/customer/'+id)
                    .then((res) => {
                        this.successMessage(res.data);
                        EventBus.$emit('customer-created')
                    });
                }
            });
        }
    }
}
</script>