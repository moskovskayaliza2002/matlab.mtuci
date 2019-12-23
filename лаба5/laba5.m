m = zeros(800,800);
image = imnoise(im2uint8(m), 'gaussian');
hist = histogram(image);
saveas(hist, '1', 'jpg');
pic1 = im2double(imread('pic1.png'));
for i = 1:size(pic1, 1)
    for j = 1:size(pic1, 2)
        if (pic1(i,j) < 1)
            image(i+310, j+310) = pic1(i,j);
        end
    end
end
imwrite(image, '2.png');
image = imnoise(im2uint8(m), 'gaussian');
pic2 = imresize(pic1, 2);
for i = 1:size(pic2, 1)
    for j = 1:size(pic2, 2)
        if (pic2(i,j) < 1)
            image(i+230, j+230) = pic2(i,j);
        end
    end
end
imwrite(image, '3.png');
image = imnoise(im2uint8(m), 'gaussian');
pic3 = imresize(pic1, 0.5);
for i = 1:size(pic3, 1)
    for j = 1:size(pic3, 2)
        if (pic3(i,j) < 1)
            image(i+355, j+355) = pic3(i,j);
        end
    end
end
imwrite(image, '4.png');
image = imnoise(im2uint8(m), 'gaussian');
pic4 = im2double(imread('pic2.png'));
for i = 1:size(pic4, 1)
    for j = 1:size(pic4, 2)
        if (pic4(i,j) < 1)
            image(i+15, j+15) = pic4(i,j);
        end
    end
end
pic5 = im2double(imread('pic3.png'));
for i = 1:size(pic5, 1)
    for j = 1:size(pic5, 2)
        if (pic5(i,j) < 1)
            image(i+590, j+780) = pic5(i,j);
        end
    end
end
imwrite(image, '5.png');
imwrite(fliplr(image), '6.png');
imwrite(flip(image), '7.png');
imwrite(imrotate(image, 315), '8.png');
imwrite(imrotate(image, 45), '9.png');
back = imread('back.jpg');
back = imcrop(back, [5 5 799 799]);
back = imadjust(back, [0 1], [0 0.25]);
imwrite(back, '10.png');
copyback = back;
for i = 1:size(pic4, 1)
    for j = 1:size(pic4, 2)
        if (pic4(i,j) < 1)
            back(i+15, j+15) = pic4(i,j);
        end
    end
end
for i = 1:size(pic5, 1)
    for j = 1:size(pic5, 2)
        if (pic5(i,j) < 1)
            back(i+590, j+780) = pic5(i,j);
        end
    end
end
back = imnoise(back, 'gaussian');
imwrite(back, '11.png');
back1 = imadjust(back, [0 1], [1 0]);
imwrite(back1, '12.png');
for i = 1:size(pic1, 1)
    for j = 1:size(pic1, 2)
        if (pic1(i,j) < 1)
            copyback(i+310, j+310) = pic1(i,j);
        end
    end
end
copyback = imnoise(copyback, 'gaussian');
imwrite(copyback, '13.png');
imwrite(back-copyback, '14.png');