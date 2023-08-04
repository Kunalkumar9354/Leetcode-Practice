def peakElement(arr):
    n=len(arr)
    if n==0:
        return -1
    for i in range(n):
        if i==0:
            if arr[i]>arr[i+1]:
                return arr[i]
        elif i == n-1:
            if arr[i]>arr[i-1]:
                return arr[i]
        if arr[i]>arr[i-1] and arr[i]>arr[i+1]:
            return arr[i]
    return -1
arr=[1,2,3,4,5,6,7,8,5,0]
print(peakElement(arr))
        