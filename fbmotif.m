% This function counts the number of feed back motif in a network.
function count = fbmotif(mtx)
count = 0;
for  i = 1:length(mtx)
    for j = 1:length(mtx)
            if mtx(i,j) == 1
                conn1 = find(mtx(i,:)==1);
                conn2 = find(mtx(j,:)==1);
                conn3 = find(mtx(conn2,:)==1); 
                    for k = 1:length(conn3)
                        if conn3(k) == i
                            count = count+1;
                        end
                    end
            end
     end
end
end
                