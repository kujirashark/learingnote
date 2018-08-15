for i in range(1,10):  #循环9次，打印出9行
    for j in range(1,i+1):  #第几行就有几项
        print('%s*%s = %s' % (j, i, i*j), end='   ')
    print('')  #每循环1次就打印1个空格，默认回车折行