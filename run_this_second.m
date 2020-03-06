%% Huffman Decoding

%After transmission we decode the bits into symbols based in dictionary
% and shape the image based on order of traversal

%Information is generally transmitted through Noise channel so we calculate Entropy and Efficiency
%to tell how good this Huffman Lossless image compression and transmission is

%% Extract symbols from transmitted bits
decoded_data=huffmandeco(transmitted_bits,dict);

%Reshape extracted data into image 
extracted_image = reshape(decoded_data,dim(1),dim(2),dim(3));
%Extracted image after transmission
figure, imshow(uint8(extracted_image));
title('Image after Transmission');

%% Calculate Entropy and Efficiency
H=0;
n=length(p);
for k=1:n
    H=H+(p(k)*log2(1/p(k)));
        
 end
fprintf('\n\tEntropy is\t\t:%f bits',H);
N=H/avglen;
fprintf('\n\tEfficiency is\t:%f\n',N);




