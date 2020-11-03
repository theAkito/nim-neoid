[![nimble](https://raw.githubusercontent.com/yglukhov/nimble-tag/master/nimble.png)](https://nimble.directory/pkg/neoid)

[![Language](https://img.shields.io/badge/language-Nim-orange.svg?style=plastic)](https://nim-lang.org/)

[![GitHub](https://img.shields.io/badge/license-GPL--3.0-informational?style=plastic)](https://www.gnu.org/licenses/gpl-3.0.txt)
[![Liberapay patrons](https://img.shields.io/liberapay/patrons/Akito?style=plastic)](https://liberapay.com/Akito/)

## What
Fork of the original [nanoid Nim package](https://nimble.directory/pkg/neoid).

## Why
[See this sad display of an issue in the original project.](https://github.com/icyphox/nanoid.nim/issues/1)
I needed this to work immediately, so I quickly and very dirtily implemented a Windows compatability fix. It's very dirty, but at least it is up to date (does not use deprecated Windows Security functionality) and **it actually works on Windows**!

This was needed as the [original author](https://github.com/oprypin) of an important dependency was [not interested](https://github.com/icyphox/nanoid.nim/issues/1#issuecomment-427253090) in fixing [his `random` library](https://github.com/oprypin/nim-random), which is supposed to work on Windows, even though just importing this library makes your program not work on Windows, at all.

## How
Get started.
```
nimble configure
```
Test run.
```
nimble test
```

## Where
Linux & Windows.

## Goals
Keep it compatible with Windows

## Project Status
At the time of writing, very ugly Windows is implemented, but at least it works precisely the way it is supposed to!

## License
MIT License

Copyright (C) 2020  Akito <the@akito.ooo>
Copyright (C) 2018 Anirudh Oppiliappan <icyph0x@pm.me>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.