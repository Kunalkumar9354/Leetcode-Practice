def find(arr,target):
    n=len(arr)
    low=0
    high=n-1
    ans=10**8
    while(low<=high):
        mid=(low+high)//2
        if arr[mid]>=target:
            high= mid-1
            ans=arr[mid]
        else:
            low = mid + 1
    return ans
arr=[10,20,30,40,50]
target=25
print(find(arr,target))