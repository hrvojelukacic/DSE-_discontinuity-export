% load the input file in  txt format
% txt file shloud be TTTTT js-c-abcd.txt

data = load('Test js-c-abcd.txt') 

%sorting data in seperate matrix containing only components of normal vector 

n = [data(:,4),data(:,5), data(:,6)]

%calculating dip of the plane (in regards to horizontal plane)- 2 ways

dip = rad2deg(acos(abs(n(:,3)))) % calculation via nz component 

%plunge = rad2deg(asin(abs(n(:,3))))
%dip2 = 90 - rad2deg(asin(abs(n(:,3)))) % calculation using cosAngle - use only when N is unit vector

% Calculatin dip direction of the plane (in regards to x axis-north
% clockwise)

% for loop which finds the normal vector facing down (nz<0) and turns it on
% the oposite side by multiplying every element by 
for i= 1:length(n)
    
    if n(i,3) <0 
    n(i,1)=-n(i,1);
    n(i,2)=-n(i,2);
    n(i,3)=-n(i,3);
    end
end

% dip direction calculation is done by 4 quardants of the circle and by
% utilizing the property of the normal vector that its components are equal
% to the direction cosines of the same vector

dipdir = zeros(8,1);   
for k = 1:length(n)
    if n(k,1) > 0 & n(k,2) > 0
        dipdir(k) = rad2deg(atan(n(k,1)/n(k,2)));
    elseif n(k,1) > 0 & n(k,2) < 0
        dipdir(k) = 180 + rad2deg(atan(n(k,1)/n(k,2)));
    elseif n(k,1) < 0 & n(k,2) < 0
        dipdir(k) = 180 + rad2deg(atan(n(k,1)/n(k,2)));
    elseif n(k,1) < 0 & n(k,2) > 0
        dipdir(k) = 360 + rad2deg(atan(n(k,1)/n(k,2)));    
    end
end

% put all necessary values into one matrix 

disc_plane = [dipdir, dip] 

% export matrix into csv form

writematrix(disc_plane,'DSE_export.csv','Delimiter','tab')
type 'DSE_export.csv'
