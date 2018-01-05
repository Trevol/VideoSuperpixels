% BSD 2-Clause License
% 
% Copyright (c) 2018, Zhihua Ban
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
% 
% * Redistributions of source code must retain the above copyright notice, this
%   list of conditions and the following disclaimer.
% 
% * Redistributions in binary form must reproduce the above copyright notice,
%   this list of conditions and the following disclaimer in the documentation
%   and/or other materials provided with the distribution.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
% FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
% SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
% OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

clear
clc
close all


addpath('src')

sequence_root = 'sequence/test';


[frame_list, frame_ext, stem_list] = get_frame_list(sequence_root);

v_s = 20;

figure('units','normalized','outerposition',[0 0 1 1])
for i = 2:numel(frame_list)
  frame_name_1 = fullfile(sequence_root, frame_list{i-1});
  frame_name_2 = fullfile(sequence_root, frame_list{i});
  image_1 = imread(frame_name_1);
  image_2 = imread(frame_name_2);
  labels = mex_vsp(image_1, image_2, v_s);
  labels{1} = labels{1} + 1;
  labels{2} = labels{2} + 1;
  [painted_images, colors] = paint_colors(labels);
    
  subplot(2,2,1); imshow(image_1); title(['Frame ', num2str(i-1)]);
  subplot(2,2,2); imshow(image_2); title(['Frame ', num2str(i)]);
  
  subplot(2,2,3); imshow(painted_images{1});
  subplot(2,2,4); imshow(painted_images{2});
  
  pause(0);
end
