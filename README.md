![](/img/title.png)

[![Version](https://img.shields.io/cocoapods/v/FGHUD.svg?style=flat)](http://cocoadocs.org/docsets/FGHUD)
[![License](https://img.shields.io/cocoapods/l/FGHUD.svg?style=flat)](http://cocoadocs.org/docsets/FGHUD)
[![Platform](https://img.shields.io/cocoapods/p/FGHUD.svg?style=flat)](http://cocoadocs.org/docsets/FGHUD)
![Language](https://img.shields.io/badge/Language-%20Swift%204.0%20-blue.svg)

----------------------------------------
### FGHUD

- [x] HUD
- [x] Toast
- [x] Rotation support

### Feathures

![](/img/demo.gif)

****See Vedio Here****
[Vedio](https://pan.baidu.com/s/1mb7OGRJsU0nDDhGTanW9cg)

### Usage

```swift
HUDLoading()
HUD(.loading("Loading..."))
HUD(.success("Success"))
HUD(.error("Operation Error"))
HUD(.warning("watch Out!"))
HUD(.content("Hi, FGHUD"))
HUD(.toast("Hi, FGHUD"))
HUDHide()
```
****HUD with type success,error,warning,toast will auto dismiss itself****

### Install
```
pod repo update
pod 'FGHUD', '~> 3.0'
import FGHUD
```
### Requiredments

- [x] Xocde 10.2.1
- [x] Swift 5.0
