function nivel = DAQ_Read_SIM( In,Out ,handles)
v = get(handles.selecion,'value'); 
switch v 
    case 2
        nivel =1.682*Out(2) - 0.7486*Out(3)+0.002027*In(2)+0.04146*In(3);
    case 3
         nivel =1.682*Out(2) - 0.7486*Out(3)+0.002027*In(2)+0.04146*In(3);
    case 4
        nivel  = 1.682*Out(2) - 0.7486*Out(3)+0.0001115*In(1)+0.04129*In(2)-0.03103*In(3);
end

