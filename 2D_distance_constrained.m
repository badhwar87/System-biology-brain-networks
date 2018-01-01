load celegans277
parfor itr = 1:100
    ffm = zeros(1,4000);
    fbm = zeros(1,4000);
    nd = zeros(1,4000);
    cc = zeros(1,4000);
    cp = zeros(1,4000);
    mtx = celegans277matrix;
    %for i = 1:30000
    cd \Users\Rahul\desktop\dd
    mtx = randmio_dir(mtx, 30000);
    %end
    cd \Users\Rahul\desktop\watts_ffls
    dist_mtx = dist(celegans277positions');
    k = 0;
    for i = 1:277
        for j = 1:277
            if mtx(i,j) == 1
                node_dist = dist_mtx(i,:);
                prob_func = (1./(node_dist.^2.8));
                prob_func(i) = 0;
                
                index =  RouletteWheelSelection(prob_func);
                
                while mtx(i, index) == 1
                    index =  RouletteWheelSelection(prob_func);
                end
                
                mtx(i, index) = 1;
                mtx(i,j) = 0;
                k = k+1;
                ffm(k) = ffmotif(mtx);
                fbm(k) = fbmotif(mtx);
                cc(k) = mean(clustering_coef_bd(mtx));
                distance = distance_bin(mtx);
                cp(k) = mean(charpath(distance));
                mm = dmperm(mtx);
                nd(k) = length(find(mm == 0));
            end
        end
    end
    feed_forward_motif(itr,:) = ffm;
    feed_back_motif(itr,:) = fbm;
    clust_coeff(itr,:) = cc;
    char_path(itr,:) = cp;
    driver_neurons(itr,:)= nd;
    cd \Users\Rahul\desktop\celegans\BCT
    [id(itr,:), od(itr,:), deg(itr,:)] = degrees_dir(mtx);
end
