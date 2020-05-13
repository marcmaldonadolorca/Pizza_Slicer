directorioroot = './syntheticDataset/test';
directoriotestim = 'syntheticDataset/test/images';
directoriotestseg = 'syntheticDataset/test/segmentation';
fichero = strcat(directorioroot,'/testLabels.txt');
A = dlmread(fichero);
[sizey, sizex] = size(A);
default = imread('syntheticDataset/Default.png');
for y = 1:sizey
    name = int2str(y);
    if y < 10
        name = strcat('0',name);
    end
    if y < 100
        name = strcat('0',name);
    end
    if y < 1000
        name = strcat('0',name);
    end
    for x = 1:sizex
        name2 = strcat(name, '_',int2str(x),'.png');
        
        if x == 8 %piña
            existence = strcat(directoriotestseg, '/', name2);
            finalname = strcat(directorioroot,'/pina/', name, '.png');
            if exist(existence, 'file')
                imwrite(255*repmat(uint8(imread(existence)),[1,1,3]), finalname);
            else
                imwrite(default, finalname);
            end
        end
        
        if x == 1 %pepperoni
            existence = strcat(directoriotestseg, '/', name2);
            finalname = strcat(directorioroot,'/pepperoni/', name, '.png');
            if exist(existence, 'file')
                imwrite(255*repmat(uint8(imread(existence)),[1,1,3]), finalname);
            else
                imwrite(default, finalname);
            end
        end
        
        if x == 10 %onion
            existence = strcat(directoriotestseg, '/', name2);
            finalname = strcat(directorioroot,'/onion/', name, '.png');
            if exist(existence, 'file')
                imwrite(255*repmat(uint8(imread(existence)),[1,1,3]), finalname);
            else
                imwrite(default, finalname);
            end
        end
        
        if x == 4 %aceitunas
            existence = strcat(directoriotestseg, '/', name2);
            finalname = strcat(directorioroot,'/aceitunas/', name, '.png');
            if exist(existence, 'file')
                imwrite(255*repmat(uint8(imread(existence)),[1,1,3]), finalname);
            else
                imwrite(default, finalname);
            end
        end
        
    end
end