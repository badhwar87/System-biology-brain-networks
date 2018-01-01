function m=max_match(adj)
% MAXIMUM_MATCHING Compute a maximal matching
%
% A maximum matching is a subset of edges where each vertex is incident on
% only one edge and the size of the matching cannot be increased by adding
% an edge left in the graph.
%
% This code uses Dulmage-Mendelsohn decomposition to find maximum matching row permutation.
%
% m will return the node indicies which are unmatched and are called as driver nodes.
%
%[1] Pothen, Alex and Chin-Ju Fan "Computing the Block Triangular Form of a Sparse Matrix" ACM Transactions on Mathematical Software Vol 16, No. 4 Dec. 1990, pp. 303-324
%[2] Rahul Badhwar, and Ganesh Bagler. "Control of Neuronal Network in Caenorhabditis elegans." PloS one 10, no. 9 (2015): e0139204
%[3] Rahul Badhwar, Ganesh Bagler, "A distance constrained synaptic plasticity model of C. elegans neuronal network", Physica A: Statistical Mechanics and its Applications, 469 (2017): 313-322

mm = dmperm(adj);
m = find(mm==0);

end