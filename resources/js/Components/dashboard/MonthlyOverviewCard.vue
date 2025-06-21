<script setup>
import { onMounted } from 'vue';
import * as echarts from 'echarts';

onMounted(() => {
  const monthlyChart = echarts.init(document.getElementById('monthlyChart'));
  monthlyChart.setOption({
    title: { text: 'Monthly Overview', left: 'center' },
    tooltip: { trigger: 'axis' },
    legend: {
      data: ['Total Collected', 'Total Disbursed'],
      top: '10%'
    },
    xAxis: {
      type: 'category',
      data: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
    },
    yAxis: { type: 'value' },
    series: [
      {
        name: 'Total Collected',
        type: 'bar',
        data: [40000, 30000, 35000, 45000, 30000, 40000],
        itemStyle: { color: '#0000ff' }
      },
      {
        name: 'Total Disbursed',
        type: 'bar',
        data: [30000, 25000, 30000, 35000, 20000, 30000],
        itemStyle: { color: '#00cc00' }
      }
    ]
  });
});
</script>

<template>
  <div id="monthlyChart" style="height: 300px;" class="bg-white rounded shadow-sm p-3"></div>
</template>
