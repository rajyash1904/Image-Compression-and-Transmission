function [dictionary,avglen] = huffman_encoding(symbol,p)

m = length(symbol);
dictionary = [];
cache = [];
for i=1:m
    dictionary = [dictionary;[{symbol(i)},{[]}]];
    cache = [cache;[{[symbol(i)]}]];
end


%map = containers.Map(p,linspace(1,m,m));
map = [p linspace(1,m,m)'];


index_map = zeros(256,1);
for i=1:length(symbol)
    index_map(symbol(i)) = i;
end

count = 0;
while(length(map))>1
    %disp(length(map));
    %fprintf('\n');
    count = count+1;
    map = sortrows(map);
    dict_one = cache{map(1,2)};
    dict_two = cache{map(2,2)};
    for i=1:length(cache{map(1,2)})
        %dictionary{index_map(dict_one(i)),2} = [dictionary{index_map(dict_one(i)),2} 1];
        dictionary{index_map(dict_one(i)),2} = [1 dictionary{index_map(dict_one(i)),2}];
    end
    for i=1:length(cache{map(2,2)})
        %dictionary{index_map(dict_two(i)),2} = [dictionary{index_map(dict_two(i)),2} 0];
        dictionary{index_map(dict_two(i)),2} = [0 dictionary{index_map(dict_two(i)),2}];
    end
    cache{map(2,2)} = [cache{map(2,2)} cache{map(1,2)}];
    map = [map;[map(1,1)+map(2,1) map(2,2)]];
    map = map(3:length(map),:);
    %break;
    if(length(map)==2)
        map = sortrows(map);
        dict_one = cache{map(1,2)};
        dict_two = cache{map(2,2)};
        for i=1:length(cache{map(1,2)})
            %dictionary{index_map(dict_one(i)),2} = [dictionary{index_map(dict_one(i)),2} 1];
            dictionary{index_map(dict_one(i)),2} = [1 dictionary{index_map(dict_one(i)),2}];
        end
        for i=1:length(cache{map(2,2)})
            %dictionary{index_map(dict_two(i)),2} = [dictionary{index_map(dict_two(i)),2} 0];
            dictionary{index_map(dict_two(i)),2} = [0 dictionary{index_map(dict_two(i)),2}];
        end
        cache{map(2,2)} = [cache{map(2,2)} cache{map(1,2)}];
        map = [map;[map(1,1)+map(2,1) map(2,2)]];
        map = map(3:length(map),:);
        break;
    end
end

len = zeros(length(symbol),1);
for i=1:length(symbol)
    len(i) = length(dictionary{i,2});
end
avglen = sum(p.*len);

end




