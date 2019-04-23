function [minDist,indexOfClosest] = indexOfClosestColumn(A,test_weightCols)
    n = size(A,2);
    minDist = Inf;
    for i = 1 : n
        temp = sum((A(:,i)-test_weightCols).^2);
        dist = sqrt(temp);
        if dist < minDist
            minDist = dist;
            indexOfClosest = i;
        end
    end 
end