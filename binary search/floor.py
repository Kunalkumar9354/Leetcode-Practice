def find(arr, target):
    n = len(arr)
    low = 0
    ans = -1
    high = n - 1
    while low <= high:
        mid = (high + low) // 2
        if arr[mid] <= target:
            low = mid + 1
            ans = arr[mid]
        else:
            high = mid - 1
    return ans

arr = [10, 20, 30, 40, 50]
target = 25
print(find(arr, target))
