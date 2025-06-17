<script setup>
import { defineProps, ref, watch } from 'vue';
const props = defineProps({
    membersCount: {
        type: Number,
        default: 0
    },
    amount: {
        type: Number,
        default: 0
    },
    activePurok: {
        type: String,
        default: ''
    },
    paidMembers: {
        type: Number,
        default: 0
    },
    unpaidMembers: {
        type: Number,
        default: 0
    }
});
let getMembersCount = ref(0);
let getAmount = ref(0);
let getActivePurok = ref('');
 let getPaidMembers = ref(''); // Eh convert sa string para ma butangan Members na text
let getUnpaidMembers = ref('');
watch(() => props.amount, (newAmount) => {
    getAmount.value = newAmount;
}, { immediate: true });
watch(() => props.membersCount, (newCount) => {
    getMembersCount.value = newCount;
}, { immediate: true });
watch(() => props.activePurok, (newPurok) => {
    getActivePurok.value = newPurok;
}, { immediate: true });
watch(() => props.paidMembers, (newPaid) => {
    getPaidMembers.value = newPaid.toString() + (newPaid === 1 ? ' Member' : ' Members');
}, { immediate: true });
watch(() => props.unpaidMembers, (newUnpaid) => {
    getUnpaidMembers.value = newUnpaid.toString() + (newUnpaid === 1 ? ' Member' : ' Members');
}, { immediate: true });
</script>
<template>
    <div>
        <div class="container-fluid header-container px-5 mt-3">
            <table class="table">
                <thead class="thead">
                    <tr style="border-top: 1px solid #000; border-bottom: 1px solid #000;">
                        <td class="bg-light">MEMBERS</td>
                        <td class="bg-light">AMOUNT</td>
                        <td class="bg-light">PUROK</td>
                        <td class="bg-light">PAID</td>
                        <td class="bg-light">UN PAID</td>
                    </tr>
                </thead>
                <tbody class="tbody">
                    <tr style="border-top: 1px solid #000; border-bottom: 1px solid #000;">
                        <td class="bg-light">{{ getMembersCount }} Members</td>
                        <td class="bg-light">{{ getAmount }}</td>
                        <td class="bg-light">{{ getActivePurok[5] }}</td>
                        <td class="bg-light">{{ getPaidMembers }}</td>
                        <td class="bg-light">{{ getUnpaidMembers }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>



<style lang="css" scoped>

</style>