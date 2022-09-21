<template>
	<div class="row">
      <div
        id="AssignCoupon"
        class="modal animated fadeInRight custo-fadeInRight show"
        tabindex="-1"
        role="dialog"
        aria-labelledby="addContactModalTitle"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Assign Coupon</h5>
                <button class="btn btn-outline-danger float-right" data-dismiss="modal">X</button>
              </div>
              <div class="modal-body">
                <div class="widget-content">
                      <div class="row">
                        	<div class="form-group col-md-12">
						        <multiselect
						           v-model="coupon"
						           placeholder="Search by Coupon"
						           :custom-label="couponLabel"
						           track-by="id"
						           :options="coupons"
						        ></multiselect>
						        <span v-if="validation_error.hasOwnProperty('coupon')" class="text-danger">
                                        {{ validation_error.coupon[0] }}
                                </span>
						    </div>
                        </div>  
                    <div class="widget widget-account-invoice-one" v-if="coupon != ''">

                        <div class="widget-content">
                            <div class="invoice-box">
                                
                                <div class="acc-total-info">
                                
                                    <h5>Expire Date</h5>
                                    <p class="acc-amount">{{ coupon.valid_date }}</p>
                                </div>

                                <div class="inv-detail">                                        
                                    <div class="info-detail-1">
                                        <p>Type</p>
                                        <p>{{ coupon.amount_type == 1 ? 'TK' : '%' }}</p>
                                    </div>

                                    <div class="info-detail-1">
                                        <p>Amount</p>
                                        <p>{{ coupon.amount }}</p>
                                    </div>
                                    <div class="info-detail-2">
                                        <p>Max Amount</p>
                                        <p>{{ coupon.amount_type == 1 ? '- - -' : coupon.max_amount_limit  }}</p>
                                    </div>
                                 
                                </div>

                                <div class="inv-action">
                                    <!-- <a href="" class="btn btn-outline-dark">Summary</a> -->
                                    <button type="button" @click.prevent="storeData()" class="btn btn-danger"> {{ button_name }}</button>
                                    <!-- <a @click.prevent="storeData()" class="btn btn-danger">Send</a> -->
                                </div>
                            </div>
                        </div>

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
import Multiselect from "vue-multiselect";

	export default {
		mixins : [Mixin],
		components: { Multiselect },
		data(){
			return {
				user_id : null,
				coupon : '',
				coupons : [],
				validation_error : {},
				button_name : 'Send',
				url : base_url
			}
		},

		mounted(){
	        var _this = this
	        EventBus.$on('assign-coupon', function(id){
	           _this.user_id = id
	           _this.coupon = ''
	           _this.getCouponList()
	           $("#AssignCoupon").modal("show");
	        })
	    },

	    methods : {
	    	getCouponList(){
	            axios.get(base_url+'admin/coupon-list?assign=user')
	            .then(response => {
	                this.coupons = response.data.data
	            })
	            .catch(error => {
	                console.log(error.response.data.errors)
	            })
	    	},

	    	storeData(){
	    		
	    		this.button_name = "Sending..."
	    		axios.post(base_url+'admin/send-coupon',{'coupon' : this.coupon, 'user' : this.user_id})
	    			.then(response => {
		                this.clearField()
		                this.button_name = "Send"
		                $("#AssignCoupon").modal('hide')
	    				this.successMessage(response.data)
		                // EventBus.$emit('usercoupon-created')
		            })
		            .catch(error => {
		                if (error.response.status == 422) 
		                {
		                    this.validation_error = error.response.data.errors;
		                    this.validationError();
		                    this.button_name = "Send"
		                } 
		                else 
		                {
		                    this.validationError(error);
		                    this.button_name = "Send"
		                }
		            })
		    },

	    	couponLabel(name){
	    		return `${name.coupon_code}`
	    	},

	    	clearField(){
	    		this.user_id = null
				this.coupon = ''
				this.coupons = []
				this.validation_error = {}
				this.button_name = 'Send'
	    	}
	    }
	}
</script>
<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>