function list = list_create(graph)
list(1) = graph(1);
l = 1;
for i = 2:length(graph)
    temp = graph(i);
    if sum(strcmpi(list,temp))== 0
        l = l+1;
        list(l) = temp;
    end
end
for i = 2:length(graph)
    temp = graph(i,2);
    if sum(strcmpi(list,temp))== 0
        l = l+1;
        list(l) = temp;
    end
end
end