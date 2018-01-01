% This function increase the number of feed forward motif by changing one edge randomly.
function [mtx,idx_inc1,idx_inc2] = ffl_increase(mtx)
sze = length(mtx);
a = floor(sze*rand +1);
conn1 = find(mtx(a,:)==1);
while isempty(conn1)
    a = floor(sze*rand +1);
    conn1 = find(mtx(a,:)==1);
end
pos = floor(rand*length(conn1)+1);
conn2 = find(mtx(conn1(pos),:)==1);
while isempty(conn2)
%     conn1 = find(mtx(a,:)==1);
%     while isempty(conn1)
        a = floor(sze*rand +1);
        conn1 = find(mtx(a,:)==1);
    %end
    pos = floor(rand*length(conn1)+1);
    conn2 = find(mtx(conn1(pos),:)==1);
end

for i = 1:length(conn1)
    for j = 1:length(conn2)
        
        if mtx(conn1(i),conn2(j)) ~= 1
            mtx(conn1(i),conn2(j)) = 1;
            idx_inc1 = conn1(i);
            idx_inc2 = conn2(j);
            return
        end
    end
    %     a = floor(sze*rand +1);
    %     conn1 = find(mtx(a,:)==1);
    %     while isempty(conn1)
    %         a = floor(sze*rand +1);
    %         conn1 = find(mtx(a,:)==1);
    %     end
    %     pos = floor(rand*length(conn1)+1);
    %     conn2 = find(mtx(conn1(pos),:)==1);
    % end
    % pos1 = floor(rand*length(conn2)+1);
    % mtx(a,conn2(pos1)) = 1;
    % idx1 = a;
    % idx2 = conn2(pos1);
end

[mtx,idx_inc1,idx_inc2] = ffl_increase(mtx);

end