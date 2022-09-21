<template>
    <div>        
        <div class="statbox widget box box-shadow" style="width:50%">

            <div class="widget-content widget-content-area">
                <form role="form" @submit.prevent="updateForm()">
                    <div class="form-group">
                        <label for="BidCharge">Bid Charge <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" v-model="bid_setting.bid_charge" id="BidCharge" placeholder="Bid Charge">
                        <span v-if="validation_error.hasOwnProperty('bid_charge')" class="text-danger">
                            {{ validation_error.bid_charge[0] }}
                        </span>
                    </div>
                    <div class="form-group">
                        <label for="d-for-month">Min Point for Bid <small>(Percentage)</small><span class="text-danger">*</span></label>
                        <input type="number" class="form-control" id="d-for-month" v-model="bid_setting.min_point_for_bid" placeholder="Min Point for Bid">
                        <span v-if="validation_error.hasOwnProperty('min_point_for_bid')" class="text-danger">
                            {{ validation_error.min_point_for_bid[0] }}
                        </span>
                    </div>

                    <div class="form-group">
                        <label>Status</label> 
                        <select name="status" class="form-control" v-model="bid_setting.status">
                            <option selected value="">Choose Status</option>
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>
                <button type="submit"  class="btn btn-primary"> {{ button_name }}</button>
            </form>
        </div>
    </div>  
  </div> 
</template>
<script>

import { EventBus } from '../../../../vue-assets';
import Mixin from "../../../../mixin";

export default {
    mixins : [Mixin],
    components: {},
    data(){
        return {
            bid_setting : {
                id : '',
                bid_charge : '',
                min_point_for_bid : '',
                status : ''
            },
            button_name : 'Update',
            validation_error : {},
            url : base_url
        }
    },

   
    mounted(){
        this.getBidSetting()
    },

    methods : {
        getBidSetting(){
            axios.get(base_url+'admin/bid-setting/1/edit')
            .then(response => {
                this.bid_setting.id = response.data.id
                this.bid_setting.bid_charge = response.data.bid_charge
                this.bid_setting.min_point_for_bid = response.data.min_point_for_bid
                this.bid_setting.status = response.data.status
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        updateForm(){
            this.button_name = 'Processing...'
            axios.put(base_url+'admin/bid-setting/'+this.bid_setting.id,this.bid_setting)
            .then(response => {
                if(response.status == 'success'){
                    this.successMessage(response.data)
                    this.getBidSetting()
                } else {
                    this.validationError(response.data);
                }
                    this.button_name = 'Update'
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
                    this.validationError(error.data);
                    this.button_name = "Update"
                }
            })
        }
    }
}
</script>