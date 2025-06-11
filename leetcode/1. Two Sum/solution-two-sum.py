class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        hash = dict()
        h: int = 0
        for h in range(len(nums)):
            c: int = target - nums[h]
            if c in hash:
                return [h, hash[c]]
            hash[nums[h]] = h
        return [] # Empty List()
