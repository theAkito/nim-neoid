import 
  random,
  lenientops

proc generateNonSecure*(
  alphabet : string = "_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  size     : int    = 21
): string =
  result = ""
  randomize()
  for i in countup(0, size-1):
    result &= alphabet[(rand(1.0) * len(alphabet)).int]

