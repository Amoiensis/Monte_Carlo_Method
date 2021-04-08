function [Count] = check_count(Card)
    %check_count 计算斗牛5张牌的点数；Input:Card = [Suit;Number]；Output:Count；
    %   Input:Card = [Suit;Number]；Output:Count；
    % Suit:1-spades ,2-hearts ,3-clubs ,4-diamonds    
    Suit = Card(1,:);
    % A-1/2...10-2...10/J-11/Q-12/K-13
    Number = Card(2,:);
    %% Caculate Count
    % Max
    Max_number = max(Number);
    Max_suit = min(Suit(Number==Max_number));
    % initialize
    Card_length = length(Number);
    mod_num = 10;
    Number(Number>mod_num)=mod_num;
    Count_num = 0;
    % Check
    flag = 0;
    for i=1:Card_length
        for j=(i+1):Card_length
            for k = (j+1):Card_length
                if mod(sum(Number([i,j,k])),10) == 0
                    Count_num = mod(sum(Number),mod_num);
                    if (Count_num == 0)
                        Count_num = 10;
                    end
                    flag = 1; % skip multiple-for
                              % C语言中，可使用goto语句实现；
                    break;
                end
            end
            if flag == 1
                break;
            end
        end
        if flag == 1
            break;
        end
    end
    Count = struct('count',Count_num,'Max_number',Max_number,'Max_suit',Max_suit);
    end
    
    