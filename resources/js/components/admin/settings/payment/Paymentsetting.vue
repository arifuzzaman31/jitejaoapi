<template>
    <div>        
        <div class="statbox widget box box-shadow" style="width:50%">

            <div class="widget-content widget-content-area">
                <form role="form" @submit.prevent="updateForm()">
                    <div class="form-group">
                        <label for="MonthCharge">Monthly Charge <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" v-model="payments.monthly_charge" id="MonthCharge" placeholder="Monthly Charge">
                        <span v-if="validation_error.hasOwnProperty('monthly_charge')" class="text-danger">
                            {{ validation_error.monthly_charge[0] }}
                        </span>
                    </div>
                    <div class="form-group">
                        <label for="d-for-month">Discount for Month <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" id="d-for-month" v-model="payments.discount_for_month" placeholder="Discount for Month">
                        <span v-if="validation_error.hasOwnProperty('discount_for_month')" class="text-danger">
                            {{ validation_error.discount_for_month[0] }}
                        </span>
                    </div>
                    
                    <div class="form-group">
                        <label for="dtype">Discount Type</label>
                        <select id="dtype" class="form-control" v-model="payments.discount_type">
                            <option selected value="">Choose Discount Type</option>
                            <option value="1">%</option>
                            <option value="2">Amount</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Discount Amount</label> 
                        <input v-model="payments.discount_amount" type="number" placeholder="Discount Amount" class="form-control">
                        <span v-if="validation_error.hasOwnProperty('discount_amount')" class="text-danger">
                            {{ validation_error.discount_amount[0] }}
                        </span>
                    </div>

                    <div class="form-group" v-if="payments.discount_type == 1">
                        <label>Maximum Discount Amount</label> 
                        <input v-model="payments.max_discount_amount" type="number" placeholder="Maximum Discount Amount" class="form-control">
                        <span v-if="validation_error.hasOwnProperty('max_discount_amount')" class="text-danger">
                            {{ validation_error.max_discount_amount[0] }}
                        </span>
                    </div>

                    <div class="form-group">
                        <label for="discount_status">Discount Status</label>
                        <select id="discount_status" class="form-control" v-model="payments.discount_status">
                            <option selected value="">Choose Discount Status</option>
                            <option value="1">ON</option>
                            <option value="0">OFF</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Status</label> 
                        <select name="status" class="form-control" v-model="payments.status">
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
            payments : {
                id : '',
                monthly_charge : '',
                discount_for_month : '',
                discount_type : '',
                discount_amount : '',
                max_discount_amount : '',
                discount_status : '',
                status : ''
            },
            button_name : 'Update',
            validation_error : {},
            url : base_url
        }
    },

   
    mounted(){
        this.getPayment()
    },

    methods : {
        getPayment(){
            axios.get(base_url+'admin/payment-settings/1/edit')
            .then(response => {
                this.payments.id = response.data.id
                this.payments.monthly_charge = response.data.monthly_charge
                this.payments.discount_for_month = response.data.discount_for_month
                this.payments.discount_type = response.data.discount_type
                this.payments.discount_amount = response.data.discount_amount
                this.payments.max_discount_amount = response.data.max_discount_amount
                this.payments.discount_status = response.data.discount_status
                this.payments.status = response.data.status
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        updateForm(){
            this.button_name = 'Processing...'
            axios.put(base_url+'admin/payment-settings/'+this.payments.id,this.payments)
            .then(response => {
                if(response.status == 'success'){
                    this.successMessage(response.data)
                    this.getPayment()
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