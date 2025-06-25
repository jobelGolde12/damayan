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
    activePurok: {
        type: String,
        default: () => ''
    },
    membersCount: {
        type: Number,
        default: 0
    },
    activeStatus: {
        type: String,
        default: () => 'paid'
    }
});
let getContributions = ref([]);
let getActivePurok = ref('');
let getMembersCount = ref(0);
let getAmmount = ref(0);
let getPaidMembers = ref(0);
let getUnpaidMembers = ref(0);
let getActiveStatus = ref('paid');
watch(() => props.contributions, (newContributions) => {
    getContributions.value = newContributions;
    getAmmount.value = newContributions.reduce((total, contribution) => total + contribution.amount, 0);
    getPaidMembers.value = newContributions.filter(contribution => contribution.status == 'paid').length;
    getUnpaidMembers.value = newContributions.filter(contribution => !contribution.status != 'paid').length;
    console.log("Contributions: ", getContributions.value);
}, { immediate: true });
watch(() => props.activePurok, (newPurok) => {
    getActivePurok.value = newPurok;
}, { immediate: true });
watch(() => props.membersCount, (newCount) => {
    getMembersCount.value = newCount;
}, { immediate: true });
watch(() => props.activeStatus, (newStatus) => {
    getActiveStatus.value = newStatus;
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
                    <ContributionReportForAdmin />
                      <ReportTable :contributions="getContributions"/>
        </AdminLayout>
    </div>
</template>



<style lang="css" scoped>

</style>