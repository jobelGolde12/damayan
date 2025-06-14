<script setup>
import { ref, watch } from "vue";
import { defineProps } from "vue";

const props = defineProps({
    users: {
        type: Array,
        default: () => [],
    },
});
const getUsers = ref([]);
const adminCount = ref(0);
const secretaryCount = ref(0);
const presidentCount = ref(0);
const vicePresidentCount = ref(0);
const purokLeaderCount = ref(0);
const treasurerCount = ref(0);
const colectorCount = ref(0);
watch(
    () => props.users,
    (newUsers) => {
        getUsers.value = newUsers;
        //Kuhaon ang count ng bawat role
        adminCount.value = getUsers.value.filter(
            (user) => user.role === "admin"
        ).length;
        secretaryCount.value = getUsers.value.filter(
            (user) => user.role === "secretary"
        ).length;
        presidentCount.value = getUsers.value.filter(
            (user) => user.role === "president"
        ).length;
        vicePresidentCount.value = getUsers.value.filter(
            (user) => user.role === "vise_president"
        ).length;
        purokLeaderCount.value = getUsers.value.filter(
            (user) => user.role === "purok_leader"
        ).length;
        treasurerCount.value = getUsers.value.filter(
            (user) => user.role === "treasurer"
        ).length;
        colectorCount.value = getUsers.value.filter(
            (user) => user.role === "colector"
        ).length;
        console.log("Users updated2:", getUsers.value);
    },
    { immediate: true }
);
const roles = [
    {
        name: "Admin",
        description: "Full access",
        users: adminCount.value + (adminCount.value > 1 ? " users" : " user"),
        access: "Full modules",
        icon: "bi bi-person",
    },
    {
        name: "Collector",
        description: "Jurisdiction-based",
        users: colectorCount.value + (colectorCount.value > 1 ? " users" : " user"),
        access: "Status updates",
        icon: "bi bi-people",
    },
    {
        name: "president",
        description: "Full access",
        users: presidentCount.value + (presidentCount.value > 1 ? " users" : " user"),
        access: "Full modules",
        icon: "bi bi-person",
    }
    ,
    {
        name: "Vice President",
        description: "Full access",
        users: vicePresidentCount.value + (vicePresidentCount.value > 1 ? " users" : " user"),
        access: "Full modules",
        icon: "bi bi-person",
    },
    {
        name: "Secretary",
        description: "Full access",
        users: secretaryCount.value + (secretaryCount.value > 1 ? " users" : " user"),
        access: "Full modules",
        icon: "bi bi-person",
    },
    {
        name: "Purok Leader",
        description: "Jurisdiction-based",
        users: purokLeaderCount.value + (purokLeaderCount.value > 1 ? " users" : " user"),
        access: "Status updates",
        icon: "bi bi-people",
    },
    {
        name: "Treasurer",
        description: "Jurisdiction-based",
        users: treasurerCount.value + (treasurerCount.value > 1 ? " users" : " user"),
        access: "Status updates",
        icon: "bi bi-people",
    },
];
</script>
<template>
    <div>
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
    </div>
</template>