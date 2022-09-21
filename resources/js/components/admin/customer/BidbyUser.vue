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
        id="showBidList"
        class="modal animated fadeInRight custo-fadeInRight show"
        tabindex="-1"
        role="dialog"
        aria-labelledby="addContactModalTitle"
        aria-hidden="true"
      >
        <div class="modal-dialog custom-modal" role="document">
          
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Bid of Seller</h5>
                <button class="btn btn-default float-right" data-dismiss="modal">X</button>
              </div>
              <div class="modal-body">
                <div class="widget-content">
                    <div class="table-responsive" style="min-height:400px;">
                        <table class="table table-bordered table-hover mb-4">
                            <thead>
                                <tr>
                                    <th>Demand Title</th>
                                    <th>Buyer</th>
                                    <th>Seller</th>
                                    <th>Bid Date</th>
                                    <th>Due Date</th>
                                    <th>Confirm Amount</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="bid in bids.data" :key="bid.id" v-if="bids.data">
                                    <td><span v-html="bid.demand.title"></span></td>
                                    <td>{{ bid.demand.user.name }}</td>
                                    <td>{{ bid.user.name }}</td>
                                    <td>{{ bid.bid_date | dateToString }}</td>
                                    <td><span v-if="bid.work_due_date">{{ bid.work_due_date | dateToString }}</span></td>
                                    <td>
                                        <span v-if="bid.is_confirmed">Confirmed</span><span v-else>Not Confirmed</span>
                                    </td>
                                    
                                </tr>
                            </tbody>
                        </table>
                               
                         <div class="row">
                            <div class="col-md-12 text-center mb-10 mt-10">
                                <pagination v-if="bids.length > 0" :pageData="bids"></pagination>
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
            bids : [],
            keyword : '',
            isLoading: false,
            url : base_url
        }
    },

   
    mounted(){
        var _this = this
        // _this.getBuyerDemand()
        EventBus.$on('bid-list', function(id){
           _this.getSellerBid(id)
           $("#showBidList").modal("show");
        })
    },

    methods : {
        getSellerBid(id, page = 1){
            axios.get(base_url+'admin/seller/'+id+'/bid?page='+page+'&keyword='+this.keyword)
            .then(response => {
                if(response.data.status != 'error'){
                    this.bids = response.data
                }
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        pageClicked(pageNo){
            var vm = this;
            vm.getSellerBid(pageNo);
        },

        viewProfile(id){
            // console.log(value)
            EventBus.$emit('customer-show',id)
        },

        editCustomer(id){
            // console.log(id)
            EventBus.$emit('customer-update',id)
        },

        extendSubscription(id){
            // console.log(id)
            EventBus.$emit('extend-subscription',id)
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