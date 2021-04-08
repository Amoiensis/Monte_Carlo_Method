clear;clc;close all;
%% Poker
% there is no king in th pokers
% Suit:1-spades ,2-hearts ,3-clubs ,4-diamonds
Base_Suit = [1,2,3,4];
% A-1/2...10-2...10/J-11/Q-12/K-13
Base_Num = 1:13;
Suit = repmat(Base_Suit,1,13);
Num = repelem(Base_Num,4);
Card = [Suit;Num];
Card_Total_Num = 52;
% Every Pack Setting 每手牌的设置
pcak_card_num = 5;  % 斗牛一次发牌5张
pack_time = floor(Card_Total_Num/pcak_card_num); % 一副牌可以摸的次数
times = 1; % 记录抽样次数

% Shuffle
shuffle_time = 100000;  % 洗牌次数
for i = 1:shuffle_time
    CardOrder = randperm(Card_Total_Num);
    temp = 1:pcak_card_num; % 用于每次抽5张牌
    for j = 1:pack_time
        Results(times) = check_count(Card(:,CardOrder(temp)));
        times = times + 1;
        temp = temp+5;
    end
end
Counts = cat(1,Results.count);
%% Results
% Counts-histogram
[counts,centers] = hist(Counts,11);
figure();
bar(centers, counts / sum(counts));
title("Counts-Plot");
% Banker exsit
% 假设专家不变-且一直从一个地方开始-轮流摸牌
% 即，间隔得取结果，认为是庄家摸牌
Player_num = 4; % includes banker
Play_time = floor(shuffle_time*pack_time/Player_num);   % 进行的游戏的轮数
% Wager = ones(1,Player_num);  %庄家无需赌注，设置为0；
Wager = [1,1,1,1];  %庄家无需赌注，设置为0；
Wager(1)=0;
Earning = zeros(1,Player_num);
% 规则：牛7以上2倍，满牛（牛10），3倍（暂时未考虑，全花5倍），
ratio_record = zeros((Player_num-1)*Play_time,1);
k = 1;

for i = 1:Play_time
    for j = 2:Player_num
        banker_order = (i-1)*Player_num+1;
        player_order = (i-1)*Player_num+j;
        temp_ratio = compare_count(Results(banker_order),Results(player_order));
        Earning(1) = Earning(1) + temp_ratio*Wager(j);
        Earning(j) = Earning(j) - temp_ratio*Wager(j);
        ratio_record(k) = temp_ratio;
        k = k+1;
    end
end
%% Plot 
% Earning
figure();
bar(1:Player_num,Earning);
title("Earning-Plot");
% ratio_record
figure();
histogram(ratio_record)
title("Ratio-Plot");