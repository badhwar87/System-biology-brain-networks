function [c_positive, c_negative]= cycles_count_positive_negative(graph, el)

cycles = grCycleBasis(el);

sz = size(cycles);
c_positive = zeros(sz(1,2),1);
c_negative = zeros(sz(1,2),1);
for i = 1:sz(1,2)
    idx = find(cycles(:,i) == 1);
    if isempty(idx) == 0
        for j = 1:length(idx)
            if strcmpi(graph(idx(j),3),'positive') == 1
                c_positive(i) = c_positive(i) + 1;
            elseif strcmpi(graph(idx(j),3),'negative') == 1
                c_negative(i) = c_negative(i) + 1;
            end
        end
    end
end
end