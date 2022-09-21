<template>
  <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    <div class="widget widget-table-two">
      <div class="widget-content">
        <div class="table-responsive">
          <table class="table text-center">
            <thead>
              <tr>
                <th class="th-content">Image</th>
                <th class="th-content">Name</th>
                <th class="th-content">Email</th>
                <th class="th-content">Role</th>
                <th class="th-content">Status</th>
                <th class="th-content">Action</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="admin in admins" :key="admin.id">
                <td class="td-content">
                  <img v-lazy="url + 'images/admin/' + admin.avatar" alt="avatar" />
                </td>
                <td class="td-content">{{ admin.name }}</td>
                <td class="td-content">{{ admin.email }}</td>
                <td class="td-content">{{ admin.role.role_name }}</td>
                <td class="td-content">
                  <span
                    :class="
                      admin.status == 1
                        ? 'badge badge-success'
                        : 'badge badge-warning'
                    "
                  >
                    {{ admin.status == 1 ? "Active" : "Inactive" }}</span
                  >
                </td>
                <td class="td-content text-center">
                  <a
                    @click="EditAdmin(admin)"
                    class="btn btn-warning rounded-circle"
                    type="button"
                    title="Edit"
                    ><svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="24"
                      height="24"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      class="feather feather-edit"
                    >
                      <path
                        d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"
                      ></path>
                      <path
                        d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"
                      ></path></svg
                  ></a>

                  <a
                    @click="deleteAdmin(admin.id)"
                    class="btn btn-danger rounded-circle"
                    type="button"
                    title="Delete"
                    ><svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="24"
                      height="24"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      class="feather feather-trash-2"
                    >
                      <polyline points="3 6 5 6 21 6"></polyline>
                      <path
                        d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"
                      ></path>
                      <line x1="10" y1="11" x2="10" y2="17"></line>
                      <line x1="14" y1="11" x2="14" y2="17"></line></svg
                  ></a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div>
      <update-admin />
    </div>
  </div>
</template>
<script>
import { EventBus } from "../../../vue-assets";
import Mixin from "../../../mixin";
import UpdateAdmin from "./UpdateAdmin";
export default {
  components: { UpdateAdmin },
  data() {
    return {
      admins: [],
      url: base_url,
    };
  },

  mounted() {
    var _this = this;
    _this.getAdmin();
    EventBus.$on("admin-created", function () {
      _this.getAdmin();
    });
  },

  methods: {
    getAdmin() {
      axios
        .get("get-admin")
        .then((response) => {
          this.admins = response.data;
        })
        .catch((error) => {
          console.log("Some error Occure!");
        });
    },

    EditAdmin(value) {
      EventBus.$emit("update-admin", value);
    },

    deleteAdmin(id) {
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
          axios.delete(base_url + "admin/admin/" + id).then((res) => {
            EventBus.$emit("admin-created");
            this.successMessage(res.data);
          });
        }
      });
    },
  },
};
</script>