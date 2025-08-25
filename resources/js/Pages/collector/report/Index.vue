<script setup>
import { defineProps, ref, watch } from 'vue';
import CollectorLayout from '@/Layouts/CollectorLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
import SubHeaderForCollectorReport from '@/Components/dashboard/SubHeaderForCollectorReport.vue';
import TogglePaidOrUnPaid from '@/Components/dashboard/TogglePaidOrUnPaid.vue';
import ReportTable from '@/Components/dashboard/ReportTable.vue';
import PurokComponentForCollectorReport from '@/Components/dashboard/contribution/PurokComponentForCollectorReport.vue';

const props = defineProps({
    contributions: {
        type: Array,
        default: () => []
    },
    activePurok: {
        type: String,
        default: () => ''
    },
    activeStatus: {
        type: String,
        default: () => 'paid'
    },
    contributionsIds: {
        type: Array,
        default: () => []
    },
    members: {
        type: Array,
        default: () => []
    }
});
let getContributions = ref([]);
let getActivePurok = ref('');
let getMembersCount = ref(0);
let getAmmount = ref(0);
let getPaidMembers = ref(0);
let getUnpaidMembers = ref(0);
let getActiveStatus = ref('paid');
let getContributionsIds = ref([]);
const getMembers = ref([]);
watch(() => props.contributions, (newContributions) => {
    getContributions.value = newContributions;
    getAmmount.value = parseInt(
        newContributions.reduce((total, con) => total + parseFloat(con.amount), 0)
    );

    getPaidMembers.value = newContributions.filter(contribution => contribution.status == 'paid').length;
    getUnpaidMembers.value = newContributions.filter(contribution => contribution.status != 'paid').length;
    getMembersCount.value = (getPaidMembers.value + getUnpaidMembers.value);

}, { immediate: true });

watch(() => props.activePurok, (newPurok) => {
    getActivePurok.value = newPurok;
}, { immediate: true });

watch(() => props.activeStatus, (newStatus) => {
    getActiveStatus.value = newStatus;
}, { immediate: true });
import { toRaw } from 'vue';

watch(() => props.contributionsIds, (newContributionsIds) => {
    console.log("Raw contributionsIds:", toRaw(newContributionsIds));
    getContributionsIds.value = Array.isArray(newContributionsIds) ? [...newContributionsIds] : [];
}, { immediate: true });

watch(() => props.members, (newMembers) => {
    getMembers.value = newMembers;
}, { immediate: true });

</script>

<template>
    <div>
        <Head title="Report" />
        <CollectorLayout>

                <div class="head container">
                    <h5 class="mb-0">Report</h5>
                    <p>Contribution Report</p>
                </div>

                    <div class="purok-container container-fluid d-flex justify-content-end align-items-center">
                        <PurokComponentForCollectorReport
                         :activePurok="getActivePurok"
                         :activeStatus="getActiveStatus"
                          />
                    </div>
                    <SubHeaderForCollectorReport
                     :membersCount="getMembersCount"
                      :amount="Number(getAmmount)"
                      :activePurok="getActivePurok"
                      :paidMembers="getPaidMembers"
                      :unpaidMembers="getUnpaidMembers"
                      />


                      <ReportTable 
                      :activeStatus="getActiveStatus"
                      :activePurok="getActivePurok"
                      :contributions="getContributions"
                      :contributionsIds="getContributionsIds"
                      :members="getMembers"
                      />
        </CollectorLayout>
    </div>
</template>



<style lang="css" scoped>

</style>