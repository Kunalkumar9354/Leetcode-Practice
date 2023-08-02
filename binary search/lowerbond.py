def found(arr,target):
    n=len(arr)
    ans=n
    low,high=0,n-1
    while (low<=high):
        mid=(low+high)//2
        if arr[mid]>=target:
            ans= mid
            high=mid-1
        else:
            low=mid+1
    return ans
arr=[1,2,3,4,4,11,12,13,19]
target=1
print(found(arr,target))


            
            