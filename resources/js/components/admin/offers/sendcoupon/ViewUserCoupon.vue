<template>
	
<div class="widget-content">
    <div class="table-responsive" style="min-height:400px;">
    <div class="row">
        <div class="form-group col-md-3">
            <input type="text" class="form-control mb-2"  placeholder="Search By Code or UserID" @keyup="getUserCoupon()" v-model="keyword">
        </div>
        <!-- <div class="form-group col-md-3">
          <select
            class="form-control"
            id="hstatus"
             @change="getUserCoupon()"
             v-model = "status">
            <option value="">Choose By Status</option>
            <option value="1">Active</option>
            <option value="0">Inactive</option>
          </select>
      </div> -->
     
      <div class="form-group col-md-2">
            <button type="submit" class="btn btn-danger mt-1" @click="clearFilter()">Clear</button>
        </div>
    </div>
        <table class="table table-bordered table-hover mb-4">
            <thead>
                <tr>
                    <th>SL</th>
                    <th>Coupon Code</th>
                    <th>Username</th>
                    <th>User ID</th>
                    <th>Phone</th>
                    <th class="text-center">Valid Date</th>
                    <th>is Used</th>
                    <th>is Applied</th>
                    <th class="text-center">Created at</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="coupon in user_coupons.data">
                    <td>{{ coupon.id }}</td>
                    <td>{{ coupon.coupon_code }}</td>
                    <td>{{ coupon.user.name }}</td>
                    <td>{{ coupon.user_id }}</td>
                    <td>{{ coupon.user.mobile_no }}</td>
                    <td class="text-center">
                        <span class="text-success">{{ coupon.valid_date | dateToString }}</span>
                    </td>
                    <td>
                    	<span v-if="coupon.is_applied == 1">Yes</span>
                        <span v-else>No</span>
                    </td>
                    <td>
                        <span v-if="coupon.is_used == 1">Yes</span>
                        <span v-else>No</span>
                    </td>
                    <td class="text-center">
                        <span class="text-success">{{ coupon.created_at | dateToString }}</span>
                    </td>
                    
                    <td class="text-center">
                        <a href="javascript:void(0)" @click.prevent="coupontoTrash(coupon.id)"><i class="fa fa-trash"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
               
         <div class="row">
            <div class="col-md-12 text-center mb-10 mt-10">
                <pagination  :pageData="user_coupons"></pagination>
            </div>
         </div>
    </div> 
                          
</div>
</template>
<script>

import { EventBus } from '../../../../vue-assets';
import Mixin from "../../../../mixin";
import Pagination from "../../../pagination/Pagination";


export default {
    mixins : [Mixin],
    components: { Pagination },
    data(){
        return {
            user_coupons : [],
            keyword : '',
            status : '',
            button_name : 'Update',
            url : base_url
        }
    },

   
    mounted(){
        var _this = this
        this.getUserCoupon()
        EventBus.$on('usercoupon-created', function(){
            _this.getUserCoupon()
        })
    },

    methods : {
        getUserCoupon(page = 1){
            axios.get(base_url+'admin/user-coupon-list?page='+page+'&keyword='+this.keyword+'&status='+this.status)
            .then(response => {
                this.user_coupons = response.data
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        pageClicked(pageNo){
            var vm = this;
            vm.getUserCoupon(pageNo);
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
                    .delete(base_url +'admin/send-coupon/'+id)
                    .then((res) => {
                        this.successMessage(res.data);
                        EventBus.$emit('usercoupon-created')
                    });
                }
            });
        },

        clearFilter(){
            this.status = ''
            this.keyword = ''
            this.getUserCoupon()
        }
    }
}
</script>
<style scoped="">
    .fa {
        font-size : 1.5em;
        color : #f34b4bb5;
    }
</style>