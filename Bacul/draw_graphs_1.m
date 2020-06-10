function draw_graphs_1( err1,intrare,iesire1,handles,k )
    axes(handles.axes7)
    hold on
    plot(err1,'r')
    plot(iesire1,'b')
    if k > 100 
        axis([k-100,k,0,100])
    else 
       axis([0,100,0,100]);
    end
    legend({'nivel_ident','error_ident'},'Location','northwest')
    hold off
end

