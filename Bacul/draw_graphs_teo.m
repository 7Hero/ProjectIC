function draw_graphs_teo (i,error_teo,nivel_teo,control_teo,handles)
    axes(handles.axes7)
    hold on
    plot(1:i,nivel_teo,'g',1:i,control_teo,'r',1:i,error_teo,'c')
    if i > 100 
        axis([i-100,i,0,100])
    else 
       axis([0,100,0,100]);
    end
    legend({'nivel_teo','control_teo','error_teo'},'Location','northwest')
    hold off
end
