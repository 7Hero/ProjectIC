function draw_bacuri( out,handles,i )
   % down tank 
    axes(handles.axes5);                    
    x_d_t=[0,100,100,0];
    y_d_t=[100-out(i), 100-out(i),0,0]; 
    fill (x_d_t,y_d_t,'b');
    axis([0,100,0,100]);
    %up tank           
    axes (handles.axes4) ;
    x_u_t=[0,100,100,0]; 
    y_u_t=[out(i),out(i), 0,0];  
    fill (x_u_t,y_u_t, 'b')
    axis([0,100,0,100]);
end

