<script setup>
import { Head, Link, router } from "@inertiajs/vue3";
import AdminLayout from "@/Layouts/AdminLayout.vue";
import HeaderComponent from "@/Components/dashboard/HeaderComponent.vue";
import { defineProps, ref, watch } from "vue";

const props = defineProps({
    users: {
        type: Array,
        default: () => [],
    },
});
let getUsers = ref([]);
let userIdClicked = ref(null);
watch(
    () => props.users,
    (newUsers) => {
        getUsers.value = newUsers;
    },
    { immediate: true }
);

const roles = [
    {
        name: "Admin",
        description: "Full access",
        users: "2 users",
        access: "Full modules",
        icon: "bi bi-person",
    },
    {
        name: "Collector",
        description: "Jurisdiction-based",
        users: "4 users",
        access: "Status updates",
        icon: "bi bi-people",
    },
];
const action1Func = (userId) => {
    userIdClicked.value = userId;
};
const editFunc = () => {
    router.get(route('role.edit', {user: userIdClicked.value}));
};
</script>
<template>
    <div>
        <Head title="Role Management" />
        <AdminLayout>
            <HeaderComponent />

            <div class="container mt-4 role-container">
                <h5 class="fw-bold">User and Role Management</h5>

                <!-- User Management Table -->
                <div class="card mt-3">
                    <div class="card-body">
                        <h6 class="fw-semibold">User Management</h6>
                        <div class="table-responsive">
                            <table class="table table-bordered align-middle">
                                <thead class="table-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>NAME</th>
                                        <th>EMAIL</th>
                                        <th>USERS</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(user, index) in getUsers"
                                        :key="index"
                                    >
                                        <td>{{ user.id }}</td>
                                        <td>{{ user.name }}</td>
                                        <td>{{ user.email }}</td>
                                        <td>{{ user.role }}</td>
                                        <td>
                                            <button
                                                class="btn btn-sm btn-light"
                                            >
                                                <i
                                                    class="bi bi-three-dots-vertical action1"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#action1Modal"
                                                    @click="action1Func(user.id)"
                                                ></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <Link :href="route('role.add')" class="btn btn-primary float-end mt-2">
                            Add User
                        </Link>
                    </div>
                </div>

                <!-- Roles and Permissions Table -->
                <div class="card mt-4">
                    <div class="card-body">
                        <h6 class="fw-semibold">Roles and Permissions</h6>
                        <div class="table-responsive">
                            <table class="table table-bordered align-middle">
                                <thead class="table-light">
                                    <tr>
                                        <th>Role</th>
                                        <th>Description</th>
                                        <th>Users</th>
                                        <th>Access</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(role, index) in roles"
                                        :key="index"
                                    >
                                        <td>
                                            <i :class="role.icon"></i>
                                            {{ role.name }}
                                        </td>
                                        <td>{{ role.description }}</td>
                                        <td>{{ role.users }}</td>
                                        <td>{{ role.access }}</td>
                                        <td>
                                            <button
                                                class="btn btn-sm btn-light"
                                            >
                                                <i
                                                    class="bi bi-three-dots-vertical"
                                                ></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="bottom-role-container container"></div>
            </div>
        </AdminLayout>

        <!-- Modal for the action1  -->
        <div
            class="modal fade"
            id="action1Modal"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">
                            Action
                        </h1>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                        ></button>
                    </div>
                   <div class="modal-footer">
                      <div class="container-fluid">
                        <div class="row gx-2">
                          <div class="col">
                            <button
                              type="button"
                              class="btn btn-primary w-100"
                              data-bs-dismiss="modal"
                              @click="editFunc()"
                            >
                              Edit
                            </button>
                          </div>
                          <div class="col">
                            <button type="button" class="btn btn-warning w-100"
                            data-bs-dismiss="modal"
                            >
                              Delete
                            </button>
                          </div>
                          <div class="col">
                            <button type="button" class="btn btn-secondary w-100"
                            data-bs-dismiss="modal"
                            >
                              Cancel
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
.role-container {
    width: 100%;
    height: 100%;
    overflow-y: scroll;
}
.bottom-role-container {
    width: 100%;
    height: 30%;
}
</style>
