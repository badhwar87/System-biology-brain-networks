function el = el_create(graph,list)
el = zeros(length(graph),2);
%for i = 1:length(graph)
for j = 1: length(list)
    idx1 = find(strcmpi(list(j), graph(:,1)));
    %for k = 1:length(idx1)
    el(idx1,1) = j;
    %end
    idx2 = find(strcmpi(list(j), graph(:,2)));
    %for k = 1:length(idx2)
    el(idx2,2) = j;
    %end
end
%end
end