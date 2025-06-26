<script setup>
import { nextTick, onMounted } from 'vue';
import * as echarts from 'echarts';
import { defineProps, ref, watch } from 'vue';

const props = defineProps({
  data: {
    type: Array,
    default: () => []
  }
})
let getData = ref([]);
watch(
() => props.data,
(newData) => {
  getData.value = newData;
},
{immediate: true}
)
onMounted(() => {
  nextTick(() => {
      const barChart = echarts.init(document.getElementById('barChart'));
  barChart.setOption({
    title: { text: 'Current Month', left: 'center' },
    tooltip: {},
    xAxis: { data: ['Total', 'Disbursed', 'Balance'] },
    yAxis: {},
    series: [
      {
        name: 'Amount',
        type: 'bar',
        //         (Total)              Disbursed               Balance
        data: [getData.value[0] || 0, getData.value[1] || 0, getData.value[2] || 0],
        itemStyle: {
          color: function (params) {
            const colors = ['#0000ff', '#ffa500', '#00cc00'];
            return colors[params.dataIndex];
          }
        }
      }
    ]
  });
  });
});
</script>

<template>
  <div id="barChart" style="height: 300px;" class="bg-white rounded shadow-sm p-3"></div>
</template>
