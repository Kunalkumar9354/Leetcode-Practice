def found(arr,target):
    n=len(arr)
    low=0
    high=n-1
    while(low<=high):
        mid=(low+high)//2
        if arr[mid]==target:
            return mid
        elif arr[mid]< target:
            low = mid + 1
        else:
            high=mid-1
    return -1
arr=[1,2,3,4,4,11,12,13,19]
target= 20
print(found(arr,target))
    