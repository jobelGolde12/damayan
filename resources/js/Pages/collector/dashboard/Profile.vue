<script setup>
import { Head, Link } from "@inertiajs/vue3";
import { defineProps, computed } from "vue";
import CollectorLayout from "@/Layouts/CollectorLayout.vue";
import HeaderComponent from "@/Components/dashboard/HeaderComponent.vue";
const props = defineProps({
    user: {
        type: Object,
        required: true,
        default: () => ({
            id: null,
            name: "",
            email: "",
            email_verified_at: null,
            role: "",
            created_at: null,
            updated_at: null,
        }),
    },
});

const formattedDate = (dateString) => {
    if (!dateString) return "Not available";
    const options = { year: "numeric", month: "long", day: "numeric" };
    return new Date(dateString).toLocaleDateString(undefined, options);
};

const isVerified = computed(() => !!props.user.email_verified_at);
</script>

<template>
    <div>
        <Head title="Profile Page" />
       <CollectorLayout>
        <HeaderComponent />

         <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card shadow-sm rounded">
                        <div class="card-header bg-dark text-white">
                            <h3 class="mb-0">Profile Details</h3>
                        </div>
                        <div class="card-body">
                            <!-- User Details -->
                            <div class="d-flex align-items-center mb-4">
                                <div class="rounded-circle bg-secondary text-white d-flex justify-content-center align-items-center" style="width: 80px; height: 80px; font-size: 2rem;">
                                    {{ props.user.name.charAt(0).toUpperCase() }}
                                </div>
                                <div class="ms-4">
                                    <h4 class="mb-0">{{ props.user.name }}</h4>
                                    <p class="text-muted mb-0">{{ props.user.email }}</p>
                                    <small :class="isVerified ? 'text-success' : 'text-danger'">
                                        {{ isVerified ? "Email Verified" : "Email Not Verified" }}
                                    </small>
                                </div>
                            </div>

                            <!-- Profile Information -->
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <strong>Role:</strong> {{ props.user.role }} {{ props.user.purok }}
                                </li>
                                <li class="list-group-item">
                                    <strong>Member Since:</strong> {{ formattedDate(props.user.created_at) }}
                                </li>
                                <li class="list-group-item">
                                    <strong>Until:</strong> {{ formattedDate(props.user.updated_at) }}
                                </li>
                            </ul>

                            <!-- Actions -->
                            <div class="mt-4 d-flex justify-content-end">
                                <Link
                                    :href="route('collectorProfile.editRoute')"
                                    class="btn btn-primary me-2"
                                >
                                    Edit Profile
                                </Link>
                                <Link
                                    :href="route('dashboard')"
                                    class="btn btn-secondary"
                                >
                                    Back to Dashboard
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </CollectorLayout>
    </div>
</template>

<style scoped>
.card-header {
    border-bottom: 0;
}
.rounded-circle {
    font-weight: bold;
    background-color: #6c757d !important;
}
.list-group-item {
    font-size: 1rem;
}
</style>
