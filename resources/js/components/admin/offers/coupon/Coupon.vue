<template>
<div class="widget-content">
    <div class="table-responsive" style="min-height:400px;">
    <div class="row">
        <div class="form-group col-md-3">
            <input type="text" class="form-control mb-2"  placeholder="Search By Code or Exp.Date" @keyup="getCoupon()" v-model="keyword">
        </div>
        <div class="form-group col-md-3">
          <select
            class="form-control"
            id="hstatus"
             @change="getCoupon()"
             v-model = "status">
            <option value="">Choose By Status</option>
            <option value="1">Active</option>
            <option value="0">Inactive</option>
          </select>
      </div>
     
      <div class="form-group col-md-2">
            <button type="submit" class="btn btn-danger mt-1" @click="clearFilter()">Clear</button>
        </div>
    </div>
        <table class="table table-bordered table-hover mb-4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Coupon Code</th>
                    <th>Coupon Type</th>
                    <th>Amount Type</th>
                    <th>Amount</th>
                    <th>Amount Limit</th>
                    <th class="text-center">Valid Date</th>
                    <th class="text-center">Status</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="coupon in coupons.data">
                    <td>{{ coupon.id }}</td>
                    <td>{{ coupon.coupon_code }}</td>
                    <td>
                        <span v-if="coupon.coupon_type == 0">Specific User</span>
                        <span v-else>All User</span>
                    </td>
                    <td>
                        <span v-if="coupon.amount_type == 1">Amount</span>
                        <span v-else>Percentage</span>
                    </td>
                    <td>{{ coupon.amount }}</td>
                    <td>{{ coupon.max_amount_limit }}</td>
                    <td class="text-center">
                        <span class="text-success">{{ coupon.valid_date | dateToString }}</span>
                    </td>
                    <td class="text-center">
                        <span v-if="coupon.status == 1">Active</span>
                        <span class="text-warning" v-else>Inactive</span>
                    </td>
                    <td class="text-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-dark btn-sm dropdown-toggle dropdown-toggle-split" id="dropdownMenuReference4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-reference="parent">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuReference4">
                              <a class="dropdown-item" href="" @click.prevent="EditCoupon(coupon.id)">Edit</a>
                              <a class="dropdown-item" href="" @click.prevent="coupontoTrash(coupon.id)">Delete</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
               
         <div class="row">
            <div class="col-md-12 text-center mb-10 mt-10">
                <pagination  :pageData="coupons"></pagination>
            </div>
         </div>
    </div>

    <div>
        <edit-coupon />
    </div>  
                          
</div>
</template>
<script>

import { EventBus } from '../../../../vue-assets';
import Mixin from "../../../../mixin";
import Pagination from "../../../pagination/Pagination";
import EditCoupon from "./EditCoupon";

export default {
    mixins : [Mixin],
    components: {
       Pagination, EditCoupon
    },
    data(){
        return {
            coupons : [],
            keyword : '',
            status : '',
            button_name : 'Update',
            url : base_url
        }
    },

   
    mounted(){
        var _this = this
        this.getCoupon()
        EventBus.$on('coupon-created', function(){
            _this.getCoupon()
        })
    },

    methods : {
        getCoupon(page = 1){
            axios.get(base_url+'admin/coupon-list?page='+page+'&keyword='+this.keyword+'&status='+this.status)
            .then(response => {
                this.coupons = response.data
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        pageClicked(pageNo){
            var vm = this;
            vm.getCoupon(pageNo);
        },

        EditCoupon(id){
            // alert(id)
            EventBus.$emit('edit-coupon',id)
        },

        coupontoTrash(id){
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
                    .delete(base_url +'admin/coupon/'+id)
                    .then((res) => {
                        this.successMessage(res.data);
                        EventBus.$emit('coupon-created')
                    });
                }
            });
        },

        clearFilter(){
            this.status = ''
            this.keyword = ''
            this.getCoupon()
        }
    }
}
</script>