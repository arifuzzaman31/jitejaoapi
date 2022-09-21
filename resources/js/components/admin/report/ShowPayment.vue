<template>
    <div id="showPaymentModal" class="modal animated fadeInRight custo-fadeInRight show" tabindex="-1" role="dialog" aria-labelledby="addContactModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">View Payment</h5>
                    <button class="btn btn-outline-danger" data-dismiss="modal">X</button>
              </div>
                <div class="modal-body">
                   <div class="card mb-3">
                      <div class="card-header bg-transparent my-2">
                          <div class="card-body text-center">
                            <h5 class="card-title">{{ payment.user }}</h5>
                          </div>
                      </div>

                          <div class="d-flex justify-content-around mb-4">
                            
                             <div class="card" style="width: 18rem;">
                              <ul class="list-group list-group-flush">
                                <li class="list-group-item"><strong>Total Month :</strong> {{ payment.total_month }}</li>
                                <li class="list-group-item"><strong>Amount/Month :</strong> {{ payment.amount_per_month }}</li>
                                <li class="list-group-item"><strong>Total Amount:</strong> {{ payment.total_amount }}</li>
                                <li class="list-group-item"><strong>Discount For Month :</strong> {{ payment.discount_for_month }}</li>
                                <li class="list-group-item"><strong>Coupon Discount :</strong> {{ payment.coupon_discount }}</li>
                                <li class="list-group-item"><strong>Total Discount :</strong> {{ payment.total_discount }}</li>
                                <li class="list-group-item"><strong>Coupon ID :</strong> {{ payment.coupon_id }}</li>
                                <li class="list-group-item"><strong>Subscription Plan :</strong> {{ payment.subscription_plan_id }}</li>
                                
                              </ul>
                            </div>
                          
                            <div class="card" style="width: 18rem;">
                              <ul class="list-group list-group-flush">
                                <li class="list-group-item"><strong>Final Amount :</strong> {{ payment.final_amount }}</li>
                                <li class="list-group-item"><strong>SSL Store Amount :</strong> {{ payment.ssl_store_amount }}</li>
                                <li class="list-group-item"><strong>Payment Mode :</strong> {{ payment.payment_mode }}</li>
                                <li class="list-group-item"><strong>Admin :</strong> {{ payment.admin_id }}</li>
                                <li class="list-group-item"><strong>Coupon Code :</strong> {{ payment.coupon_code }}</li>
                                <li class="list-group-item"><strong>Offline Payment Method :</strong> {{ payment.offline_payment_method }}</li>
                                <li class="list-group-item"><strong>Payment Status :</strong> {{ payment.payment_status }}</li>
                                <li class="list-group-item"><strong>Card Type :</strong> {{ payment.card_type }}</li>
                              </ul>
                          </div>

                          <div class="card" style="width: 18rem;">
                              <ul class="list-group list-group-flush">
                                <li class="list-group-item"><strong>Card No :</strong> {{ payment.card_no }}</li>
                                <li class="list-group-item"><strong>Bank Transection Id :</strong> {{ payment.bank_transection_id }}</li>
                                <li class="list-group-item"><strong>Validation :</strong> {{ payment.validation_id }}</li>
                                <li class="list-group-item"><strong>Date :</strong> {{ payment.date }}</li>
                                <li class="list-group-item"><strong>Transection Date :</strong> {{ payment.transection_done_date_time }}</li>
                                <li class="list-group-item"><strong>Extend From Date :</strong> {{ payment.extend_from_date }}</li>
                                <li class="list-group-item"><strong>Extend To Date :</strong> {{ payment.extend_to_date }}</li>
                                <li class="list-group-item"><strong>Transection Status :</strong> {{ payment.transection_status }}</li>
                                
                              </ul>
                            </div>

                          </div>
                     </div> 
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal"> <i class="flaticon-delete-1"></i> Close</button>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { EventBus } from '../../../vue-assets';
import Mixin from "../../../mixin";

export default {
    mixins : [Mixin],
    components: {
    },
    data(){
        return {
            payment : {
                id : '',
                user : '',
                total_month : '',
                amount_per_month  : '',
                total_amount : '',
                discount_for_month : '',
                coupon_discount : '',
                total_discount : '',
                coupon_id : '',
                subscription_plan_id : '',
                final_amount : '',
                ssl_store_amount : '',
                payment_mode : '',
                admin_id : '',
                coupon_code : '',
                offline_payment_method : '',
                card_type : '',
                card_no : '',
                bank_transection_id : '',
                validation_id : '',
                date : '',
                transection_done_date_time : '',
                extend_from_date : '',
                extend_to_date : '',
                transection_status : '',
                payment_status : ''
            },
            validation_error: {},
            url : base_url,
            button_name : 'Update'
        }
    },

     mounted(){
        var _this = this
            EventBus.$on('show-payment-details',function(id){
                _this.getPaymentById(id)
                $("#showPaymentModal").modal('show')
            })
    },


    methods : {

        getPaymentById(id){
            axios.get(base_url+'admin/payment/'+id)
                .then(response => {
                    // console.log(response.data)
                        this.payment.id = response.data.data.id
                        this.payment.user = response.data.data.user.name
                        this.payment.total_month = response.data.data.total_month
                        this.payment.amount_per_month  = response.data.data.amount_per_month
                        this.payment.total_amount = response.data.data.total_amount
                        this.payment.discount_for_month = response.data.data.discount_for_month
                        this.payment.coupon_discount = response.data.data.coupon_discount
                        this.payment.total_discount = response.data.data.total_discount
                        this.payment.coupon_id = response.data.data.coupon_id
                        this.payment.subscription_plan_id = response.data.data.subscription_plan_id
                        this.payment.final_amount = response.data.data.final_amount
                        this.payment.ssl_store_amount = response.data.data.ssl_store_amount
                        this.payment.payment_mode = response.data.data.payment_mode_text
                        this.payment.admin_id = response.data.data.admin.name
                        this.payment.coupon_code = response.data.data.coupon_code
                        this.payment.offline_payment_method = response.data.data.offline_payment_method
                        this.payment.card_type = response.data.data.card_type
                        this.payment.card_no = response.data.data.card_no
                        this.payment.bank_transection_id = response.data.data.bank_transection_id
                        this.payment.validation_id = response.data.data.validation_id
                        this.payment.date = response.data.data.date
                        this.payment.transection_done_date_time = response.data.data.transection_done_date_time
                        this.payment.extend_from_date = response.data.data.extend_from_date
                        this.payment.extend_to_date = response.data.data.extend_to_date
                        this.payment.transection_status = response.data.data.transection_status
                        this.payment.payment_status = response.data.data.payment_status_text
                })
                .catch(error => {
                    console.log(error.response.data.errors)
                })
        }
    }
}
</script>