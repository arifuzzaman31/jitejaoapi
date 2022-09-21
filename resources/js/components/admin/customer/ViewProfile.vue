<template>
<div class="modal fade" id="profileView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="col-sm-12 col-12">
                        
                    <div class="widget widget-account-invoice-one">

                        <div class="widget-content">
                            <div class="invoice-box">
                                <div style="height:70px;width:70px;">
                                    <img :src="user.avatar" class="img-fluid text-center rounded-circle">
                                </div>
                                <div class="acc-total-info">
                                    <h5>{{ user.name }}</h5>
                                    <p class="acc-amount">{{ user.area }}</p>
                                </div>

                                <div class="inv-detail">                                        
                                    <div class="info-detail-1">
                                        <p>Buyer Badge</p>
                                        <p>{{ user.buyer_badge }}</p>
                                    </div>
                                    <div class="info-detail-2">
                                        <p>Seller Badge</p>
                                        <p>{{ user.seller_badge }}</p>
                                    </div>

                                    <div class="info-detail-2">
                                        <p>Subscription Exp Date</p>
                                        <p>{{ user.subscription_expired_at }}</p>
                                    </div>
                                    <div class="info-detail-3 info-sub">
                                        <div class="info-detail">
                                            <p>Total Post</p>
                                            <p>{{ user.total_post }}</p>
                                        </div>
                                        <div class="info-detail">
                                            <p>Total Bid</p>
                                            <p>{{ user.total_bid }}</p>
                                        </div>
                                        <div class="info-detail">
                                            <p>Complete Work</p>
                                            <p>{{ user.total_completed_work }}</p>
                                        </div>
                                        
                                    </div>

                                    <div class="info-detail-3 info-sub">
                                        <div class="info-detail">
                                            <p>Sale Amount</p>
                                            <p>{{ user.total_amount_sales }}</p>
                                        </div>
                                        <div class="info-detail">
                                            <p>Buying Amount</p>
                                            <p>{{ user.total_amount_buying }}</p>
                                        </div>
                                        
                                    </div>

                                    <div class="info-detail-3 info-sub">
                                        <div class="info-detail">
                                            <p>Sold Qty</p>
                                            <p>{{ user.total_qty_sold }}</p>
                                        </div>
                                        <div class="info-detail">
                                            <p>Buying Qty</p>
                                            <p>{{ user.total_qty_buyed }}</p>
                                        </div>
                                    </div>

                                    <div class="info-detail-3 info-sub">
                                        <div class="info-detail">
                                            <p>Avg Buying Rating</p>
                                            <p>{{ user.average_buying_rating }}</p>
                                        </div>
                                        <div class="info-detail">
                                            <p>Avg Selling Rating</p>
                                            <p>{{ user.average_saling_rating }}</p>
                                        </div>
                                    </div>

                                    <div class="info-detail-3 info-sub">
                                        <div class="info-detail">
                                            <p>Is Seller</p>
                                            <p>{{ user.is_seller }}</p>
                                        </div>
                                        <div class="info-detail">
                                            <p>Post Permission</p>
                                            <p>{{ user.post_permission }}</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="inv-action">
                                    <a href="" class="btn btn-danger" data-dismiss="modal">Discard</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>
<script>
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";
export default {
	mixins : [Mixin],
 
    data(){
        return {
            user: {
		        name : '',
                area : '',
				avatar : '',
                mobile_no : '',
                sub_area_id : '',
                address : '',
                total_post : '',
                total_bid : '',
                total_completed_work : '',
                total_amount_sales : '',
                total_amount_buying : '',
                total_qty_buyed : '',
                total_qty_sold : '',
				average_buying_rating : '',
				average_saling_rating : '',
				bid_permission : '',
				buyer_badge : '',
				email : '',
				is_seller : '',
				post_permission : '',
				seller_badge : '',
				status : '',
				subscription_expired_at : ''
		     },
            url : base_url
        }
    },

   
    mounted(){
        var _this = this
        // _this.getBuyer()
        EventBus.$on('customer-show', function(id){
            _this.clearField()
           _this.getProfile(id)
           $("#profileView").modal('show')
        })
    },

    methods : {
        getProfile(id){
            axios.get(base_url+'admin/user/profile/'+id)
            .then(response => {
                // console.log(response.data.data.area)
                if(response.data.status != 'error'){
                    this.user.area = response.data.data.area.area_name
					this.user.average_buying_rating = response.data.data.average_buying_rating
					this.user.average_saling_rating = response.data.data.average_selling_rating
					this.user.bid_permission = response.data.data.bid_permission
					this.user.buyer_badge = response.data.data.buyer_badge_title
					this.user.email = response.data.data.email
                    this.user.avatar = response.data.data.avatar
                    this.user.mobile_no = response.data.data.mobile_no
                    this.user.address = response.data.data.user_information.address
                    this.user.total_post = response.data.data.user_information.total_post
                    this.user.total_bid = response.data.data.user_information.total_bid
                    this.user.total_completed_work = response.data.data.user_information.total_completed_work
                    this.user.total_amount_sales = response.data.data.user_information.total_amount_sales
                    this.user.total_amount_buying = response.data.data.user_information.total_amount_buying
                    this.user.total_qty_buyed = response.data.data.user_information.total_qty_buyed
                    this.user.total_qty_sold = response.data.data.user_information.total_qty_sold
					this.user.is_seller = response.data.data.is_seller
					this.user.mobile_no = response.data.data.mobile_no
					this.user.name = response.data.data.name
					this.user.post_permission = response.data.data.post_permission
					this.user.seller_badge = response.data.data.seller_badge_title
					this.user.status = response.data.data.status
					this.user.sub_area_id = response.data.data.sub_area_id
					this.user.subscription_expired_at = response.data.data.subscription_expired_at
                }
                
            })
            .catch(error => {
                console.log(error.response.data.errors)
            })
        },

        clearField(){
            this.user = {
                name : '',
                area : '',
                avatar : '',
                mobile_no : '',
                sub_area_id : '',
                address : '',
                total_post : '',
                total_bid : '',
                total_completed_work : '',
                total_amount_sales : '',
                total_amount_buying : '',
                total_qty_buyed : '',
                total_qty_sold : '',
                average_buying_rating : '',
                average_saling_rating : '',
                bid_permission : '',
                buyer_badge : '',
                email : '',
                is_seller : '',
                post_permission : '',
                seller_badge : '',
                status : '',
                subscription_expired_at : ''
             }
        }
	}
}
</script>