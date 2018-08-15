'''
两个乒乓球队进行比赛，各出三人。甲队为a,b,c三人，乙队为x,y,z三人。
已抽签决定比赛名单。有人向队员打听比赛的名单。a说他不和x比，c说他不和x,z比。请编程序找出三队赛手的名单。

'''

'''
基本思路如下：假设a,b,c的对手分别是i,j,k，将i,j,k所有可能出现的组合先穷举出来，
同时需要满足2个条件：i,j,k不能同时出现（即a,b,c的对手不可能有重复）；a不对x，c不对x,z，只要满足此2条件就可以。
简而言之：用3个for穷举，用2个if限定条件。
'''
# for i in range(ord('x'), ord('z')+1):  #假设a,b,c的对手分别是i,j,k
#     for j in range(ord('x'), ord('z')+1):  #用3个for穷举i,j,k可能出现的所有组合
#         for k in range(ord('x'), ord('z')+1):
#             if i != j and j != k and k != i:  #条件1：i,j,k不能同时出现
#                 if i != ord('x') and k != ord('x') and k != ord('z'):  #条件2：a不对x，c不对x,z
#                     print('a vs %s, b vs %s, c vs %s' % (chr(i), chr(j), chr(k)))


'''
根据上述代码，联想到之前 求解不重复的3位数时用到的itertools库，觉得可以简化代码如下：
itertools.permutations()是个好东西，可以直接将'xyz'生成包含所有排列的列表。
另外两个相关的库方法分别是：itertools.product()生成笛卡尔数列（即包括所有排列方式，itertools.combinations()生成所有组合的列表。
就生成项的数目而言，product() > permutations() > combinations()。
本题中，permutations('xyz', 3)可生成6组排列方式，而如果换成combinations('xyz', 3)，则只有1种组合方式（'x', 'y', 'z'）。
'''
# import itertools
#
# for i in itertools.permutations('xyz'):
#     if i[0] != 'x' and i[2] != 'x' and i[2] != 'z':
#         print('a vs %s, b vs %s, c vs %s' % (i[0], i[1], i[2]))



'''
又多了一种解题思路：先将 a,b,c 这一队列出所有可能的排列方式（共6组），
然后每一组都跟 x,y,z 进行匹配（用zip()方法），并设置判断条件。事实证明，这6组之中，只有1组是满足条件的。
'''
import itertools

team_1 = ['a', 'b', 'c']
team_2 = ['x', 'y', 'z']

for i in itertools.permutations(team_1, 3):
    for j in zip(i, team_2):
        if j in [('a', 'x'), ('c', 'x'), ('c', 'z')]:
            break
    else:
        print(i, team_2)

