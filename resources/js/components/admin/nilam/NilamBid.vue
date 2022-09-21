<template>
	<div>
    <div v-if="bids.length > 0">
		<div class="row">
			<div class="col-xl-6 col-lg-12 col-md-6 col-sm-12 col-12 layout-spacing" v-if="nilam.title">    
          <div class="cate-details-left clearfix  bg-white">
            <div class="">
              <div class="big-image">
                <img
                  class="img-fluid"
                  :src="current_image"
                  :alt="nilam.title"
                />
              </div>
              <!-- <bg-image -->
              <div
                class="small-image mt-4"
                v-if="
                  nilam.image_one_big &&
                  (nilam.image_two_big || nilam.image_three_big || nilam.image_four_big)
                "
              >
                <div class="img" v-if="nilam.image_one_big">
                  <a
                    href="javasript:void(0)"
                    @click.prevent="setCurrentImage(nilam.image_one_big)"
                  >
                    <img
                      class="img-fluid"
                      :class="
                        current_image === nilam.image_one_big
                          ? 'active-small-image'
                          : ''
                      "
                      :src="nilam.image_one_small"
                      alt="product"
                    />
                  </a>
                </div>
                <div class="img" v-if="nilam.image_two_big">
                  <a
                    href="javasript:void(0)"
                    @click.prevent="setCurrentImage(nilam.image_two_big)"
                  >
                    <img
                      class="img-fluid"
                      :class="
                        current_image === nilam.image_two_big
                          ? 'active-small-image'
                          : ''
                      "
                      :src="nilam.image_two_small"
                      alt="product"
                    />
                  </a>
                </div>
                <div class="img" v-if="nilam.image_three_big">
                  <a
                    href="javasript:void(0)"
                    @click.prevent="setCurrentImage(nilam.image_three_big)"
                  >
                    <img
                      class="img-fluid"
                      :class="
                        current_image === nilam.image_three_big
                          ? 'active-small-image'
                          : ''
                      "
                      :src="nilam.image_three_small"
                      alt="product"
                    />
                  </a>
                </div>

                <div class="img" v-if="nilam.image_four_big">
                  <a
                    href="javasript:void(0)"
                    @click.prevent="setCurrentImage(nilam.image_four_big)"
                  >
                    <img
                      class="img-fluid"
                      :class="
                        current_image === nilam.image_four_big
                          ? 'active-small-image'
                          : ''
                      "
                      :src="nilam.image_four_small"
                      alt="product"
                    />
                  </a>
                </div>
              </div>
              <!-- small image -->
            </div>
          </div>
        </div>

			<div class="col-xl-6 col-lg-12 col-md-6 col-sm-12 col-12 layout-spacing">
          <div class="widget widget-card-one">
              <div class="widget-content">

                  <div class="media">
                      <div class="w-img">
                          <img :src="nilam.user.avatar" alt="avatar" v-if="nilam.user.avatar">
                      </div>
                      <div class="media-body ml-2">
                          <h6 class="text-uppercase">{{ nilam.user.name }}</h6>
                          <!-- <p class="meta-date-time">Monday, Nov 18</p> -->
                      </div>
                  </div>
                  <h5 class="text-center text-primary py-2">Expire Date : {{ nilam.expire_date }}</h5>
                  <h5 class="text-center text-success py-2">{{ nilam.title }}</h5><hr />
                  <p v-html="nilam.description"></p>

                  <div class="w-action">
                  	<h6>Extra Link : <a target="_blank" :href="nilam.video_link">{{ nilam.video_link }}</a></h6>
                  	<h6>Product Condition : {{ nilam.product_condition }}</h6>
                    <h5>Price : {{ nilam.base_price }} Point</h5>
                  </div>
              </div>
          </div>      
			</div>

        <div id="flFormsGrid" v-if="nilam.is_expired" class="col-lg-3 layout-spacing">
            <div class="statbox">
                <div class="widget-header">
                    <div class="row">
                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                            <h4>Delivery Status</h4>
                        </div>                                                                        
                    </div>
                </div>
                <div class="widget-content widget-content-area">
                    <form @submit.prevent="updateDeliveryStatus">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Delivery Status</label>
                                <select id="inputState" class="form-control" v-model="delivery.delivery_status">
                                    <option selected>Choose...</option>
                                    <option value="0">Pending</option>
                                    <option value="1">Picked</option>
                                    <option value="2">Processing</option>
                                    <option value="3">On Delivery</option>
                                    <option value="4">Delivered</option>
                                </select>
                                <span v-if="validation_error.hasOwnProperty('delivery_status')" class="text-danger">
                                    {{ validation_error.delivery_status[0] }}
                                </span>
                            </div>

                                <label for="inputPassword4">Date</label>
                            <div class="form-group">
                              
                                <date-picker v-model="delivery.delivery_date" type="datetime"></date-picker>
                                <span v-if="validation_error.hasOwnProperty('delivery_date')" class="text-danger">
                                    {{ validation_error.delivery_date[0] }}
                                </span>
                            </div>

                            <div class="form-group">
                                <label for="inputPassword4">Note</label>
                                <textarea class="form-control"  placeholder="Write About Delivery ..." v-model="delivery.comment" rows="3"></textarea>
                            </div>
                           
                          <button type="submit" class="btn btn-primary mt-3">Update</button>
                        </div>
                    </form>

                </div>
              </div>
            </div>

            <div id="flFormsGrid" v-if="nilam.is_expired" class="col-lg-3 layout-spacing">
              <div class="statbox">
                  <div class="widget-header">
                      <div class="row">
                          <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                              <h4>Buyer Payment Status</h4>
                          </div>                                                                        
                      </div>
                  </div>
                  <div class="widget-content widget-content-area">
                      <form @submit.prevent="updateBuyerStatus">
                          <div class="col-md-12">
                              <div class="form-group">
                                  <label>Buyer Status</label>
                                  <select id="inputState" class="form-control" v-model="buyer_status.payment_status">
                                      <option selected>Choose...</option>
                                      <option value="1">Paid</option>
                                      <option value="0">Unpaid</option>
                                  </select>
                              </div>
                                  <label for="inputPassword4">Payment Date</label>
                              <div class="form-group">
                                  <date-picker v-model="buyer_status.payment_date" type="datetime"></date-picker>
                              </div>
                          
                          <div class="form-group">
                                  <label for="inputPassword4">Note</label>
                                  <textarea class="form-control" placeholder="Write About Status ..." v-model="buyer_status.note" rows="3"></textarea>
                              </div>
                          
                        <button type="submit" class="btn btn-primary mt-3">Update</button>
                          </div>
                      </form>

                  </div>
                </div>
              </div>

            <div id="flFormsGrid" v-if="nilam.is_expired" class="col-lg-3 layout-spacing">
            <div class="statbox">
                <div class="widget-header">
                    <div class="row">
                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                            <h4>Seller Payment Status</h4>
                        </div>                                                                        
                    </div>
                </div>
                <div class="widget-content widget-content-area">
                    <form @submit.prevent="updateSellerStatus">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Payment Status</label>
                                <select id="inputState" class="form-control" v-model="seller_status.payment_status">
                                    <option value="0">Paid</option>
                                    <option value="1">Unpaid</option>
                                </select>
                            </div>
                                <label for="inputPassword4">Payment Date</label>
                            <div class="form-group">
                                <date-picker v-model="seller_status.payment_date" type="datetime"></date-picker>
                            </div>

                            <div class="form-group">
                                  <label for="inputPassword4">Note</label>
                                  <textarea class="form-control" placeholder="Write About Status ..." v-model="seller_status.note" rows="3"></textarea>
                              </div>
                                                    
                      <button type="submit" class="btn btn-primary mt-3">Update</button>
                        </div>
                    </form>

                </div>
              </div>
            </div>

            <div id="flFormsGrid" v-if="nilam.is_expired" class="col-lg-3 layout-spacing">
            <div class="statbox">
                <div class="widget-header">
                    <div class="row">
                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                            <h4>Delivery Charge</h4>
                        </div>                                                                        
                    </div>
                </div>
                <div class="widget-content widget-content-area">
                    <form @submit.prevent="updateDeliveryCharge()">
                        <div class="col-md-12">
                            <label for="inputPassword4">Delivery Charge</label>
                            <div class="form-group">
                                <input class="form-control" v-model="delivery_charge_amount" type="number" />
                            </div>
                          <button type="submit" class="btn btn-primary mt-3">Update</button>
                        </div>
                    </form>
              </div>
            </div>
        </div>

        <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
          <div class="widget widget-table-one">
              <div class="widget-heading">
                  <h5 class="">Leaderboard </h5>
              </div>

              <div class="widget-content">
                  <div class="transactions-list" v-if="bids.length > 0"
                  v-for="bid in bids" :key="bid.id">
                      <div class="t-item">
                          <div class="t-company-name">
                              <div class="t-icon">
                                  <div class="">
                                      <img class="rounded-circle" :src="bid.bid_user.avatar" :alt="bid.bid_user.name" v-if="bid.bid_user.avatar" height="40px">
                                  </div>
                              </div>
                              <div class="t-name">
                                  <h4>{{ bid.bid_user.name }}</h4>
                                  <p class="meta-date">{{ bid.created_at }}</p>
                              </div>

                          </div>
                          <div class="t-rate rate-dec">
                              <p><span>{{ bid.bid_price }} Point</span></p>
                          </div>
                      </div>
                  </div>

              </div>
          </div>
      </div>
		

			<div class="col-xl-5 col-lg-5 col-md-5 col-sm-12 col-12 layout-spacing" v-if="nilam.is_expired">
          <div class="user-profile layout-spacing">
              <div class="widget-content widget-content-area">
                  <div class="d-flex">
                      <h3 class="">Winner</h3>
                  </div>
                  <div class="text-center user-info">
                      <img :src="winner.avatar" height="80px" alt="avatar" v-if="winner.avatar">
                      <p class="">{{ winner.name }}</p>
                      <p class="text-info">Winner Price: {{ bids[0].bid_price }} Point</p>
                  </div>
                  <div class="text-center">
                    
                      <p class="text-secondary">Delivery Charge: {{ bids[0].delivery_charge }} TK</p>
                      <p class="text-success">Total Price: {{ bids[0].total_price }} TK</p>
                  </div>
                  <div class="user-info-list">

                      <div class="">
                          <ul class="contacts-block list-unstyled">
                              
                              <li class="contacts-block__item">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>{{ winner.joined_at | dateToString }}
                              </li>
                              
                              <li v-if="winner.email" class="contacts-block__item">
                                  <a :href="'mailto:'+winner.email"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>{{ winner.email }}</a>
                              </li>
                              <li class="contacts-block__item">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                                  <span v-if="nilam.delivery_address">{{ nilam.delivery_address }}</span>
                                  <span v-else>{{ winner.area.area_name }}</span>
                              </li>
                              <li class="contacts-block__item">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-phone"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>{{ winner.mobile_no }}
                              </li>
                             
                          </ul>
                      </div>                                    
                  </div>
              </div>
          </div> 
			</div>
		</div>

    <div id="timelineImages" class="col-lg-12" v-if="nilam.is_expired && delivery_status.length > 0">
       <div class="statbox box box-shadow">
          <div class="widget-header">
              <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                      <h4> Timeline </h4>
                  </div>
              </div>
          </div>
          <div class="widget-content widget-content-area pb-1">
             <div class="mt-container mx-auto custom-mt-container">
                <div class="timeline-line">              
                  <div class="item-timeline" v-for="d_status in delivery_status">
                      <p class="t-time custom-t-time">{{ d_status.delivery_status_text }}</p>
                          <div class="t-dot t-dot-info" v-if="d_status.delivery_status == 1">
                          </div>
                        
                          <div class="t-dot t-dot-success" v-if="d_status.delivery_status == 2">
                          </div>
                        
                          <div class="t-dot t-dot-warning" v-if="d_status.delivery_status == 3">
                          </div>

                          <div class="t-dot t-dot-primary" v-if="d_status.delivery_status == 4">
                          </div>

                          <div class="t-dot t-dot-danger" v-if="d_status.delivery_status_text == 'Pending'">
                          </div>
                      <div class="t-text">
                          <p>{{ d_status.comment }}</p>
                          <p class="t-meta-time">{{ d_status.date }}</p>
                          <p class="">Updated By - {{ d_status.admin.name }}</p>
                      </div>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-else>
      <h2 class="text-center">No Bid Yet Found !</h2>
    </div>
	</div>
