<script setup>
import { onMounted } from 'vue';
import * as echarts from 'echarts';

onMounted(() => {
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
        data: [12000, 12000, 5000],
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
</script>

<template>
  <div id="barChart" style="height: 300px;" class="bg-white rounded shadow-sm p-3"></div>
</template>
