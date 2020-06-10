function nivel = DAQ_Read_SIM_teoretic( In, Out )

nivel = 1.6947*Out(2) - 0.7566 *Out(3) + 0.01865*In(3) + 0.02047*In(2);
end

