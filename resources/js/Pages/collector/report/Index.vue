<script setup>
import CollectorLayout from '@/Layouts/CollectorLayout.vue';
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue';
import Purok from '@/Components/dashboard/contribution/Purok.vue';
import { Head, Link } from '@inertiajs/vue3';
import { defineProps, ref, watch } from 'vue';
import SubHeaderForCollectorReport from '@/Components/dashboard/SubHeaderForCollectorReport.vue';

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
    }
});
let getContributions = ref([]);
let getActivePurok = ref('');
let getMembersCount = ref(0);
let getAmmount = ref(0);
watch(() => props.contributions, (newContributions) => {
    getContributions.value = newContributions;
    getAmmount.value = newContributions.reduce((total, contribution) => total + contribution.amount, 0);
    console.log("Contributions: ", getContributions.value);
}, { immediate: true });
watch(() => props.activePurok, (newPurok) => {
    getActivePurok.value = newPurok;
}, { immediate: true });
watch(() => props.membersCount, (newCount) => {
    getMembersCount.value = newCount;
}, { immediate: true });
</script>

<template>
    <div>
        <Head title="Report" />
        <CollectorLayout>
            <HeaderComponent />

                <div class="head container">
                    <h5>Report</h5>
                    <p>Contribution Report</p>
                </div>

                    <div class="purok-container container-fluid d-flex justify-content-end align-items-center">
                        <Purok :activePurok="getActivePurok" />
                    </div>
                    <SubHeaderForCollectorReport :membersCount="getMembersCount" :amount="Number(getAmmount)"/>
        </CollectorLayout>
    </div>
</template>



<style lang="css" scoped>

</style>