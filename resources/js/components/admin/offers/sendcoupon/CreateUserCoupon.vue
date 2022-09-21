<template>
<div id="CreateUserCoupon" class="modal animated fadeInRight custo-fadeInRight show" tabindex="-1" role="dialog" aria-labelledby="addCouponModal" aria-hidden="true">
    <div class="modal-dialog custom-modal" role="document">
        <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title">Send Coupon</h5>
               <button class="btn btn-outline-danger" data-dismiss="modal">X</button>
          </div>
            <div class="modal-body">
                <div class="add-contact-box">
                    <div class="add-contact-content text-left">
                        	
                        <div class="row">
					        <div class="form-group col-md-3">
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
						    <div class="form-group col-md-3">
						        <multiselect
						           v-model="custom_user"
						           placeholder="Search by Name"
						           :custom-label="userName"
						           track-by="id"
						           :options="users"
						           :multiple="true"
						        ></multiselect>
						    </div>
						    <div class="form-group col-md-4">
						        <multiselect
						           v-model="area"
						           placeholder="Search by Area"
						           :custom-label="userAreaLabel"
						           track-by="id"
						           :options="locations"
						           :multiple="true"
						        ></multiselect>
						    </div>
					     
					      	<div class="form-group col-md-2">
					            <button type="submit" class="btn btn-info mt-1" @click.prevent="getFilterUser()">Filter</button>
					            <button type="submit" class="btn btn-danger ml-1 mt-1" @click.prevent="clearField()">Clear</button>
					        </div>
					    </div>

					    <table class="table table-bordered table-hover mb-4" v-if="selected_user.length > 0">
				            <thead>
				                <tr>
				                    <th>ID</th>
				                    <th>Name</th>
				                    <th>Mobile</th>
				                    <th>Email</th>
				                    <th class="text-center">City</th>
				                    <th class="text-center">Expired at</th>
				                    <th class="text-center">Action</th>
				                </tr>
				            </thead>
				            <tbody>
				                <tr v-for="(user,index) in selected_user" :key="index">
				                    <td>{{ user.id }}</td>
				                    <td>{{ user.name }}</td>
				                    <td>{{ user.mobile_no }}</td>
				                    <td>{{ user.email }}</td>
				                    <td class="text-center">
				                        {{ user.area.area_name }}
				                    </td>
				                
				                    <td class="text-center">
				                        <span class="text-success" v-if="user.subscription_expired_at">{{ user.subscription_expired_at | dateToString }}</span>
				                    </td>
				                    
				                    <td class="text-center">
				                        <a href="javascript:void(0)" @click.prevent="removeItem(user.id)"><i class="fa fa-times" aria-hidden="true"></i></a>
				                    </td>
				                </tr>
				            </tbody>
				        </table>
                    </div>
                </div>
            	<h5 v-if="validation_error.hasOwnProperty('user')" class="text-danger text-center">
                        {{ validation_error.user[0] }}
                </h5>
            <div class="modal-footer">
                <button type="button" @click.prevent="storeData()" class="btn btn-primary"> {{ button_name }}</button>

                <button class="btn btn-default" data-dismiss="modal"> <i class="flaticon-delete-1"></i> Close</button>
            </div>
          </div>
        </div>
    </div>
</div>
</template>
<script>
	import { EventBus } from '../../../../vue-assets';
	import Mixin from "../../../../mixin";
	import Multiselect from "vue-multiselect";

	export default {
	    mixins : [Mixin],
	    props : ['users','coupons','locations'],
	    components: { Multiselect },
	    data(){
	        return {
	        	user : [],
	        	custom_user : [],
	        	selected_user : [],
	           	area : [],
	           	coupon : '',
	            validation_error : {},
	            button_name : 'Send',
	            url : base_url
	        }
	    },

	    methods : {
	    	couponLabel(name){
	    		return `${name.coupon_code}`
	    	},

	    	userAreaLabel(area){
	    		return `${area.area_name}`
	    	},

	    	userName(user){
	    		return `${user.name}`
	    	},

	    	removeItem(value){

	    		this.selected_user = this.selected_user.filter(item => item.id !== value)
	    		this.user = this.selected_user.map(user => user.id)
	    		this.custom_user = this.custom_user.filter(item => item.id !== value)
	    	},

	    	getFilterUser(){
	    		this.selected_user = []
	           	// this.coupon = ''
	    		const areaid = this.area.map(ar => ar.id)
    			var user = this.users.filter(function(e) {
				  	return areaid.includes(e.area_id)
				})

				if(user.length > 0 || this.custom_user.length > 0){
					this.selected_user = [...new Set([...user,...this.custom_user])]
	    			this.user = this.selected_user.map(user => user.id)
	    			
				} else {
	    			console.log("No user Found on this State!")
				}
	    	},

	    	storeData(){
	    		
	    		this.button_name = "Sending..."
	    		axios.post(base_url+'admin/send-coupon',{'coupon' : this.coupon, 'user' : this.user})
	    			.then(response => {
	    				this.successMessage(response.data)
		                this.clearField()
		                this.button_name = "Send"
		                $("#CreateUserCoupon").modal('hide')
		                EventBus.$emit('usercoupon-created')
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

	    	clearField(){
	    		this.user = []
	        	this.custom_user = []
	        	this.area = []
	        	this.selected_user = []
	           	this.coupon = ''
	            this.validation_error = {}
	            this.button_name = 'Send'
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