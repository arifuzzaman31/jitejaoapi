<template>
    <div id="CreateRole" class="modal animated fadeInRight custo-fadeInRight show" tabindex="-1" role="dialog" aria-labelledby="addContactModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <form @submit.prevent="store()" role="form">
            <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">Create Role</h5>
                    <button class="btn btn-default" data-dismiss="modal">X</button>
              </div>
                <div class="modal-body">
                    
                 
                <div class="statbox widget box box-shadow">
            
                    <div class="widget-content widget-content-area">
                  
                            <div class="form-group">
                            	<label for="RoleName">Role Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" v-model="role.role_name" id="RoleName" placeholder="Role Name">
                                <span v-if="validation_error.hasOwnProperty('role_name')" class="text-danger">
                                    {{ validation_error.role_name[0] }}
                                </span>
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
import { EventBus } from '../../../../vue-assets';
import Mixin from "../../../../mixin";
	export default {
		mixins : [Mixin],
		data(){
			return {
				role : {
					role_name : ''
				},
				url : base_url,
				validation_error: {},
				button_name : 'Save'
			}
		},

		methods : {

			store(){
				this.button_name = "Saving..."
	            axios.post(base_url+'admin/role',this.role)
	            .then(response => {
	                this.clearField()
	                this.successMessage(response.data)
	                $("#CreateRole").modal('hide')
	                this.button_name = "Save"
	                EventBus.$emit('role-created')
	            })
	            .catch(error => {
	                if (error.response.status == 422) 
	                {
	                    this.validation_error = error.response.data.errors;
	                    this.validationError();
	                    this.button_name = "Save"
	                } 
	                else 
	                {
	                    this.successMessage(error);
	                    this.button_name = "Save"
	                }
	            })
			},

			clearField(){
				this.role = {
					role_name : ''
				};
				this.validation_error = {}
			}
		}
	}
</script>