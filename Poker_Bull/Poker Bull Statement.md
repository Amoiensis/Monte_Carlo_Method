#### Poker Bull Statement（斗牛仿真）

Xiping.Yu	2021.04.08

##### Poker Bull introduce（斗牛介绍）

###### Game Rules(游戏规则)

​		在纸牌斗牛规则里：大小王除外，52张牌，K最大，A最小，J，Q，K都是10点，然后点数依次排列最后A是1点。牌局开始每个人抓五张牌，玩家需要将手中三张牌10点的倍数，称为“牛”。其余的两张牌加起来算点数，去掉十位只留个位数来进行比较，如果剩下两张正好是10点，根据纸牌斗牛规则，这副牌就是“斗牛”。
​		按照纸牌斗牛规则，除“斗牛”外，还有，五小，5张牌牌点总数小于或者等于10。炸弹：四张牌点一样的牌。金牛：五张十以上的花牌组成的“斗牛”。银牛：十和十以上的花牌组成的“斗牛”。
​		在纸牌斗牛规则中，先比牌型，后比大小，顺序如下：炸弹五小金牛银牛斗牛牛九牛八牛七牛六牛五牛四牛三牛二牛一牛破，然后数字比较：大王>小王、K、Q、J、0、9、8、7、6、5、4、3、2、1，再然后是花式比较：黑桃红桃草花方块。（通常大小王会被拿出）
​		斗牛四个人玩，一方为庄家，另三方为闲家，按照纸牌斗牛规则先是闲家向桌面掷筹码，掷完筹码后开始发牌，最后比较大小，闲家的牌大于庄家则算胜利。

[摘自，百度百科]

###### Reference（参考资料）

Baidu:[扑克牌斗牛_百度百科 (baidu.com)](https://baike.baidu.com/item/扑克牌斗牛/9971745)

Wiki:  [扑克牌斗牛_百度百科 (baidu.com)](https://baike.baidu.com/item/扑克牌斗牛/9971745)

##### Rules Setting（仿真设置）

###### Return Rules (回报规则)

牛1~牛6，1倍赌注；

牛7~牛6，2倍赌注；

牛10（满牛），3倍赌注；

###### Deal Rules (发/洗牌规则)

1. 参与人数4人，庄家1人，其他玩家3人（牌面与庄家比较）；
2. 设定一直从庄家开始摸牌，且发牌顺序不变；
3. 每将一副洗好的牌使用完毕，则重新洗该副牌（循环使用）；

##### Files Statement（文件说明）

1. check_count.m，计算牌面大小；

   ```matlab
   function [Count] = check_count(Card)
       %check_count 计算斗牛5张牌的点数；Input:Card = [Suit;Number]；Output:Count；
       %   Input:Card = [Suit;Number]；Output:Count；
       % Suit:1-spades ,2-hearts ,3-clubs ,4-diamonds   
   ```

2. compare_count.m，比较两副牌得出回报比率；

   ```matlab
   function [Income_ratio] = compare_count(Result_A,Result_B)
       %compare_count 计算面对Result_B，A的收支比率
       %   正数倍数表示盈余，负数倍数表示亏损；
       %   e.g.-2表示，A亏损2倍赌注，3表示A赢得3倍赌注；
   ```

   

3. simulation_poker.m，仿真整副扑克牌的运作，并统计输出相关结果；

   ```
   % 无牛到满牛的频率分布图；
   ...
   title("Counts-Plot");
   ...
   % 各个玩家收益情况，1-庄家，2~3-其他玩家；
   ...
   title("Earning-Plot");
   ...
   % 对庄家而言，1倍到3倍的收入或者支出的次数；
   ...
   title("Ratio-Plot");
   ...
   ```

##### Attention（注意）

Please feel free to contact with me for any questions, thank you!

Don't spread the files without permission!

所有文件仅仅供学习交流！

未经允许，请勿传播！