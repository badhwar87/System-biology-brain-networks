% This function counts the number of feed forward motif in a network.
function count = ffmotif(mtx)
count = 0;
for  i = 1:length(mtx)
    for j = 1:length(mtx)
        if mtx(i,j) == 1
            conn1 = find(mtx(j,:)==1);
            conn2 = find(mtx(i,:)==1);
            for k = 1:length(conn1)
                for l = 1:length(conn2)
                    if conn1(k) == conn2(l)
                    count = count + 1;
                    end
                end
            end         
        end
    end
end
end