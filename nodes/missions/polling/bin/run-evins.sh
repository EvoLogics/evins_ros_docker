#!/bin/sh
ID=$1
mkdir -p /opt/evins/log/log.v$ID
/opt/evins/bin/evins console -noshell -sname v$ID \
	        -sasl error_logger_mf_dir \"/opt/evins/log/log.v$ID\" \
	        -evins log_output on \
		       fabric_config \"/opt/evins/etc/fsm-$ID.conf\"