</template>

<style>
.custom-mt-container{
  position: relative;
}
.custom-t-time{
    position: absolute;
    left: -126px;
  }
  @media only screen and (min-width: 320px) and (max-width:1170px) {
    .custom-mt-container{
      left: 70px;
    }
  }
</style>

<script>
	import { EventBus } from "../../../vue-assets";
	import Mixin from "../../../mixin";
	import Pagination from "../../pagination/Pagination";
  import DatePicker from 'vue2-datepicker';
  import 'vue2-datepicker/index.css';

	export default {
	  mixins: [Mixin],
	  props : ['front_url','nilam_id'],
    components: {
      DatePicker
    },
		data(){
			return {
        current_image : null,
        nilam : null,
        winner : null,
        bids : null,
        delivery_status : null,
        delivery_charge_amount : 0,
				url : base_url,  
        validation_error : {},

        delivery : {
          delivery_status : 0,
          delivery_date : '',
          payment_status : 0,
          // is_return : '',
          comment : ''
        },

        seller_status : {
          payment_status : 0,
          payment_date : '',
          // is_return : '',
          note : '',
        },

        buyer_status : {
          payment_status : 0,
          payment_date : '',
          note : '',
          is_return : '',
        },
			}
		},

        mounted(){
            this.getNilamBidById()
            this.getNilamUserBidById()
            this.DeliveryStatus()
        },

        methods : {
            getNilamBidById() {
              axios
                .get(
                  base_url +
                    "admin/nilam/"+this.nilam_id
                )
                .then((response) => {
                    this.nilam = response.data.data
                    this.winner = response.data.data.win_bid.bid_user ? response.data.data.win_bid.bid_user : null
                    this.current_image = response.data.data.image_one_big;
                    this.delivery.delivery_status = response.data.data.delivery_status
                    this.delivery.delivery_date = response.data.data.delivery_status !=4 ? response.data.data.pickup_date : response.data.data.delivery_date
                    this.delivery.delivery_address = response.data.data.delivery_address
                    this.delivery.from_address = response.data.data.from_address

                    this.buyer_status.payment_status = response.data.data.payment_status
                    this.buyer_status.payment_date = response.data.data.buyer_payment_date
                    this.buyer_status.note = response.data.data.win_bid.note

                    this.seller_status.payment_status = response.data.data.seller_payment_status
                    this.seller_status.payment_date = response.data.data.seller_payment_date
                    this.seller_status.note = response.data.data.seller_payment_note

                    this.delivery.is_return = response.data.data.is_return
                    this.delivery.comment = response.data.data.payment_details

                    this.seller_status.is_pickup = response.data.data.is_pickup
                    this.seller_status.pickup_date = response.data.data.pickup_date
                    this.seller_status.is_return = response.data.data.is_return
                })
                .catch((error) => {
                  console.log(error.response.data.errors);
                });
            },

            DeliveryStatus(){
              axios
                  .get(
                    base_url +
                      "admin/nilam/delivery/status/"+this.nilam_id
                  )
                  .then((response) => {
                    // console.log(response.data.data)
                      this.delivery_status = response.data.data
                      
                  })
                  .catch((error) => {
                    console.log(error.response.data.errors);
              });
            },

            getNilamUserBidById(){
                axios
                  .get(
                    base_url +
                      "admin/nilam/user/bid/"+this.nilam_id
                  )
                  .then((response) => {
                      this.bids = response.data.data
                      this.delivery_charge_amount = response.data.data[0].delivery_charge
                      
                  })
                  .catch((error) => {
                    console.log(error.response.data);
              });
            },

            updateDeliveryStatus(){
                axios
                  .post(
                    base_url +
                      'admin/nilam/bid/update/'+this.nilam_id+'/delivery',this.delivery
                  )
                  .then((response) => {
                      this.successMessage(response.data)
                      this.getNilamBidById() 
                  })
                  .catch((error) => {
                    // console.log(error.response.data)
                    if (error.response.status == 422) 
                    {
                        this.validation_error = error.response.data;
                        this.validationError();
                    } 
                    else 
                    {
                        this.validationError(error.data);
                    }
              });
            },

            updateSellerStatus(){
                axios
                  .post(
                    base_url +
                      'admin/nilam/bid/update/'+this.nilam_id+'/seller-status',this.seller_status
                  )
                  .then((response) => {
                      this.successMessage(response.data)
                      this.getNilamUserBidById() 
                      // console.log(response.data)
                  })
                  .catch((error) => {
                    if (error.response.status == 422) 
                    {
                        this.validation_error = error.response.data;
                        this.validationError();
                    } 
                    else 
                    {
                        this.validationError(error.data);
                    }
              });
            },

            updateBuyerStatus(){
                axios
                  .post(
                    base_url +
                      'admin/nilam/bid/update/'+this.nilam_id+'/buyer-status',this.buyer_status
                  )
                  .then((response) => {
                      this.successMessage(response.data)
                      this.getNilamUserBidById() 
                      // console.log(response.data)
                  })
                  .catch((error) => {
                    if (error.response.status == 422) 
                    {
                        this.validation_error = error.response.data.errors;
                        this.validationError();
                    } 
                    else 
                    {
                        this.validationError(error.data);
                    }
              });
            },

            updateDeliveryCharge() {
                axios
                  .post(
                    base_url +
                      'admin/nilam/bid/update/'+this.bids[0].id+'/delivery-charge',{ delivery_charge_amount : this.delivery_charge_amount}
                  )
                  .then((response) => {
                      this.successMessage(response.data)
                      this.getNilamUserBidById() 
                      // console.log(response.data)
                  })
                  .catch((error) => {
                    if (error.response.status == 422) 
                    {
                        this.validation_error = error.response.data.errors;
                        this.validationError();
                    } 
                    else 
                    {
                        this.validationError(error.data);
                    }
              });
            },

            setDate(){
                let from = JSON.stringify(this.range[0]);
                // console.log(to)
                this.delivery.delivery_date = from;
                // this.getReport()
            },

            setCurrentImage(image) {
              this.current_image = image;
            },

        }
	}
</script>
<style scoped>
.display-table-cell{
  display: table-cell;
  vertical-align: middle;
}

.display-table{
  display: table;
  text-align: center;
  min-height: 103vh;
  width: 100%;
}
.cate-details-left{
  height: 100%;
  text-align: center;
  width: 100%;
  display: table;
}
.cate-details-left.display-table{
  display: table;
}
.cate-details-left .display-table-cell{
  display: table-cell;
  vertical-align: middle;
}
.cate-details-left .small-image {
  position: relative;
  height: auto;
  left: 0;
  right: 0;
  text-align: center;
  display: inline-block;
}
.cate-details-left .small-image .img {
  float: left;
  margin-right: 15px;
}
.cate-details-left .small-image .img img {
  cursor: pointer;
}

.active-small-image {
  border: 1px solid rgb(217, 217, 217);
  opacity: 0.3;
}

.mx-datepicker {
  width : 100%
}

</style>