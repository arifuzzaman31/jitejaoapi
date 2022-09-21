<template> 
<div class="widget-content">
    <div class="table-responsive" style="min-height:400px;">
    <div class="row">
        <div class="form-group col-md-3">
            <input type="text" class="form-control mb-2"  placeholder="Search By UserID or PaymentID" @keyup="getReport()" v-model="keyword">
        </div>
        <div class="form-group col-md-3">
            <date-picker v-model="range" placeholder="Select Date Range" format="YYYY-MM-DD" @change="setDate()" range></date-picker>
        </div>

        <div class="form-group col-md-2">
          <select
            class="form-control"
            id="hstatus"
             @change="getReport()"
             v-model = "by_mode">
            <option value="">Choose By Mode</option>
            <option value="1">Online</option>
            <option value="0">Offline</option>
          </select>
      </div>
      <div class="form-group col-md-2">
          <select
            class="form-control"
            id="hstatus"
             @change="getReport()"
             v-model = "by_status">
            <option value="">Choose By Status</option>
            <option value="1">Paid</option>
            <option value="0">Unpaid</option>
          </select>
      </div>
     
      <div class="form-group col-md-2">
            <button type="submit" class="btn btn-danger mt-1" @click="clearFilter()">Clear</button>
        </div>
    </div>
        <table class="table table-bordered table-hover mb-4">
            <thead>
                <tr>
                    <th>Payment id</th>
                    <th>Name</th>
                    <th>user id</th>
                    <th>Amount/m</th>
                    <th>Month</th>
                    <th>Amount</th>
                    <th>Discount</th>
                    <th>Final Amount</th>
                    <th>Mode</th>
                    <th>Extend From</th>
                    <th>Extend to</th>
                    <th class="text-center">Tran.Date</th>
                    <th class="text-center">Status</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="payment in reports.data" :key="payment.id">
                    <td>{{ payment.id }}</td>
                    <td>{{ payment.user.name }}</td>
                    <td>{{ payment.user_id }}</td>
                    <td>{{ payment.amount_per_month }}</td>
                    <td>{{ payment.total_month }}</td>
                    <td>{{ payment.total_amount }}</td>
                    <td>{{ payment.total_discount }}</td>
                    <td>{{ payment.final_amount }}</td>
                    <td>{{ payment.payment_mode_text }}</td>
                    <td>{{ payment.extend_from_date }}</td>
                    <td>{{ payment.extend_to_date }}</td>
                    <td class="text-center">
                        <span class="text-success" v-if="payment.transection_date_time">{{ payment.transection_date_time | dateToString }}</span>
                    </td>
                    <td class="text-center">
                        <span :class="payment.payment_status_text == 'failed' ? 'text-danger' : 'text-success'">{{ payment.payment_status_text }}</span>
                    </td>
                    <td class="text-center">
                        <div class="btn-group">
                            
                            <button type="button" class="btn btn-dark btn-sm dropdown-toggle dropdown-toggle-split" id="dropdownMenuReference4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-reference="parent">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuReference4">
                              <a class="dropdown-item" href="#" @click.prevent="viewPayment(payment.id)">View</a>
                              <a class="dropdown-item" href="#" @click.prevent="EditPayment(payment.id)">Edit</a>
                              <!-- <a class="dropdown-item" href="#" @click.prevent="PaymenttoTrash(payment.id)">Delete</a> -->
                            </div>
                        </div>
                    </td>
                </tr>
               
            </tbody>
        </table>
               
         <div class="row">
            <div class="col-md-12 text-center mb-10 mt-10">
                <pagination v-if="reports.data" :pageData="reports.meta"></pagination>
                <div class="float-right">
                    <a type="button" :href="url+'admin/payment-report?action=print&keyword='+keyword+'&user='+user+'&mode='+by_mode+'&status='+by_status+'&date_range='+date_range" class="btn btn-sm btn-success">Print</a>
                    <a type="button" :href="url+'admin/payment-report?action=pdf&keyword='+keyword+'&user='+user+'&mode='+by_mode+'&status='+by_status+'&date_range='+date_range" class="btn btn-sm btn-warning">PDF</a>
                </div>
            </div>
         </div>
    </div>     
    <show-payment />                     
    <edit-payment />                     
</div>
</template>
<script>

import { EventBus } from '../../../vue-assets';
import Mixin from "../../../mixin";
import Pagination from "../../pagination/Pagination";
import ShowPayment from "./ShowPayment.vue";
import EditPayment from "./EditPayment.vue";
import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';

export default {
    mixins : [Mixin],
    components: {
       Pagination, 
       ShowPayment,
       EditPayment,
       DatePicker
    },
    data(){
        return {
            reports : [],
            users : [],
            user : '',
            date_range : '',
            range : '',
            by_status : '',
            by_mode : '',
            keyword : '',
            url : base_url
        }
    },

   
    mounted(){
        var _this = this
        _this.getUserList()
        _this.getReport()
        EventBus.$on('payment-update',function(){
            _this.getReport()
        })
    },

    methods : {
        getReport(page = 1){
            axios.get(base_url+'admin/get-all-payment?page='+page+'&keyword='+this.keyword+'&mode='+this.by_mode+'&status='+this.by_status+'&date_range='+this.date_range)
            .then(response => {
                if(response.data.status != 'error'){
                    this.reports = response.data
                }
                // console.log(response.data)
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        setDate(){

            let from = JSON.stringify(this.range[0]);
            let to = JSON.stringify(this.range[1]);
            from = from.slice(1,11);
            to = to.slice(1,11);
            // console.log(to)
            this.date_range = from+'to'+to;
            this.getReport()
        },

        pageClicked(pageNo){
            var vm = this;
            vm.getReport(pageNo);
        },

        getUserList() {
          axios
            .get(base_url + "admin/user/list")
            .then((response) => {
              this.users = response.data;
            });
        },

        userLabel(name) {
          return `${name.name}`;
        },

        EditPayment(id){
            EventBus.$emit('edit-payment',id)
        },

        viewPayment(id){
            // console.log(id)
            EventBus.$emit('show-payment-details',id)
        },

        DemandtoTrash(id){
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
                    .delete(base_url +'admin/demand/'+id)
                    .then((res) => {
                        this.successMessage(res.data);
                        EventBus.$emit('refresh-demand')
                    });
                }
            });
        },

        clearFilter(){
            this.reports = []
            this.users = []
            this.user = ''
            this.date_range = ''
            this.range = ''
            this.by_status = ''
            this.by_mode = ''
            this.keyword = ''
            this.getReport()
        }
    }
}
</script>