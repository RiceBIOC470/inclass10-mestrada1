%In this directory, you will find some example data, which is a 300x8
%array stored in a .mat file. Image these are measurements for 300 genes are 8 different time
%points
%GB comments
1)100
2)100
3)100
4)100
overall: 100


%1. Use matlab to perform pca on this data, getting the transformation
%matrix, the transformed data, and the eigenvalues.

load('example_dat.mat');
[coeff, sc, eig] = pca(dat);

%2. Look at the eigenvalues - how many dimensions are necessary to explain
%the data? 

eig

eig =

    5.6314
    0.1830
    0.0958
    0.0860
    0.0823
    0.0805
    0.0732
    0.0681
    
% Only one dimension is necessary since there is only one high eigenvalue

%3. Using kmeans clustering to cluster the data into 3 clusters. 
% Make a plot of the first coordinate of the raw data vs the second color coded
% by which cluster it is in. Make the same plot but use the first two
% principle components instead. 

ids = kmeans(dat,3);
x = [0.25 0.5 1 2 3 5 7 8];
for ii = 1:3
    inds = ids == ii;
    subplot(1,3,ii);
    plot(x,mean(dat(inds, :),1),'.-','LineWidth',3,'MarkerSize',18);
    title(['Cluster ' int2str(ii), ' ngenes: ', int2str(sum(inds))]);
end

figure;
for ii = 1:length(ids)
    if ids(ii) == 1
        plot(dat(ii,1) , dat(ii,2), 'r.');
        hold on;
    elseif ids(ii) == 2
        plot(dat(ii,1), dat(ii,2), 'g.');
        hold on;
    elseif ids(ii) == 3
        plot(dat(ii,1), dat(ii,2), 'b.');
        hold on;
    end
end
xlabel('Coordinate 1', 'fontSize', 30);
ylabel('Coordinate 2', 'FontSize', 30);

figure; 
for ii = 1:length(ids)
    if ids(ii) == 1
        plot(sc(ii,1), sc(ii,2), 'r.');
        hold on;
    elseif ids(ii) == 2
        plot(sc(ii,1), sc(ii,2), 'g.');
        hold on;
    elseif ids(ii) == 3
        plot(sc(ii,1), sc(ii,2), 'b.');
        hold on;
    end
end
xlabel('Coordinate 1', 'FontSize', 30);
ylabel('Coordinate 2', 'FontSize', 30);

%4. Repeat part 3 but use 7 clusters. Which is a more appropriate number of
%clusters for the data?

ids_2 = kmeans(dat,7);
x = [0.25 0.5 1 2 3 5 7 8];
for ii = 1:7
    inds = ids_2 == ii;
    subplot(3,4,ii);
    plot(x,mean(dat(inds, :),1),'.-','LineWidth',3,'MarkerSize',18);
    title(['Cluster ' int2str(ii), ' ngenes: ', int2str(sum(inds))]);
end

figure;
for ii = 1:length(ids_2)
    if ids_2(ii) == 1
        plot(dat(ii,1) , dat(ii,2), 'r.');
        hold on;
    elseif ids_2(ii) == 2
        plot(dat(ii,1), dat(ii,2), 'g.');
        hold on;
    elseif ids_2(ii) == 3
        plot(dat(ii,1), dat(ii,2), 'b.');
        hold on;
    elseif ids_2(ii) == 4
        plot(dat(ii,1), dat(ii,2), 'c.');
        hold on;
    elseif ids_2(ii) == 5
        plot(dat(ii,1), dat(ii,2), 'm.');
        hold on;
    elseif ids_2(ii) == 6
        plot(dat(ii,1), dat(ii,2), 'k.');
        hold on;
    elseif ids_2(ii) == 7
        plot(dat(ii,1), dat(ii,2), 'y.');
        hold on;
    end
end
xlabel('Coordinate 1', 'fontSize', 30);
ylabel('Coordinate 2', 'FontSize', 30);

figure;
for ii = 1:length(ids_2)
    if ids_2(ii) == 1
        plot(sc(ii,1) , sc(ii,2), 'r.');
        hold on;
    elseif ids_2(ii) == 2
        plot(sc(ii,1), sc(ii,2), 'g.');
        hold on;
    elseif ids_2(ii) == 3
        plot(sc(ii,1), sc(ii,2), 'b.');
        hold on;
    elseif ids_2(ii) == 4
        plot(sc(ii,1), sc(ii,2), 'c.');
        hold on;
    elseif ids_2(ii) == 5
        plot(sc(ii,1), sc(ii,2), 'm.');
        hold on;
    elseif ids_2(ii) == 6
        plot(sc(ii,1), sc(ii,2), 'k.');
        hold on;
    elseif ids_2(ii) == 7
        plot(sc(ii,1), sc(ii,2), 'y.');
        hold on;
    end
end
xlabel('Coordinate 1', 'FontSize', 30);
ylabel('Coordinate 2', 'FontSize', 30);

% It is more appropriate to use 3 clusters; with the parameter set to 7
% clusters, there are several gene clusters that look very similar to each
% other; it is thus sufficient to use 3 clusters. 
