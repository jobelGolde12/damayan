<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
import { defineProps, ref, watch } from 'vue';
import ContributionReportForAdmin from '@/Components/dashboard/report/ContributionReportForAdmin.vue';
import RecentContributionForAdmin from '@/Components/dashboard/report/RecentContributionForAdmin.vue';

const props = defineProps({
    contributions: {
        type: Array,
        default: () => []
    },
});
let getContributions = ref([]);
watch(() => props.contributions, (newContributions) => {
    getContributions.value = newContributions;
}, { immediate: true });

</script>

<template>
    <div>
        <Head title="Report" />
        <AdminLayout>

                <div class="container-fluid px-0 report-container">
                    <div class="head container">
                    <h5 class="mb-0 mx-3">Report</h5>
                </div>
                <div class="container">
                    <ContributionReportForAdmin :contributions="getContributions"/>
                    <RecentContributionForAdmin :recent="getContributions" />
                </div>

                <div class="extra-space"></div>
                </div>
        </AdminLayout>
    </div>
</template>



<style lang="css" scoped>
.report-container {
    overflow-y: auto;
    max-height: 100vh;
}
.extra-space {
    height: 100px; 
    background: transparent;
}

</style>