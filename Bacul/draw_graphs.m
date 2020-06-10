function draw_graphs( err,intrare,iesire,handles,k )
    axes(handles.graf_real)
    hold on
    plot(err,'r')
    plot(iesire,'b')
    if k > 100 
        axis([k-100,k,0,100])
    else 
       axis([0,100,0,100]);
    end
    legend({'nivel','error'},'Location','northwest')
    hold off
end

