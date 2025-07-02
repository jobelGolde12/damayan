<script setup>
import { useForm } from "@inertiajs/vue3";
import { Head } from "@inertiajs/vue3";
import AdminLayout from "@/Layouts/AdminLayout.vue";
import HeaderComponent from "@/Components/dashboard/HeaderComponent.vue";
import { defineProps, watch, ref } from "vue";

const props = defineProps({
    members: {
        type: Array,
        default: () => [],
    },
    users: {
        type: Array,
        default: () => [],
    },
});

let getMembers = ref([]);
let getFullName = ref([]);
const getCollectors = ref([]);
const getUsers = ref([]);
// Create a full name from first, middle, and last name || pero ang hali sa users full name na
watch(
  [() => props.members, () => props.users],
  ([membersData, usersData]) => {
    // Map members
    const memberFullNames = (membersData || []).map((member) => ({
      id: member.id,
      fullName: `${member.first_name} ${member.middle_name ?? ""} ${member.last_name}`
        .replace(/\s+/g, " ")
        .trim(),
    }));

    // Map users
    const userFullNames = (usersData || []).map((user) => ({
      id: user.id,
      fullName: user.name,
    }));

    // Combine
    getFullName.value = [...memberFullNames, ...userFullNames];

    getUsers.value = usersData || [];
    getCollectors.value = (usersData || []).filter((user) => user.role === 'collector');
  },
  { immediate: true }
);


const form = useForm({
    member_id: "",
    amount: "",
    payment_date: "",
    collector: "",
    status: "",
    purok: "",
});

const submit = () => {
    // console.log("form data: " , form);
    // return;
    form.post(route("contributions.store"), {
        onSuccess: () => alert("Contribution created!"),
        onError: (err) => console.log("An error occured: ", err),
    });
};
</script>

<template>
    <Head title="Add Contribution" />
    <AdminLayout>
        <HeaderComponent />
        <div class="contri-container py-1">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card rounded-4">
                        <div class="card-header text-center">
                            <h4 class="mb-0">Create Contribution</h4>
                        </div>
                        <div class="card-body p-4">
                            <form @submit.prevent="submit">
                                <!-- Member Name Dropdown -->
                                <div class="mb-3">
                                    <label for="member_id" class="form-label"
                                        >Member Name</label
                                    >
                                    <select
                                        v-model="form.member_id"
                                        id="member_id"
                                        class="form-select"
                                        :class="{
                                            'is-invalid': form.errors.member_id,
                                        }"
                                    >
                                        <option disabled value="">
                                            -- Select Member --
                                        </option>
                                        <option
                                            v-for="member in getFullName"
                                            :key="member.id"
                                            :value="member.id"
                                        >
                                            {{ member.fullName }}
                                        </option>
                                    </select>
                                    <div
                                        v-if="form.errors.member_id"
                                        class="invalid-feedback"
                                    >
                                        {{ form.errors.member_id }}
                                    </div>
                                </div>

                                <!-- Amount -->
                                <div class="mb-3">
                                    <label for="amount" class="form-label"
                                        >Amount</label
                                    >
                                    <input
                                        v-model="form.amount"
                                        type="number"
                                        step="0.01"
                                        id="amount"
                                        class="form-control"
                                        :class="{
                                            'is-invalid': form.errors.amount,
                                        }"
                                        placeholder="Enter amount"
                                    />
                                    <div
                                        v-if="form.errors.amount"
                                        class="invalid-feedback"
                                    >
                                        {{ form.errors.amount }}
                                    </div>
                                </div>

                                <!-- Payment Date -->
                                <div class="mb-3">
                                    <label for="payment_date" class="form-label"
                                        >Payment Date</label
                                    >
                                    <input
                                        v-model="form.payment_date"
                                        type="datetime-local"
                                        id="payment_date"
                                        class="form-control"
                                        :class="{
                                            'is-invalid':
                                                form.errors.payment_date,
                                        }"
                                    />
                                    <div
                                        v-if="form.errors.payment_date"
                                        class="invalid-feedback"
                                    >
                                        {{ form.errors.payment_date }}
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="amount" class="form-label"
                                        >Collector</label
                                    >
                                    <select
                                        id="collector"
                                        class="select form-control"
                                        v-model="form.collector"
                                        v-if="getCollectors.length > 0"
                                    >
                                        <option
                                            :value="data.name"
                                            v-for="data in getCollectors"
                                            :key="data.index"
                                        >
                                            {{ data.name }}
                                        </option>
                                    </select>

                                    <div class="text-center text-muted" v-else>
                                        No collector found, leave it blank.
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="amount" class="form-label"
                                        >Status</label
                                    >
                                    <select
                                        v-model="form.status"
                                        class="form-control"
                                    >
                                        <option value="" disabled>
                                            Paid or Not
                                        </option>
                                        <option value="paid">Paid</option>
                                        <option value="not_paid">Not</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="amount" class="form-label"
                                        >Purok</label
                                    >
                                    <select
                                        v-model="form.purok"
                                        class="form-control"
                                    >
                                        <option value="purok1">1</option>
                                        <option value="purok2">2</option>
                                        <option value="purok3">3</option>
                                        <option value="purok4">4</option>
                                    </select>
                                </div>

                                <div class="d-flex justify-content-end">
                                    <button
                                        type="submit"
                                        class="btn btn-success px-4 rounded-pill"
                                    >
                                        Submit
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-bottom"></div>
        </div>
    </AdminLayout>
</template>

<style scoped>
.contri-container {
    width: 100%;
    height: 100%;
    overflow-y: scroll;
}
.container-bottom {
    width: 50%;
    height: 30%;
}
</style>
