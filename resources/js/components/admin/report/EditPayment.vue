<template>
  <div>
    <div class="vld-parent">
      <loading
        :active.sync="isLoading"
        :is-full-page="true"
        :color="'#5e62ff'"
        :height="100"
        :width="100"
      ></loading>
    </div>

    <div class="row">
      <div
        id="updatePayment"
        class="modal animated fadeInLeft custo-fadeInLeft show"
        tabindex="-1"
        role="dialog"
        aria-labelledby="addContactModalTitle"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          <form @submit.prevent="update()" role="form">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Update Payment</h5>
              </div>
              <div class="modal-body">
                <i class="flaticon-cancel-12 close" data-dismiss="modal"></i>
                <div class="add-contact-box">
                  <div class="add-contact-content text-left">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Offline Payment Method</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="payment.offline_payment_method"
                          >
                            <option value="">Choose One</option>
                            <option value="cash">Cash</option>
                            <option value="bank">Bank</option>
                            <option value="bkash">bKash</option>
                          </select>
                        </div>

                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Transection Status</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="payment.transection_status"
                          >
                            <option value="">Choose Status</option>
                            <option value="valid">Valid</option>
                            <option value="invalid">Invalid</option>
                            <option value="other">Others</option>
                          </select>
                        </div>

                        <div class="contact-email mt-2">
                          <i class="flaticon-mail-26"></i>
                          <label for="head-status">Payment Status</label>
                          <select
                            class="form-control"
                            id="head-status"
                            v-model="payment.payment_status"
                          >
                            <option value="">Choose Status</option>
                            <option value="1">Paid</option>
                            <option value="0">Not Paid</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary">
                  {{ button_name }}
                </button>

                <button class="btn btn-default" data-dismiss="modal">
                  <i class="flaticon-delete-1"></i> Close
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import { EventBus } from '../../../vue-assets';
import Mixin from "../../../mixin";
import Pagination from "../../pagination/Pagination";
import Loading from "vue-loading-overlay";

export default {
    mixins : [Mixin],
    components: {
       Loading, Pagination
    },
    data(){
        return {
            payment : {
                id : '',
                offline_payment_method : '',
                transection_status : '',
                payment_status : ''
            },
            button_name : 'Update',
            isLoading : false,
            url : base_url
        }
    },

   
    mounted(){
        var _this = this
        EventBus.$on('edit-payment', function(id){
            _this.clearField()
            _this.payment.id = id
           _this.getPaymentById(id)
           $("#updatePayment").modal('show')
        })
    },

    methods : {
        getPaymentById(id){
            this.isLoading = true
            axios.get(base_url+'admin/payment/'+id)
            .then(response => {
                this.isLoading = false
                this.payment.offline_payment_method = response.data.offline_payment_method
                this.payment.transection_status = response.data.transection_status
                this.payment.payment_status = response.data.payment_status
            })
            .catch(error => {
                console.log(error)
            })
        },

        update(){
            this.button_name = "Updating...";
            this.isLoading = true
            axios.put(base_url+'admin/payment/'+this.payment.id,this.payment)
            .then(response => {
                if(response.data.status == 'success'){
                    this.successMessage(response.data);
                    this.clearField()
                    $("#updatePayment").modal("hide");
                    EventBus.$emit('payment-update')
                } else {
                    this.validationError(response.data);
                }
                 this.isLoading = false;
                this.button_name = "Update";
                
            })
            .catch(error => {
                console.log(error)
            })
        },

        clearField(){
            this.payment = {
                id : '',
                offline_payment_method : '',
                transection_status : '',
                payment_status : ''
            };
        }
    }
}
</script>
<style scoped="">
    .fa {
        font-size : 1.6em;
    }
</style>