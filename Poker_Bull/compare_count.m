function [Income_ratio] = compare_count(Result_A,Result_B)
    %compare_count 计算面对Result_B，A的收支比率
    %   正数倍数表示盈余，负数倍数表示亏损；
    %   e.g.-2表示，A亏损2倍赌注，3表示A赢得3倍赌注；
    Income_ratio = 0;
    % 规则：牛7以上2倍，满牛（牛10），3倍（暂时未考虑，全花5倍），
    if Result_A.count > Result_B.count 
        switch Result_A.count
            case {7,8,9}
                Income_ratio = 2;
            case {10}
                Income_ratio = 3;
            otherwise
                Income_ratio = 1;
        end
    else
        if Result_A.count == Result_B.count 
            % 这里没有牛时，也进行比较
            if (Result_A.Max_number>Result_B.Max_number)  
                switch Result_A.count
                    case {7,8,9}
                        Income_ratio = 2;
                    case {10}
                        Income_ratio = 3;
                    otherwise
                        Income_ratio = 1;
                end
            else
                if (Result_A.Max_number==Result_B.Max_number) 
                    if (Result_A.Max_suit<Result_B.Max_suit)
                        switch Result_A.count
                            case {7,8,9}
                                Income_ratio = 2;
                            case {10}
                                Income_ratio = 3;
                            otherwise
                                Income_ratio = 1;
                        end
                    else
                        switch Result_B.count
                            case {7,8,9}
                                Income_ratio = -2;
                            case {10}
                                Income_ratio = -3;
                            otherwise
                                Income_ratio = -1;
                        end
                    end
                else
                     switch Result_B.count
                            case {7,8,9}
                                Income_ratio = -2;
                            case {10}
                                Income_ratio = -3;
                            otherwise
                                Income_ratio = -1;
                     end
                end
            end
        else        
            switch Result_B.count
                case {7,8,9}
                    Income_ratio = -2;
                case {10}
                    Income_ratio = -3;
                otherwise
                    Income_ratio = -1;
            end  
        end  
    end
    
    end
    
    