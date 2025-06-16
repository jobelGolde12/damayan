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
});
let getMembersCount = ref(0);
let getAmount = ref(0);
watch(() => props.amount, (newAmount) => {
    getAmount.value = newAmount;
}, { immediate: true });
watch(() => props.membersCount, (newCount) => {
    getMembersCount.value = newCount;
}, { immediate: true });
</script>
<template>
    <div>
        <div class="container-fluid header-container px-5 mt-3">
            <table class="table">
                <thead class="thead">
                    <tr style="border-top: 1px solid #000; border-bottom: 1px solid #000;">
                        <td>MEMBERS</td>
                        <td>AMOUNT</td>
                        <td>PUROK</td>
                        <td>PAID</td>
                        <td>UN PAID</td>
                    </tr>
                </thead>
                <tbody class="tbody">
                    <tr style="border-top: 1px solid #000; border-bottom: 1px solid #000;">
                        <td>{{ getMembersCount }} Members</td>
                        <td>{{ getAmount }}</td>
                        <td>1</td>
                        <td>35 Members</td>
                        <td>5 Members</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>



<style lang="css" scoped>

</style>