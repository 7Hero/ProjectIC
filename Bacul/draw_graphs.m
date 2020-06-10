function draw_graphs( i,error,nivel,control,handles)
    axes(handles.graf_real)
    hold on
    plot(1:i,nivel,'g',1:i,control,'r',1:i,error,'c')
    if i > 100 
        axis([i-100,i,0,100])
    else 
       axis([0,100,0,100]);
    end
    legend({'nivel','control','error'},'Location','northwest')
    hold off
end

