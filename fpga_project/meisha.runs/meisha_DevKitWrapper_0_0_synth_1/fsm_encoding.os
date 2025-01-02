
 add_fsm_encoding \
       {spi_slave_controller.state} \
       { }  \
       {{000 000} {001 001} {011 100} {100 011} {101 010} }

 add_fsm_encoding \
       {spi_slave_axi_plug.AW_CS} \
       { }  \
       {{000 00} {010 01} {011 10} {100 11} }

 add_fsm_encoding \
       {spi_slave_axi_plug.AR_CS} \
       { }  \
       {{000 00} {001 11} {010 01} {100 10} }

 add_fsm_encoding \
       {spi_master_axi_if.AW_CS} \
       { }  \
       {{000 000} {001 101} {010 010} {011 001} {100 100} {101 011} }
