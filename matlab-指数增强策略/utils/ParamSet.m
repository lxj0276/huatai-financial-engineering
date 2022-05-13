% -------------------------------------------------------------------------
% 全局参数设置
% -------------------------------------------------------------------------
function param = ParamSet()

% -------------------------------------------------------------------------
% 回测参数设置
% -------------------------------------------------------------------------
% 回测的起始月份(个股收益预测数据是从第154个截面开始有效的，对应2011-01-31)
param.beginMonth = 154;    

% 回测的结束月份
param.endMonth = 273;      

% 交易的手续费
param.fee = 0.002;

% 风格因子、行业因子、国家因子个数（不能修改的参数）
param.styleFactorNum = 10;       
param.indusFactorNum = 30;       
param.countryFactorNum = 1;

% 设立基准类型：原始指数(net)、全收益指数(total)
% 在做指数增强时，公平起见应该比对全收益指数，因为回测中采用个股复权价格，
% 相当于分红再投资了，所以即便采用成分股权重进行复制也会跑赢净价指数
param.baseType = 'net';

% -------------------------------------------------------------------------
% 行业模拟观点生成相关参数
% -------------------------------------------------------------------------
% 生成模拟观点时的看多、看空行业个数
param.longIndusNum = 5;  
param.shortIndusNum = 5; 
param.unNeturalIndusNum = param.longIndusNum + param.shortIndusNum;  

% -------------------------------------------------------------------------
% 设置优化参数，重点调参对象
% -------------------------------------------------------------------------
% 股指选择：沪深300(HS300)、中证500(ZZ500)、中证800(ZZ800)
% 中证1000的成分股有效日期太晚，中证全指的全收益指数成立太晚
param.targetIndex = 'HS300';  

% 风险厌恶系数，取值为零表示进行线性规划求解，否则二次规划求解（运行很慢）
param.lambda = 0;

% 收益调整系数：用于将行业轮动预测观点直接叠加到个股收益预测中去
% 使用调整后的预测收益时，beta为超配行业权重，其计量单位为X倍标准差
% 从理论上讲，个股收益预测可以认为是标准正太分布，那么当beta取值为1时
% 整体认为行业观点和个股收益预测观点等权重，如果beta值越大，则说明行业
% 观点起的作用越大，反之则原个股收益预测的作用越大
param.beta = 0;

% 是否目标指数内选股（1=是，0=否），否则在全A股内配置
param.selectInIndex = 0;   

% 个股权重偏离限制（也即个股相比于基准最多偏离多少）
param.stockWeightUpLimit = 0.01;   

% 看多/看空行业的偏离上限、下限
param.indusWeightUpLimit = 0.04;   
param.indusWeightDownLimit = 0.01;  

% 行业中性设置，也即偏离多少范围内认为是行业中性
param.indusWeightNeutralLimit = 0.00;   

% 市值中性设置，也即偏离多少范围内认为是市值中性
param.sizeFactorLimit = 0.0; 

end

