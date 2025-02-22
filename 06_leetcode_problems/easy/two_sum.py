from typing import List


class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        """
        LeetCode Problem 1: Two Sum
        Difficulty: Easy

        Given an array of integers nums and an integer target,
        return indices of the two numbers such that they add up to target.

        Time Complexity: O(n)
        Space Complexity: O(n)
        """
        seen = {}
        for i, num in enumerate(nums):
            complement = target - num
            if complement in seen:
                return [seen[complement], i]
            seen[num] = i
        return []


# Example test cases
def test_two_sum():
    solution = Solution()
    assert solution.twoSum([2, 7, 11, 15], 9) == [0, 1]
    assert solution.twoSum([3, 2, 4], 6) == [1, 2]
    assert solution.twoSum([3, 3], 6) == [0, 1]
