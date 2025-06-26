<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue';
import { Head, Link } from '@inertiajs/vue3';
import { defineProps, ref, watch } from 'vue';
import ContributionReportForAdmin from '@/Components/dashboard/report/ContributionReportForAdmin.vue';
import RecentContributionForAdmin from '@/Components/dashboard/report/RecentContributionForAdmin.vue';
import ReportTable from '@/Components/dashboard/ReportTable.vue';

const props = defineProps({
    contributions: {
        type: Array,
        default: () => []
    },
});
let getContributions = ref([]);
watch(() => props.contributions, (newContributions) => {
    getContributions.value = newContributions;
    console.log("contributions: ", getContributions.value)
}, { immediate: true });

</script>

<template>
    <div>
        <Head title="Report" />
        <AdminLayout>
            <HeaderComponent />

                <div class="head container">
                    <h5 class="mb-0">Report</h5>
                </div>
                    <ContributionReportForAdmin :contributions="getContributions"/>
        </AdminLayout>
    </div>
</template>



<style lang="css" scoped>

</style>