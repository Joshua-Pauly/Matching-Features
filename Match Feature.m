%% Harris
I = imread('L07 greatvalley1.jpg');
J = imread('L07 greatvalley2.jpg');
if size(I,3) > 1 % image has three channels
    I = im2gray(I);
end
if size(J,3) > 1 % image has three channels
    J = im2gray(J);
end
points1H = detectHarrisFeatures(I);
points2H = detectHarrisFeatures(J);
[features1H,valid_points1H] = extractFeatures(I,points1H);
[features2H,valid_points2H] = extractFeatures(J,points2H);
indexPairsH = matchFeatures(features1H,features2H);
matchedPoints1H = valid_points1H(indexPairsH(:,1),:);
matchedPoints2H = valid_points2H(indexPairsH(:,2),:);
%show relevant features
subplot(1,2,1); imshow(I);hold on;plot(matchedPoints1H);
subplot(1,2,2); imshow(J);hold on;plot(matchedPoints2H);
savefig('Harris_points.fig')
% show matched points
figure; ax=axes;
showMatchedFeatures(I,J,matchedPoints1H,matchedPoints2H , "montag",Parent=ax);
legend("Matched Points Original","Matched Points Transformed");
savefig('Harris_match_points.fig')

%% surf
points1 = detectSURFFeatures(I);
points2 = detectSURFFeatures(J);
[features1,valid_points1] = extractFeatures(I,points1);
[features2,valid_points2] = extractFeatures(J,points2);
indexPairs = matchFeatures(features1,features2);
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);
% show relevant features
subplot(1,2,1); imshow(I);hold on;plot(matchedPoints1);
subplot(1,2,2); imshow(J);hold on;plot(matchedPoints2);
savefig('surf_points.fig')
% show matched points
figure; ax=axes;
showMatchedFeatures(I,J,matchedPoints1,matchedPoints2 , "montag",Parent=ax);
legend("Matched Points Original","Matched Points Transformed");
savefig('surf_match_points.fig')

%% ORB features
points1b = detectORBFeatures(I);
points2b = detectORBFeatures(J);
% detectORBFeatures
% detectMSERFeatures
[features1b,valid_points1b] = extractFeatures(I,points1b);
[features2b,valid_points2b] = extractFeatures(J,points2b);
indexPairsb = matchFeatures(features1b,features2b);
matchedPoints1b = valid_points1b(indexPairsb(:,1),:);
matchedPoints2b = valid_points2b(indexPairsb(:,2),:);
% show relevant features
subplot(1,2,1); imshow(I);hold on;plot(matchedPoints1b);
subplot(1,2,2); imshow(J);hold on;plot(matchedPoints2b);
savefig('orb_points.fig')
% show matched points
figure;  ax = axes;
showMatchedFeatures(J,I,matchedPoints2b,matchedPoints1b,"montag",Parent=ax);
legend("Matched Points Original","Matched Points Transformed");
savefig('orb_match_points.fig')
