% This function decreases the number of feed forward motif by changing one edge randomly.
function [mtx] = ffl_decrease(mtx)
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
    a = floor(sze*rand +1);
    conn1 = find(mtx(a,:)==1);
    while isempty(conn1)
        a = floor(sze*rand +1);
        conn1 = find(mtx(a,:)==1);
    end
    pos = floor(rand*length(conn1)+1);
    conn2 = find(mtx(conn1(pos),:)==1);
end
pos2 = floor(rand*length(conn2) +1);
mtx(a,conn2(pos2)) = 0;
idx1 = a;
idx2 = conn2(pos2);
end