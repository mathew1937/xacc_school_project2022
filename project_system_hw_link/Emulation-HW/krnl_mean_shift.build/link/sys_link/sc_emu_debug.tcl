set trace_signals(kernel_group) {
  mean_shift_accel_1 {s_axi_control*ARADDR s_axi_control*RDATA s_axi_control*RVALID s_axi_control*RREADY s_axi_control*AWADDR s_axi_control*WDATA s_axi_control*WVALID s_axi_control*WREADY m_axi_gmem1*ARADDR m_axi_gmem1*RDATA m_axi_gmem1*RVALID m_axi_gmem1*RREADY m_axi_gmem1*AWADDR m_axi_gmem1*WDATA m_axi_gmem1*WVALID m_axi_gmem1*WREADY m_axi_gmem2*ARADDR m_axi_gmem2*RDATA m_axi_gmem2*RVALID m_axi_gmem2*RREADY m_axi_gmem2*AWADDR m_axi_gmem2*WDATA m_axi_gmem2*WVALID m_axi_gmem2*WREADY m_axi_gmem4*ARADDR m_axi_gmem4*RDATA m_axi_gmem4*RVALID m_axi_gmem4*RREADY m_axi_gmem4*AWADDR m_axi_gmem4*WDATA m_axi_gmem4*WVALID m_axi_gmem4*WREADY m_axi_gmem3*ARADDR m_axi_gmem3*RDATA m_axi_gmem3*RVALID m_axi_gmem3*RREADY m_axi_gmem3*AWADDR m_axi_gmem3*WDATA m_axi_gmem3*WVALID m_axi_gmem3*WREADY m_axi_gmem5*ARADDR m_axi_gmem5*RDATA m_axi_gmem5*RVALID m_axi_gmem5*RREADY m_axi_gmem5*AWADDR m_axi_gmem5*WDATA m_axi_gmem5*WVALID m_axi_gmem5*WREADY} {}
}

set trace_signals(kernel) {
  ap_start ap_ready ap_done
}

set trace_signals(adapter) {
  *axis_*tdata *axis_*tvalid *axis_*tready S*WADDR S*WDATA S*ARADDR S*RDATA
}

set trace_signals(datamover) {
  stream_t* reg_bus_awaddr reg_bus_wdata
}
