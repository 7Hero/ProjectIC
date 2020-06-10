function nivel = DAQ_Read_SIM( In,Out )

nivel =1.682*Out(2) - 0.7486*Out(3)+0.002027*In(2)+0.04146*In(3);
end

