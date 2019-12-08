%1
str1 = 'Тимофеев Сергей 570 100 203';
disp(['Строка:',str1])
disp('Задание 1. Количество символов в строке кроме пробелов')
k = sum(str1 ~= ' ');
srt1 = num2str(k);
disp(['Результат: ', srt1])
%2
disp('Задание 2. Переставить первое и последнее слово.')
for i = 1:length(str1)
    if str1(i) == ' '
        nul1 = i;
        break
    end
end
for i = 1:length(str1)
    if str1(i) == ' '
        nul2 = i;
    end
end
str2 = [str1(nul2+1:end) str1(nul1:nul2) str1(1:nul1-1)];
disp(['Результат: ', str2])
%3
disp('Задание 3. Заменить числа в строке числительными.')
str3 = str1;
for i = 1:length(str1)
    switch str1(i)
        case '0'
            str3 = strrep(str3, '0','ноль');
        case '1'
            str3 = strrep(str3, '1','один');
        case '2'
            str3 = strrep(str3, '2','два');
        case '3'
            str3 = strrep(str3, '3','три');
        case '4'
            str3 = strrep(str3, '4','четыре');
        case '5'
            str3 = strrep(str3, '5','пять');
        case '6'
            str3 = strrep(str3, '6','шесть');
        case '7'
            str3 = strrep(str3, '7','семь');
        case '8'
            str3 = strrep(str3, '8','восемь');
        case '9'
            str3 = strrep(str3, '9','девять');
    end
end
disp(str3);
%4
massiv = [];
index = strfind(str1,' ');
index_add = [0 index length(str1)+1];
for i = 1:length(index_add)-1
    w = str1(index_add(i)+1:index_add(i+1)-1);
    perevod = str2double(w);
    if isnumeric(perevod) == 1
        if ~isnan(perevod)
            massiv = [massiv  perevod];
        end
    end
end
disp('Задание 4. Вывести числовой массив:');
disp(massiv);
%5
%f = fopen('in10.txt','wt');
%fprintf(f,'Тимофеев Сергей 570 100 203\n');
%fprintf(f,'1 2 3 4 100\n');
%fprintf(f,'6 7 8 9 0.1 0.2 0.3 0.4 200\n');
%fprintf(f,'0.5 0.6 0.7 0.8 57');
%fclose(f);
%6
%f = fopen('in10.txt','wt+');
%a = fscanf(f,'%s',2);
%fclose(f);
%7
File1NameExp='v01';
PictHigh1='200';
DirName1=['D:/' File1NameExp];
if ~exist(DirName1, 'dir')
    mkdir(DirName1);
end
cd(DirName1);
FileHtml=fopen(['00' File1NameExp ' отчет.htm'],'wt');
fprintf(FileHtml,['<HTML>\n']);
fprintf(FileHtml,['<head>\n']);
fprintf(FileHtml,['<title>Отчет по лабораторной работе \n']);
fprintf(FileHtml,['</title>\n']);
fprintf(FileHtml,['<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows">\n']);
fprintf(FileHtml,['</head>\n']);
fprintf(FileHtml,['<body>\n']);
fprintf(FileHtml,['<center><H3>ОТЧЕТ<br>по лабораторной работе</h3></center>\n']);
fprintf(FileHtml,['1. ' srt1 '</br>']);
fprintf(FileHtml,['2. ' str2 '</br>']);
fprintf(FileHtml,['3. ' str3 '</br>']);
fprintf(FileHtml,['4. ' massiv '</br>']);
h1=figure('Name','Модельное изображение (исходное Image0) im3d');
hold on
x = (1:0.01:5);
for beta=-5:0.1:5
    y = sin(10*x);
    plot(x,y);
end
hold off
FileName000=[File1NameExp '_1.jpg'];
saveas(h1,FileName000);
fprintf(FileHtml,['<br><br> Графики \n']);
fprintf(FileHtml,['<a href="' FileName000 '">']);
fprintf(FileHtml,['<br><img src="'...
    FileName000 '" height="' PictHigh1 '" >' '\n']);
%fprintf(FileHtml,['<a href="' FileName000 '">']);
fprintf(FileHtml,['</a>\n']);
fprintf(FileHtml,['</body>\n']);
fprintf(FileHtml,['</HTML>\n']);
fclose(FileHtml);
close all
