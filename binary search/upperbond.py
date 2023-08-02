def found(arr,target):
    n=len(arr)
    low=0
    ans=n
    high=n-1
    while(low<=high):
        mid=(low+high)//2
        if arr[mid]>target:
            high = mid-1
            ans=mid
        else:
            low = mid +1
    return ans
arr=[1,2,3,4,4,11,12,13,19]
target=11
print(found(arr,target))

