<template>
<div class="modal fade" id="ExtendSubsc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Extend Subscription Date</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            	<form @submit.prevent="updateExpireDate()" role="form">
                	<div class="add-contact-box">
                        <div class="add-contact-content text-left">
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 layout-spacing">
                                    <div class="add-contact-box">
                                        <div class="add-contact-content text-left">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="contact-email text-center">
                                                    	<span>Current Expired date</span>
                                                        <h3 class="text-success">{{ user.subscription_expired_at }}</h3> 
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mt-2">
                                                    <div class="contact-email">
                                                        <i class="flaticon-mail-26"></i>
                                                        <label for="head-date">Choose a Plan</label>
                                                        <multiselect
                                                          v-model="user.plan"
                                                          :options="plans"
                                                          :custom-label="setPlanName"
                                                          track-by="id"
                                                          @input="setAmount()"
                                                        ></multiselect>
                                                        <!-- <pre class="language-json"><code>{{   }}</code></pre> -->
                                                        <span v-if="validation_error.hasOwnProperty('plan')" class="text-danger">
                                                                {{ validation_error.plan[0] }}
                                                        </span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mt-3">
                                                    <div class="contact-email d-flex justify-content-between">
                                                    	<span><strong>Total Amount : </strong>
                                                        <h5 class="text-success">{{ user.total_amount }}</h5> </span>
                                                        <span><strong>Discount Amount : </strong>
                                                        <h5 class="text-success">{{ user.discount_amount }}</h5></span> 
                                                        <span><strong>Final Amount : </strong>
                                                        <h5 class="text-success">{{ user.final_amount }}</h5> </span>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mt-3">
                                                  <label>Payment Method *</label>
                                                  <select
                                                    name="method"
                                                    class="form-control"
                                                    v-model="user.payment_method"
                                                  >
                                                    <option selected="" value="cash">Cash</option>
                                                    <option value="bank">Bank</option>
                                                    <option value="bkash">bKash</option>
                                                  </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button>
                <button type="submit" class="btn btn-primary">{{ button_name }}</button>
            </div>
                </form>
            </div>
        </div>
    </div>
</div>
</template>
<script>
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";
import Multiselect from 'vue-multiselect'
export default {
	mixins : [Mixin],
 	components: {
        Multiselect
    },
    data(){
        return {
            user: {
            	id : '',
              plan : '',
      				extend_expired_date : '',
      				subscription_expired_at : '',
      				total_amount : 0,
      				discount_amount : 0,
      				final_amount : 0,
                    payment_method : "cash"
      		  },
    		plans: [],
            url : base_url,
    		validation_error: {},
    		button_name: "Extend",
        }
    },

   
    mounted(){
        var _this = this
        EventBus.$on('extend-subscription', function(id){
          _this.getPlans()
           _this.clearField()
           _this.user.id = id
           _this.getSubscptionDate(id)
           $("#ExtendSubsc").modal('show')
        })
    },

    methods : {
        getSubscptionDate(id){
            axios.get(base_url+'admin/user/subscription/date/'+id)
            .then(response => {
               this.user.subscription_expired_at = response.data.data.subscription_expired_at
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        getPlans(){
            axios.get(base_url+'admin/subscription-plan-list')
            .then(response => {
               this.plans = response.data
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        setPlanName(plan){
          return `${plan.plan_name} (${plan.total_month} month - ${plan.total_amount} tk)`
        },

        setAmount(){
            this.user.total_amount = this.user.plan.total_amount
            this.user.discount_amount = this.user.plan.discount
            this.user.final_amount = this.user.plan.final_amount
        },

        updateExpireDate()
        {
	      this.button_name = "Extending...";
	      axios
	        .post(base_url+'admin/user/extend/expire/date',this.user)
	        .then((response) => {
            if(response.data.status == 'success'){
  	          this.successMessage(response.data);
  	          this.clearField();
  	          $("#ExtendSubsc").modal("hide");
  	          EventBus.$emit('customer-created');
            }else{
              this.validationError(response.data);
            }
	          this.button_name = "Extend";
	        })
	        .catch((error) => {
	          if (error.response.status == 422) {
	            this.validation_error = error.response.data.errors;
	            this.validationError();
	            this.button_name = "Extend";
	            
	          } else {
	            this.validationError(error);
	            this.button_name = "Extend";
	          }
	        });
        },

        

        clearField(){
        	this.user = {
            id : '',
            plan : '',
            extend_expired_date : '',
            subscription_expired_at : '',
            total_amount : 0,
            discount_amount : 0,
            final_amount : 0,
		     }
        this.plans = []
		    this.validation_error = {}
		    this.button_name = "Extend"
        }
	}
}
</script>