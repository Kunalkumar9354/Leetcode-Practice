def find(arr, target):
    n = len(arr)
    low = 0
    high = n - 1
    first, last = -1, -1

    # Binary search to find the first occurrence
    while low <= high:
        mid = (low + high) // 2
        if arr[mid] == target:
            high = mid - 1
            first = mid
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1

    # Reset low and high for the next binary search
    low = 0
    high = n - 1

    # Binary search to find the last occurrence
    while low <= high:
        mid = (low + high) // 2
        if arr[mid] == target:
            low = mid + 1
            last = mid
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1

    return first, last


arr = [2, 8, 8, 8, 8, 8, 11, 13]
target = 8
print(find(arr, target))
