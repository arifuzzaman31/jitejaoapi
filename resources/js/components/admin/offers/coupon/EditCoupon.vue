<template>
<div id="UpdateCoupon" class="modal animated fadeInRight custo-fadeInRight show" tabindex="-1" role="dialog" aria-labelledby="UpdateCouponModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form @submit.prevent="update()" role="form">
        <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title">Update Coupon</h5>
               <button class="btn btn-outline-danger" data-dismiss="modal">X</button>
          </div>
            <div class="modal-body">
                <div class="add-contact-box">
                    <div class="add-contact-content text-left">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="contact-email">
                                    <i class="flaticon-mail-26"></i>
                                    <label for="head-Title">Coupon Code <span class="text-danger">*</span></label>
                                    <input type="text"
                                      class="form-control" id="head-Title" v-model="coupon.coupon_code" placeholder="Code">
                                    <span v-if="validation_error.hasOwnProperty('coupon_code')" class="text-danger">
                                            {{ validation_error.coupon_code[0] }}
                                    </span>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="contact-email">
                                    <i class="flaticon-mail-26"></i>
                                    <label for="head-Title">Amount Type <span class="text-danger">*</span></label>
                                    <select
                                        class="form-control"
                                        id="hstatus"
                                         v-model = "coupon.amount_type">
                                        <option value="">Choose Amount Type</option>
                                        <option value="1">Amount</option>
                                        <option value="2">%</option>
                                      </select>
                                    <span v-if="validation_error.hasOwnProperty('amount_type')" class="text-danger">
                                            {{ validation_error.amount_type[0] }}
                                    </span>
                                </div>
                            </div>

                             <div class="col-md-12">
                                <div class="contact-email">
                                    <i class="flaticon-mail-26"></i>
                                    <label for="head-Title">Coupon Type <span class="text-danger">*</span></label>
                                    <select
                                        class="form-control"
                                        id="hstatus"
                                         v-model = "coupon.coupon_type">
                                        <option value="">Choose Coupon Type</option>
                                        <option value="0">Specific User</option>
                                        <option value="1">For All User</option>
                                      </select>
                                    <span v-if="validation_error.hasOwnProperty('coupon_type')" class="text-danger">
                                            {{ validation_error.coupon_type[0] }}
                                    </span>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="contact-email">
                                    <i class="flaticon-mail-26"></i>
                                    <label for="head-Amount">Amount<span class="text-danger">*</span></label>
                                    <div class="form-group">
                                        <input v-model="coupon.amount" type="number" placeholder="Amount" class="form-control">
                                        <span v-if="validation_error.hasOwnProperty('amount')" class="text-danger">
                                            {{ validation_error.amount[0] }}
                                        </span>
                                    </div>
                                    
                                </div>
                            </div>

                            <div class="col-md-12" v-if="coupon.amount_type == 2">
                                <div class="contact-email">
                                    <i class="flaticon-mail-26"></i>
                                    <label for="head-maximum_amount">Maximum Amount <span class="text-danger">*</span></label>
                                    <div class="form-group">
                                        <input v-model="coupon.maximum_amount" type="number" placeholder="Maximum Amount" class="form-control">
                                        <span v-if="validation_error.hasOwnProperty('maximum_amount')" class="text-danger">
                                            {{ validation_error.maximum_amount[0] }}
                                        </span>
                                    </div>
                                   
                                </div>
                            </div>

                            
                            <div class="col-md-12">
                                <div class="contact-email">
                                    <i class="flaticon-mail-26"></i>
                                    <label for="head-valid_date">Valid Date</label>
                                 
                                    <input type="date" class="form-control" id="head-valid_date" v-model="coupon.valid_date">
                                    <span v-if="validation_error.hasOwnProperty('valid_date')" class="text-danger">
                                            {{ validation_error.valid_date[0] }}
                                    </span>
                                </div>
                            </div>
                          
                            <div class="col-md-12">
                                <div class="contact-email">
                                    <i class="flaticon-mail-26"></i>
                                    <label for="h-status">Status</label>
                                    <select class="form-control" id="h-status" v-model="coupon.status">
                                        <option value="">Choose Status</option>
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>
                                    </select>
                                </div>
                            </div>
                           
                        </div>
                    </div>
                </div>
            <div class="modal-footer">
                <button type="submit"  class="btn btn-primary"> {{ button_name }}</button>

                <button class="btn btn-default" data-dismiss="modal"> <i class="flaticon-delete-1"></i> Close</button>
            </div>
          </div>
        </div>
        </form>
    </div>
</div>	
</template>
<script>
	import { EventBus } from '../../../../vue-assets'
	import Mixin from "../../../../mixin"
	export default {
		mixins : [Mixin], 
		data(){
			return {
				coupon : {
                    id : '',
	                coupon_code : '',
                    coupon_type : '',
	                amount_type : '',
	                amount : '',
	                maximum_amount : '',
	                valid_date : '',
	                status : '',
	            },
	            validation_error : {},
	            button_name : 'Update',
	            url : base_url
			}
		},

		mounted(){
			var _this = this
			EventBus.$on('edit-coupon', function(id){
	            _this.coupon.id = id
                _this.getCouponById(id)
	            $("#UpdateCoupon").modal('show')
	        })
		},

		methods : {
			getCouponById(id){
				axios.get(base_url+'admin/coupon/'+id+'/edit')
				.then(response => {
					// console.log(response)
					this.coupon.coupon_code = response.data.coupon_code
                    this.coupon.coupon_type = response.data.coupon_type
					this.coupon.amount_type = response.data.amount_type
					this.coupon.amount = response.data.amount
					this.coupon.maximum_amount = response.data.max_amount_limit
					this.coupon.valid_date = response.data.valid_date
					this.coupon.status = response.data.status
				})
				.catch(error => {

				})
			},

            update(){
                this.button_name = 'Updating...'
                axios.put(base_url+'admin/coupon/'+this.coupon.id,this.coupon)
                .then(response => {
                    this.successMessage(response.data)
                    this.button_name = 'Update'
                    this.clearField()
                    $("#UpdateCoupon").modal('hide')
                    EventBus.$emit('coupon-created')
                })
                .catch(error => {
                    if (error.response.status == 422) 
                    {
                        this.validation_error = error.response.data.errors;
                        this.validationError();
                        this.button_name = "Update"
                    } 
                    else 
                    {
                        this.validationError(error);
                        this.button_name = "Update"
                    }
                })
            },

            clearField(){
                this.coupon = {
                    coupon_code : '',
                    coupon_type : '',
                    amount_type : '',
                    amount : '',
                    maximum_amount : '',
                    valid_date : '',
                    status : '',
                };
                this.validation_error = {}
                this.button_name = 'Save'
            }
		}
	}
</script>