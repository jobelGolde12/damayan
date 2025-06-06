<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AdminLayout from '@/Layouts/AdminLayout.vue';
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue';
</script>
<template>
    <Head title="Reports" />
    <div>
        <AdminLayout>
            <HeaderComponent />
                
        </AdminLayout>
    </div>
</template>