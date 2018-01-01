q1 = (0:10^-4:10^-3);
q2 = (10^-3:10^-3:10^-2);
q3 = (10^-2:10^-2:10^-1);
q4 = (0.1:0.1:1);
q = [q1, q2, q3, q4];
% q = (0.1:0.001:0.3);
n = 277;
k = 8;

load data
mtx = regular_ffm_graph(n,k);
%el = regular_dist(celegans277positions);
% for i = 1:2216
%     el(i,3) = 1;
% end
% mtx = edgeL2adj(el);
%[Neuron1, Neuron2] = neuron_create(el, celegans277labels);
%creation of signed graph
%graph = graph_construct(Neuron1, Neuron2, celegansneurongenes, excitatory, inhibitory);

%[c_positive, c_negative]= cycles_count_positive_negative(graph, el);
%bi_orig = balance_index(c_negative);
%[count_ffm_ext, count_ffm_inh] = ffe_ffi(mtx, celegans277labels, graph);
%[norm_ext_orig, norm_inh_orig] = stats(count_ffm_ext, count_ffm_inh);
ffm_orig = ffmotif(mtx);
fbm_orig = fbmotif(mtx);
cc_orig = mean(clustering_coef_bd(mtx));
Dist = distance_bin(mtx);
cp_orig = charpath(Dist);
nD_orig = (length(find(dmperm(mtx) == 0))/n);
ffm = zeros(100,1);
avg_clust_coff = zeros(100,1);
char_path = zeros(100,1);
n_D = zeros(100,1);
bi = zeros(100,1);
norm_ext = zeros(100,1);
norm_inh = zeros(100,1);

for session = 1:length(q)
    p = q(session);
    parfor itr = 1:1000
%         el = regular_dist(celegans277positions);
%         for i = 1:2216
%             el(i,3) = 1;
%         end
%         mtx = edgeL2adj(el);
        mtx = regular_ffm_graph(n,k);
        mtx = watts_rewire(mtx, p);
        ffm(itr) = ffmotif(mtx);
        fbm(itr) = fbmotif(mtx);
        avg_clust_coff(itr) = mean(clustering_coef_bd(mtx));
        Dist = distance_bin(mtx);
        char_path(itr) = charpath(Dist);
        n_D(itr) = (length(find(dmperm(mtx) == 0))/n);
%         el = adj2edgeL(mtx);
%         [Neuron1, Neuron2] = neuron_create(el, celegans277labels);
%         graph = graph_construct(Neuron1, Neuron2, celegansneurongenes, excitatory, inhibitory);
%         [c_positive, c_negative]= cycles_count_positive_negative(graph, el);
%         bi(itr) = balance_index(c_negative);
%         [count_ffm_ext, count_ffm_inh] = ffe_ffi(mtx, celegans277labels, graph);
%         [norm_ext(itr), norm_inh(itr)] = stats(count_ffm_ext, count_ffm_inh);
    end
    
    
    %     avg_bi(session) = mean(bi);
    %     avg_norm_ext(session) = mean(norm_ext);
    %     avg_norm_inh(session) = mean(norm_inh);
        avg_ffm(session) = mean(ffm);
        avg_cc(session) = mean(avg_clust_coff);
        avg_cp(session) = mean(char_path);
        avg_nD(session) = mean(n_D);
        std_ffm(session) = std(ffm);
        std_cc(session) = std(avg_clust_coff);
        std_cp(session) = std(char_path);
        std_nD(session) = std(n_D);
    %     std_bi(session) = std(bi);
    %     std_norm_ext(session) = std(norm_ext);
    %     std_norm_inh(session) = std(norm_inh);
    
    %avg_bi(session) = mean(bi/bi_orig);
    %avg_norm_ext(session) = mean(norm_ext);
    %avg_norm_inh(session) = mean(norm_inh);
%     avg_ffm(session) = mean(ffm/ffm_orig);
%     avg_fbm(session) = mean(fbm/fbm_orig);
%     avg_cc(session) = mean(avg_clust_coff/cc_orig);
%     avg_cp(session) = mean(char_path/cp_orig);
%     avg_nD(session) = mean(n_D/nD_orig);
%     std_ffm(session) = std(ffm/ffm_orig);
%     std_fbm(session) = std(fbm/fbm_orig);
%     std_cc(session) = std(avg_clust_coff/cc_orig);
%     std_cp(session) = std(char_path/cp_orig);
%     std_nD(session) = std(n_D/nD_orig);
    %std_bi(session) = std(bi/bi_orig);
    %std_norm_ext(session) = std(norm_ext);
    %std_norm_inh(session) = std(norm_inh);
    
end

figure
errorbar(q, avg_cc, std_cc, '-');
%set(get(h,'Parent'), 'XScale', 'log')
figure
errorbar(q, avg_cp, std_cp, '-');
%set(get(h,'Parent'), 'XScale', 'log')
figure
errorbar(q,avg_ffm, std_ffm, '-');
%set(get(h,'Parent'), 'XScale', 'log')
% hold on
% h = errorbar(q,avg_fbm,std_fbm);
% set(get(h,'Parent'), 'XScale', 'log')
