<script setup>
import { Link } from "@inertiajs/vue3";
</script>

<template>
    <div>
        <Link
            :href="route('contributions.add')"
            class="btn btn-success"
            title="Add Contribution"
        >
            <span class="d-inline d-lg-none">
                <i class="bi bi-plus-lg"></i>
            </span>
            <span class="d-none d-lg-inline">Add Contribution</span>
        </Link>
    </div>
</template>

<style></style>
