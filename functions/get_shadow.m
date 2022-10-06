function shadow = get_shadow(data)
img = data(:,:,[59 40 23]);

hsi = rgb2hsi(img);
% figure;imshow(hsi);
re_img = (hsi(:,:,1) + 1) ./ (hsi(:,:,3) + 1);
re_img=mat2gray(re_img);
% figure;imshow(re_img,[]);

level = graythresh(re_img) + 0.09; % ��ɫ���ˣ�Ҫ���
re_img(re_img>=level) = 1;
re_img(re_img<level) = 0;
re_img = 1 - re_img; % ��Ӱͼ��

%% ������������ص�
re_img = 1 - re_img;
re_img = bwmorph(re_img,'spur',1);%ȥë��
re_img = bwmorph(re_img,'hbreak',1);%����ͨ

re_img = bwareaopen(re_img,4000); % ȥ��С�������
re_img = 1- re_img;

re_img = bwareaopen(re_img,40000); % ���
re_img = double(re_img);
shadow = re_img;