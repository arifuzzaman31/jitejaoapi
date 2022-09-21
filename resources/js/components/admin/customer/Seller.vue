<template> 
<div class="widget-content">
    <div class="table-responsive" style="min-height:400px;">
    <div class="row">
        <div class="form-group col-md-3">
            <input type="text" class="form-control mb-2"  placeholder="Search By Name or Phone" @keyup="getSeller()" v-model="keyword">
        </div>
        <div class="form-group col-md-3">
          <select
            class="form-control"
            id="hstatus"
             @change="getSeller()"
             v-model = "by_status">
            <option value="">Choose By Status</option>
            <option value="1">Active</option>
            <option value="0">Inactive</option>
          </select>
      </div>
      <div class="form-group col-md-3">
          <multiselect
            v-model="area"
            placeholder="Search by Area"
            @input="getSeller()"
            :custom-label="customAreaLabel"
            track-by="id"
            :options="areas"
          ></multiselect>
      </div>
      <div class="form-group col-md-3">
            <button type="submit" class="btn btn-danger mt-1" @click="clearFilter()">Clear</button>
        </div>
    </div>
        <table class="table table-bordered table-hover mb-4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Total Post</th>
                    <th>Total Bid</th>
                    <th>Area</th>
                    <th>Phone</th>
                    <th>Subs Exp</th>
                    <th class="text-center">Badge</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="seller in sellers.data">
                    <td>{{ seller.id }}</td>
                    <td>{{ seller.name }}</td>
                    <td>{{ seller.user_information.total_post }}</td>
                    <td>{{ seller.user_information.total_bid }}</td>
                    <td>{{ seller.area.area_english_name }}</td>
                    <td>{{ seller.mobile_no }}</td>
                    <td>{{ seller.subscription_expired_at }}</td>
                    <td class="text-center">
                        <span class="text-success">{{ seller.seller_badge_title }}</span>
                    </td>
                    <td class="text-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-dark btn-sm dropdown-toggle dropdown-toggle-split" id="dropdownMenuReference4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-reference="parent">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuReference4">
                              <a class="dropdown-item" href="" @click.prevent="editCustomer(seller.id)">Edit</a>
                              <a class="dropdown-item" href="" @click.prevent="trashCustomer(seller.id)">Delete</a>
                              <a class="dropdown-item" href="" @click.prevent="viewProfile(seller.id)">View Profile</a>
                              <a class="dropdown-item" href="" @click.prevent="extendSubscription(seller.id)">Extend Subscription</a>
                              <a class="dropdown-item" href="" @click.prevent="addPoint(seller.id)">Add Point</a>
                              <a class="dropdown-item" href="" @click.prevent="assignCoupon(seller.id)">Assign Coupon</a>
                              <a class="dropdown-item" href="" @click.prevent="getBidBySeller(seller.id)">Bid List</a>
                              <a class="dropdown-item" href="" @click.prevent="getDemandBySeller(seller.id)">Demand List</a>
                            </div>
                          </div>
                    </td>
                </tr>
            </tbody>
        </table>
               
         <div class="row">
            <div class="col-md-12 text-center mb-10 mt-10">
                <pagination v-if="sellers.data" :pageData="sellers.meta"></pagination>
            </div>
         </div>
    </div>
         <div>
           <edit-customer></edit-customer>
           <view-profile></view-profile>
           <extend-subscription></extend-subscription>
           <bidby-user></bidby-user>
           <demand-byuser></demand-byuser>
           <assign-coupon></assign-coupon>
           <add-point></add-point>
       </div>                          
</div>
</template>
<script>

import { EventBus } from '../../../vue-assets';
import Mixin from "../../../mixin";
import Pagination from "../../pagination/Pagination";
import EditCustomer from "./EditCustomer";
import ViewProfile from "./ViewProfile";
import ExtendSubscription from "./ExtendSubscriptiondate";
import AssignCoupon from "./AssignCoupon";
import BidbyUser from "./BidbyUser";
import DemandByuser from "./DemandByuser";
import AddPoint from "./AddPoint";
import Multiselect from "vue-multiselect";

export default {
    mixins : [Mixin],
    components: {
       'pagination' : Pagination,
       'edit-customer' : EditCustomer, Multiselect, AssignCoupon,
       ViewProfile, ExtendSubscription, BidbyUser, DemandByuser,AddPoint
    },
    data(){
        return {
            sellers : [],
            keyword : '',
            by_status : '',
            areas : [],
            area : '',
            url : base_url
        }
    },

   
    mounted(){
        var _this = this
        _this.getSeller()
        _this.getAreaList()
        EventBus.$on('customer-created', function(){
           _this.getSeller()
        })
    },

    methods : {
        getSeller(page = 1){
            axios.get(base_url+'admin/get-seller?page='+page+'&area='+this.area.id+'&status='+this.by_status+'&keyword='+this.keyword)
            .then(response => {
                if(response.data.status != 'error'){
                    this.sellers = response.data
                }
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        pageClicked(pageNo){
            var vm = this;
            vm.getSeller(pageNo);
        },

        editCustomer(id){
            // console.log(id)
            EventBus.$emit('customer-update',id)
        },

        addPoint(id){
            EventBus.$emit('add-point',id)
        },

        viewProfile(id){
            EventBus.$emit('customer-show',id)
        },

        extendSubscription(id){
            EventBus.$emit('extend-subscription',id)
        },

        assignCoupon(id){
            EventBus.$emit('assign-coupon',id)
        },

        getBidBySeller(id){
            EventBus.$emit('bid-list',id)
        },

        getDemandBySeller(id){
            // console.log(id)
            EventBus.$emit('demand-list',id)
        },

        getAreaList() {
          axios
            .get(base_url + "admin/area-list?no_pagination=yes&status=1")
            .then((response) => {
              this.areas = response.data;
            });
        },

        customAreaLabel(name) {
          return `${name.area_name}`;
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
        },

        clearFilter(){
            this.by_status = ''
            this.area = ''
            this.keyword = ''
            this.getSeller()
        }
    }
}
</script>