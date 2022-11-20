def bubbleSort(nList):
    for passNum in range(len(nList)-1,0,-1):
        for i in range(passNum):
            if nList[i] > nList[i+1]:
                temp = nList[i]
                nList[i] = nList[i+1]
                nList[i+1] = temp

nList = [99, 12, 8, 90, 232, 33, 28, 82, 1, 23, 25, 24, 149, 231, 2]

print(nList)
bubbleSort(nList)
print(nList)
