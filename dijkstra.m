M1 = input('¿Cuál es la matriz de distancias?');
V = size(M1, 1);
M = cell(V,1);
if any(M1(:) < 0)
    error('El Algoritmo de Dijkstra solo aplica cuando las distancias son no negativas')
end
for i = 1:V
    adyacentes = [];
    M1(i,:);
    k = 1;
    for j = 1:V
        if M1(i,j) > 0 && M1(i,j) < inf
            adyacentes = [adyacentes; k M1(i,j)];
        end
        k = k+1;
    end
    M{i} = adyacentes;
end
P = 1;
T = 2:V;
U = inf(1,V);
U(1) = 0;
for i = 2:V
    if ismember(i,M{1}(:,1))
        indice = find(M{1}(:,1) == i,1);
        U(i) = M{1}(indice,2);
    end
end
pred = ones(1,V);
vertices = [];
distancias = [];
while ~isempty(T)
    [~,indice_k] = min(U(T));
    k = T(indice_k);
    P = [P k];
    T(indice_k) = [];
    for j = T
        if ismember(j,M{k}(:,1))
            indice = find(M{k}(:,1) == j,1);
            Dkj =  M{k}(indice,2);
            UkDkj = U(k) + Dkj;
            if UkDkj <= U(j)
                pred(j) = k;
                U(j) = UkDkj;
            end
        end
    end
    vertices = [vertices; pred(k), k];
    distancias = [distancias; M1(pred(k), k)];
end
fprintf('Distancias U: %s\n', mat2str(U));
G = digraph(vertices(:,1), vertices(:,2), distancias);
figure;
plot(G, 'EdgeLabel', G.Edges.Weight, 'Layout', 'layered');
title('Árbol de caminos mínimos desde el vértice 1.');