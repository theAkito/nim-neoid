import
  math,
  lenientops,
  nanoid/nonsecure
export
  nonsecure

when defined(windows):
  import
    winim/lean,
    sequtils,
    strutils
  proc genRandomRaw(step: int = 1): byte =
    var
      temp     : string
      uBuf              = step.alloc
      pbBuffer : PUCHAR = cast[PUCHAR](uBuf.addr)
      cbBuffer : ULONG  = step.int32
      dwFlags  : ULONG  = BCRYPT_USE_SYSTEM_PREFERRED_RNG
    let
      randNum = BCryptGenRandom(
        NULL,
        pbBuffer,
        cbBuffer,
        dwFlags
      )
    temp   = pbBuffer.repr.split(' ')[3]
    temp.stripLineEnd()
    result = temp.parseUInt().byte
  proc genRandomBytes(step: int): seq[byte] =
    for i in 1..step:
      result.add(genRandomRaw())
else:
  import pkg/random
  proc genRandomBytes(step: int): seq[byte] =
    result = urandom(step)
try:
  echo genRandomBytes(12)
except:
  echo getCurrentExceptionMsg()

let a = "_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let s = 21

proc generate*(alphabet: string = a, size: int = s): string =
  if alphabet == "":
    result = ""
  if size < 1:
    result = ""

  let masks = [15, 31, 63, 127, 255]
  var mask: int = 1

  for m in masks:
    if m >= len(alphabet) - 1:
      mask = m
      break

  var step = int(ceil(1.6 * mask * size / len(alphabet)))
  var nanoID: string

  while true:
    var randomBytes: seq[byte]
    randomBytes = genRandomBytes(step)
    for i in countUp(0, step-1):
      var randByte = randomBytes[i].int and mask
      if randByte < len(alphabet):
        if alphabet[randByte] in alphabet:
          nanoID.add(alphabet[randByte])
          if len(nanoID) >= size:
            return nanoID

