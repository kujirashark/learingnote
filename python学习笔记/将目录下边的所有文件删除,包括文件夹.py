#作业:将目录下边的所有文件删除,包括文件夹
import os
def getAllDir(path):
    fillAll = os.listdir(path)
    #print(fillAll)
    for filename in fillAll:
        filePath = os.path.join(path,filename)
        #print(filePath)
        if os.path.isdir(filePath):
            getAllDir(filePath)
            #print(filePath)
            os.rmdir(filePath)
        elif os.path.isfile(filePath):
            os.remove(filePath)
            
getAllDir('../../123')




