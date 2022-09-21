<template>
    <div id="CreateAdmin" class="modal animated fadeInRight custo-fadeInRight show" tabindex="-1" role="dialog" aria-labelledby="addContactModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <form @submit.prevent="store()" role="form">
            <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title">Create Admin</h5>
                    <button class="btn btn-default" data-dismiss="modal">X</button>
              </div>
                <div class="modal-body">
                    
                 
                <div class="statbox widget box box-shadow">
            
                    <div class="widget-content widget-content-area">
                  
                            <div class="form-group">
                            	<label for="FullName">Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" v-model="admin.name" id="FullName" placeholder="Name">
                                <span v-if="validation_error.hasOwnProperty('name')" class="text-danger">
                                    {{ validation_error.name[0] }}
                                </span>
                            </div>
                            <div class="form-group">
                            	<label for="lEmail">Email <span class="text-danger">*</span></label>
                                <input type="email" class="form-control" id="lEmail" v-model="admin.email" placeholder="Email address">
                                <span v-if="validation_error.hasOwnProperty('email')" class="text-danger">
                                    {{ validation_error.email[0] }}
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="role">Role</label>
                                <select id="role" class="form-control" v-model="admin.role">
                                    <option selected value="">Choose Role</option>
                                    <option value="1">Viewer</option>
                                    <option value="2">Super Admin</option>
                                </select>
                            </div>
                            <div class="form-group">
                            	<label for="password">Password <span class="text-danger">*</span></label>
                                <input type="password" class="form-control" v-model="admin.password" id="password" placeholder="Password">
                                <span v-if="validation_error.hasOwnProperty('password')" class="text-danger">
                                    {{ validation_error.password[0] }}
                                </span>
                            </div>
                            <div class="form-group">
								<label>Confirm Password</label> 
								<input v-model="admin.password_confirmation" type="password" placeholder="Confirm Password" class="form-control">
							</div>	
							<div class="form-group">
								
						    <label class="custom-file-container__custom-file" >
						        <input type="file" id="file" ref="file" class="custom-file-container__custom-file__custom-file-input" @change="onProfChange($event)" accept="image/*">
						    </label><br>
						    <img v-if="preview != ''" v-lazy="preview" height="100" width="100" />
							
                            </div>	
							<div class="form-group">
								<label>Status *</label> 
								<select name="status" class="form-control" v-model="admin.status">
									<option value="1">Active</option>
									<option value="0">Inactive</option>
								</select>
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
import { EventBus } from '../../../vue-assets';
import Mixin from "../../../mixin";
	export default {
		mixins : [Mixin],
		data(){
			return {
				admin : {
					name : '',
					email : '',
					role : '',
					password : '',
					password_confirmation : '',
					image  : '',
					status : 1
				},
				preview  : '',
				url : base_url,
				validation_error: {},
				button_name : 'Save'
			}
		},

		methods : {
			onProfChange(e) {
		      this.preview = "";
		      let files = e.target.files || e.dataTransfer.files;
		      if (!files.length) return;
		      this.createProfile(files[0]);
		    },
		    createProfile(file) {
		      let reader = new FileReader();
		      let vm = this;
		      reader.onload = (e) => {
		        vm.admin.image = e.target.result;
		      };
		      reader.readAsDataURL(file);
		    },

			store(){
				this.button_name = "Saving..."
	            axios.post(base_url+'admin/admin',this.admin)
	            .then(response => {
	                this.successMessage(response.data)
	                $("#CreateAdmin").modal('hide')
	                this.clearField()
	                this.button_name = "Save"
	                EventBus.$emit('admin-created')
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
				this.admin = {
					name : '',
					email : '',
					role : '',
					password : '',
					password_confirmation : '',
					image  : '',
					status : 1
				};
				this.validation_error = {}
			}
		}
	}
</script>