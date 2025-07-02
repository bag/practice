# Enter your code here. Read input from STDIN. Print output to STDOUT
import math
AB = int(input())
BC = int(input())
AC = (AB**2 + BC**2)**0.5
MC = AC / 2
MB = MC
# Law Of Cosines.
cos_MBC = (MB**2 + BC**2 - MC**2) / (2 * MB * BC)
angle_MBC_radians = math.acos(cos_MBC)
angle_MBC_degrees = round(math.degrees(angle_MBC_radians))
# Note: \N{DEGREE SIGN} is necessary to keep 
# the source in ASCII range.
print(f"{angle_MBC_degrees}\N{DEGREE SIGN}")
