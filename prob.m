function [freq,probability,symbol] = prob(r)
%Prob function calculate the 
%     frequency-> freq ; 
%     Probability ->probability
%     symbol present in Image between 0-255 
%     Omitting symbols which are not present

%% Extracting the Dimensions of Image
[lenx,leny,lenz]=size(r);

%% For Loop going through every pixel of Image 
%  calculating Frequency of symbols 
freq=zeros(256,1);
for b=1:lenx
    for j=1:leny
        for k=1:lenz
        val=r(b,j,k);
        freq(val+1,1)=freq(val+1,1) +1;
        end
    end
end
%% Here we count Number of symbols not appearing in Image 
count=0;
f=freq';
for k=1:256
    if (f(k)==0)
        count=count+1;
    end
end

%% Generating present symbol File in Ascending order 
n=256-count;
symbol=zeros(n,1);
b=1;
for k=1:256
    if (f(k)==0)
    else
        symbol(b)=k;
        b=b+1;
    end
end
%% Probability calculation of every symbol in Image
probability=zeros(n,1);
for k=1:n
    probability(k)=freq(symbol(k));
end
probability=probability/(lenx*leny*lenz);
end
%%Symbol Vector and Probability vector are of same size.
% frequency vector is of length 256

