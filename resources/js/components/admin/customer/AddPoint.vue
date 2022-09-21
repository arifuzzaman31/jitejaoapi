<template>
<div class="modal fade" id="addPoint" tabindex="-1" role="dialog" aria-labelledby="addPointLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addPointLabel">Add More Point</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            	<form @submit.prevent="updatePoint()" role="form">
                	<div class="add-contact-box">
                        <div class="add-contact-content text-left">
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 layout-spacing">
                                    <div class="add-contact-box">
                                        <div class="add-contact-content text-left">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="contact-email text-center">
                                                    	<span>Current Point</span>
                                                        <h3 class="text-success">{{ user.current_point }}</h3> 
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mt-2">
                                                    <div class="contact-email">
                                                        <i class="flaticon-mail-26"></i>
                                                        <label for="head-date">Point</label>
                                                        <input
                                                            type="number"
                                                            class="form-control"
                                                            id="head-name"
                                                            v-model="user.point"
                                                          />
                                                        <span v-if="validation_error.hasOwnProperty('point')" class="text-danger">
                                                                {{ validation_error.point[0] }}
                                                        </span>
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
            	id : null,
  				current_point : 0,
                point : 0,
                payment_method : "cash"
      		},
            url : base_url,
    		validation_error: {},
    		button_name: "Add",
        }
    },

   
    mounted(){
        var _this = this
        EventBus.$on('add-point', function(id){
           _this.clearField()
           _this.user.id = id
           _this.getCurrentPoint(id)
           $("#addPoint").modal('show')
        })
    },

    methods : {
        getCurrentPoint(id){
            axios.get(base_url+'admin/user/'+id)
            .then(response => {
               this.user.current_point = response.data.current_point
                console.log(response.data.current_point)
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        updatePoint()
        {
	      this.button_name = "Adding...";
	      axios
	        .post(base_url+'admin/user/add/point',this.user)
	        .then((response) => {
            if(response.data.status == 'success'){
  	          this.successMessage(response.data);
  	          this.clearField();
  	          $("#addPoint").modal("hide");
  	          EventBus.$emit('customer-created');
            }else{
              this.validationError(response.data);
            }
            console.log(response)
	          this.button_name = "Add";
	        })
	        .catch((error) => {
                console.log(error)
	          if (error.response.status == 422) {
	            this.validation_error = error.response.data.errors;
	            this.validationError();
	            this.button_name = "Add";
	            
	          } else {
	            this.validationError(error);
	            this.button_name = "Add";
	          }
	        });
        },

        clearField(){
        	this.user = {
                id : '',
                current_point : 0,
                point : 0,
                payment_method : "cash"
		     }
		    this.validation_error = {}
		    this.button_name = "Add"
        }
	}
}
</script>