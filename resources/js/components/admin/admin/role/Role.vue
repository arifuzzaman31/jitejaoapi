<template>
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="widget widget-table-two">
            <div class="widget-content">
                <div class="table-responsive">
                    <table class="table text-center">
                        <thead>
                            <tr>
                                <th class="th-content">SL</th>
                                <th class="th-content">Role</th>
                                <th class="th-content">Permission</th>
                                <th class="th-content">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(role,index) in roles" :key="index">
                                <td class="td-content">{{ role.id }}</td>
                                <td class="td-content">{{ role.role_name }}</td>
                                <td class="td-content">
                                	<a @click="setPermission(role.id)" class="btn btn-warning rounded-circle" type="button" title="Permission"><i class="fa fa-key"></i></a>
                                </td>
                                <td class="td-content text-center">
                                    <a class="btn btn-danger rounded-circle" @click="deleteRole(role.id)" type="button" title="Delete"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div>
        	<permission />
        </div>
    </div>
</template>
<script>

import { EventBus } from '../../../../vue-assets';
import Mixin from "../../../../mixin";
import Permission from "./Permission";
	export default {
		components : { Permission },
		data(){
			return {
				roles : [],
				url : base_url
			}
		},

		mounted(){
	        var _this = this
	        _this.getRole()
	        EventBus.$on('role-created', function(){
	           _this.getRole()
	        })
	    },

	    methods : {
	    	getRole(){
	    		axios.get('get-role')
	    		.then(response => {
	    			this.roles = response.data
	    		})
	    		.catch(error => {
	    			console.log('Some error Occure!')
	    		})
	    	},

	    	setPermission(id){
	    		EventBus.$emit('open-permission-modal',id)
	    	},

	    	deleteRole(id){
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
	                    .delete(base_url +'admin/role/'+id)
	                    .then((res) => {
	                        EventBus.$emit('role-created')
	                        this.successMessage(res.data);
	                    });
	                }
	            });
	        }

	    }
	}
</script>