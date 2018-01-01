function graph = graph_construct(Neuron1, Neuron2, celegansneurongenes, excitatory, inhibitory)
for i = 1:length(Neuron1)
    
    mtemp = str2mat(Neuron1(i));
    %intcheck = str2num(mtemp(3));
    
    %if ischar(intcheck) == 1
    %         str_temp = mat2str(mtemp(1:3));
    %end
    comp = mtemp(1:3);
    %     if ischar(intcheck) == 0
    %         str_temp = mat2str(mtemp(1:2));
    %     end
    
    if strcmpi(comp,'IL1') == 1 || strcmpi(comp,'IL2') == 1
        
    elseif isstrprop(comp(1,3), 'digit') == 1
        comp = comp(1,1:2);
    end
    
    c = 1;
    for j = 1:length(celegansneurongenes)
        if strcmpi(comp, celegansneurongenes(j,1)) == 1
            gene_list(c) = celegansneurongenes(j,2);
            c = c+1;
        end
    end
    
    count_excitatory = 0;
    count_inhibitory = 0;
    for k = 1:length(gene_list)
        for l = 1:length(excitatory)
            if strcmpi(gene_list(k), excitatory(l)) == 1
                count_excitatory = count_excitatory + 1;
            end
        end
    end
    clear k
    clear l
    for k = 1:length(gene_list)
        for l = 1:length(inhibitory)
            if strcmpi(gene_list(k), inhibitory(l)) == 1;
                count_inhibitory = count_inhibitory + 1;
            end
        end
    end
    
    net_potential = count_excitatory/count_inhibitory;
    p = {'positive'};
    n = {'negative'};
    if net_potential >= 1
        graph(i,1) = Neuron1(i);
        graph(i,2) = Neuron2(i);
        graph(i,3) = p;
    else
        %  net_potential < 1
        graph(i,1) = Neuron1(i);
        graph(i,2) = Neuron2(i);
        graph(i,3) = n;
    end
    
end
end