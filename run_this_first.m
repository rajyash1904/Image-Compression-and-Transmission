%% Huffman Encoding

tic

%Clear all variables 
clear;

%% Load image
image = imread('image1.jpg');
data = double(image);
dim=size(data);

%length of 1-Darray;
m = dim(1)*dim(2)*dim(3);
%reshape image into 1-D array
data = reshape(data,1,m);

%freq->frequency of each symbol(1-256)
%p->probability of each symbol
%symbol->array of symbols which are present(omit the symbols which are not present)
[freq,p,symbol] = prob(data);


%% Huffman Encoding for the symbols present
%dict->dictionary which keeps record of symbols and corresponding encoded bits
%avglen->average length of bits = sigma(frequency*probability)
%For image transmission without Huffman Encoding, Average Length = 8bits
%[dict,avglen]=huffmandict(symbol,p);

%Our Algorithm
[dict,avglen]=huffman_encoding(symbol,p);

%Add '1' to adjuct indices according to Matlab default
data = data+1;
%Map existing symbols to dictionary index/key
map = zeros(256,1);
%Length Matrix
len = zeros(length(symbol),1);
for i=1:length(symbol)
    map(symbol(i)) = i;
    len(i) = length(dict{i,2});
end

%Extract only bits corresponding to each symbol in image
t = dict(map(data(:)),2);
%Concatenate all bits in row first order (Order R,G,B,...R,G,B,....)
transmitted_bits = [t{:}];

%% Plot Original Image before Transmission
imshow(image);
title('Image before Transmission');

fprintf('\n\tVarience : %d',max(len)-min(len));
fprintf('\n\tAveragelength :%d \n',avglen);

%% Clear all other variables except   
%   1.)dictionary->bits correspondin to symbol
%   2.)Bits/Information
%   3.)Dimension of image to extract from transmitted bits
%   4.)Average length of bits, probability(For the sake of calculating entropy, efficiency)
%      ->Need not be transmitted through channel
clearvars -except dict transmitted_bits dim avglen p t
%clear map;

%Channel transmission -> Only 1,2,3 are transmitted through channel
%run 'run_this_second.m' to extract lossless image from tranmitted bits
%check

% for i=1:length(p)
%     sprintf('%d',dict{i,2})
% end

fprintf('Tima Elapsed :')
disp(toc);




