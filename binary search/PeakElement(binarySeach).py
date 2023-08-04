def peakElement(arr): # covering all the edge cases
    n=len(arr)
    if n==0:
        return -1
    if n==1:
        return 0
    if arr[0]>arr[1]:
        return 0
    if arr[n-1]>arr[n-2]:
        return n-1
    low=1
    high=n-2
    while(low<=high):
        mid=(low+high)//2
        if arr[mid]>=arr[mid+1] and arr[mid]>arr[mid-1]:
            return mid
        elif arr[mid]<arr[mid+1]:
            low=mid+1
        else:
            high=mid-1
    return -1
arr=[1,2,3,4,5,6,7,8,5,0]
print(peakElement(arr))