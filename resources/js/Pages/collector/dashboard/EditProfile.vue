<script setup>
import { Head, useForm, Link } from "@inertiajs/vue3";

const props = defineProps({
    user: {
        type: Object,
        required: true,
        default: () => ({
            id: null,
            name: "",
            email: "",
            role: "",
        }),
    },
});

// Initialize the form with user data
const form = useForm({
    name: props.user.name,
    email: props.user.email,
});

// Submit handler
const submit = () => {
    form.post(route("profile.update", { id: props.user.id }));
};
</script>

<template>
    <div>
        <Head title="Edit Profile" />
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card shadow-sm rounded">
                        <div class="card-header bg-dark text-white">
                            <h3 class="mb-0">Edit Profile</h3>
                        </div>
                        <div class="card-body">
                            <!-- Form -->
                            <form @submit.prevent="submit">
                                <!-- Name Field -->
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input
                                        type="text"
                                        id="name"
                                        class="form-control"
                                        :class="{ 'is-invalid': form.errors.name }"
                                        v-model="form.name"
                                    />
                                    <div v-if="form.errors.name" class="invalid-feedback">
                                        {{ form.errors.name }}
                                    </div>
                                </div>

                                <!-- Email Field -->
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input
                                        type="email"
                                        id="email"
                                        class="form-control"
                                        :class="{ 'is-invalid': form.errors.email }"
                                        v-model="form.email"
                                    />
                                    <div v-if="form.errors.email" class="invalid-feedback">
                                        {{ form.errors.email }}
                                    </div>
                                </div>

                                <!-- Submit Button -->
                                <div class="d-flex justify-content-end">
                                    <Link
                                        :href="route('collectorProfile.profile')"
                                        class="btn btn-secondary me-2"
                                    >
                                        Cancel
                                    </Link>
                                    <button
                                        type="submit"
                                        class="btn btn-primary"
                                        :disabled="form.processing"
                                    >
                                        Save Changes
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.card-header {
    border-bottom: 0;
}
</style>
