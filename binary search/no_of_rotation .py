def rotate(arr):
    n=len(arr)
    low=0
    high=n-1
    index=-1
    ans= float('inf')
    while(low<=high):
        mid=(low+high)//2
        if arr[low]<=arr[mid]:
            ans=min(ans,arr[low])
            index=low
            low=mid+1
        else:
            ans=min(ans,arr[mid])
            index=mid
            high=mid-1
    return index
arr=[5,6,7,1,2,3,4]
print(rotate(arr))
    