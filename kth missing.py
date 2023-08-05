def find_kth(arr,n,k):
    for i in range(n):
        if arr[i]<=k:
            k+=1
    return k
arr=[2,3,4,7,11]
k=5
n=len(arr)
print(find_kth(arr,n,k))
# binary search
def find(arr,k):
    low=0
    high=len(arr)-1
    while (low<high):
        mid=(low+high)//2
        missing=arr[mid]-(mid+1)
        if missing<k:
            low = mid + 1
        else:
            high=mid-1
    return high+k+1
arr=[2,3,4,7,11]
k=5
print(find(arr,k))
 

