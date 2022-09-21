<template>
  <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    <div class="widget widget-table-two">
      <div class="widget-content">
        <div class="table-responsive">
          <table class="table text-center">
            <thead>
              <tr>
                <th class="th-content">Pkg Name</th>
                <th class="th-content">Month</th>
                <th class="th-content">Amount</th>
                <th class="th-content">Discount</th>
                <th class="th-content">Final Amount</th>
                <th class="th-content">Status</th>
                <th class="th-content">Action</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="plan in plans" :key="plan.id">
                <td class="td-content">{{ plan.plan_name }}</td>
                <td class="td-content">{{ plan.total_month }}</td>
                <td class="td-content">{{ plan.total_amount }}</td>
                <td class="td-content">{{ plan.discount }}</td>
                <td class="td-content">{{ plan.final_amount }}</td>
                <td class="td-content">
                  <span
                    :class="
                      plan.status == 1
                        ? 'badge badge-success'
                        : 'badge badge-warning'
                    "
                  >
                    {{ plan.status == 1 ? "Active" : "Inactive" }}</span
                  >
                </td>
                <td class="td-content text-center">
                  <a
                    @click="Editplan(plan)"
                    class="btn btn-warning rounded-circle"
                    type="button"
                    title="Edit"
                  >
                    <i class="fa fa-edit"></i>
                  </a>

                  <a
                    @click="deleteplan(plan.id)"
                    class="btn btn-danger rounded-circle"
                    type="button"
                    title="Delete"
                    ><i class="fa fa-trash"></i
                  ></a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div>
      <update-plan />
    </div>
  </div>
</template>
<script>
import { EventBus } from "../../../../vue-assets";
import Updateplan from "./UpdatePlan";
import Mixin from "../../../../mixin";
export default {
  mixins: [Mixin],
  components: {
    "update-plan": Updateplan,
  },
  data() {
    return {
      keyword: "",
      plans: [],
      url: base_url,
    };
  },

  mounted() {
    var _this = this;
    _this.getplan();
    EventBus.$on("plan-created", function () {
      _this.getplan();
    });
  },

  methods: {
    getplan(page = 1) {
      axios
        .get(base_url + "admin/subscription-plan-list")
        .then((response) => {
          this.plans = response.data;
        })
        .catch((error) => {
          console.log("Some error Occure!");
        });
    },

    Editplan(value) {
      EventBus.$emit("update-plan", value);
    },

    deleteplan(id) {
      Swal.fire(
        {
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
          axios.delete(base_url + "admin/subscription/" + id).then((res) => {
            EventBus.$emit("plan-created");
            this.successMessage(res.data);
          });
        }
      });
    },
  },
};
</script>