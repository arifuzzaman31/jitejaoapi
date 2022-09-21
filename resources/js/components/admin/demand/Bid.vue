<template>
<div id="showBid" class="modal animated fadeInRight custo-fadeInRight show" tabindex="-1" role="dialog" aria-labelledby="addContactModalTitle" aria-hidden="true">
    <div class="modal-dialog custom-modal" role="document">
        <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title">Demand : {{ title }}</h5>
               <button class="btn btn-default" data-dismiss="modal">X</button>
          </div>
            <div class="modal-body">
               <div class="table-responsive" style="min-height:400px;">
				        <table class="table table-bordered table-hover mb-4">
				            <thead>
				                <tr>
				                    <th>ID</th>
				                    <th>Name</th>
				                    <th>Proposal</th>
				                    <th>Offer Amount</th>
				                    <th>Confirmed Amount</th>
				                    <th>Delivery Date</th>
				                    <th class="text-center">Bid Date</th>
				                    <th class="text-center">Action</th>
				                </tr>
				            </thead>
				            <tbody>
				                <tr v-for="bid in bids.data">
				                    <td>{{ bid.user_id }}</td>
				                    <td>{{ bid.demand.user.name }}</td>
				                    <td width="40%">{{ bid.proposal }}</td>
				                    <td>{{ bid.offer_amount }}</td>
				                    <td>{{ bid.confirmed_amount }}</td>
				                    <td>{{ bid.delivery_date | dateToString }}</td>
				                    <td class="text-center">
				                        <span>{{ bid.bid_date | dateToString }}</span>
				                    </td>
				                    <td class="text-center">
				                        <button @click.prevent="bidToTrash(bid.id)" class="btn btn-outline-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
				                    </td>
				                </tr>
				            </tbody>
				        </table>
				               
				         <div class="row">
				            <div class="col-md-12 text-center mb-10 mt-10">
				                <pagination v-if="bids" :pageData="bids"></pagination>
				            </div>
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

export default {
    mixins : [Mixin],
    components: {
       Pagination
    },
    data(){
        return {
            bids : [],
            title : '',
            url : base_url
        }
    },

   
    mounted(){
        var _this = this
        EventBus.$on('show-bid', function(demand_id){
            _this.clearField()
           _this.getBidByDemandId(demand_id)
           $("#showBid").modal('show')
        })
    },

    methods : {
        getBidByDemandId(demand_id,page = 1){
            axios.get(base_url+'admin/bid/'+demand_id+'?page='+page)
            .then(response => {
                if(response.data.status != 'error'){
                    this.bids = response.data
                    this.title = response.data.data[0].demand.title
                    // console.log(response.data)
                }
            })
            .catch(error => {
                console.log(error)
            })
        },

        pageClicked(pageNo){
            var vm = this;
            vm.getBidByDemandId(pageNo);
        },

        viewDemand(id){
    
            EventBus.$emit('demand-show',id)
        },

        bidToTrash(id){
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
                    .delete(base_url +'admin/bid/'+id)
                    .then((res) => {
                        this.successMessage(res.data);
                        EventBus.$emit('refresh-demand')
                    });
                }
            });
        },

        clearField(){
            this.bids = []
            this.title = ''
            this.url = base_url
        }
    }
}
</script>
<style scoped="">
    .fa {
        font-size : 1.6em;
    }
</style>