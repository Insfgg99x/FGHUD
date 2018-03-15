![](/img/title.png)

[![Version](https://img.shields.io/cocoapods/v/FGHUD.svg?style=flat)](http://cocoadocs.org/docsets/FGHUD)
[![License](https://img.shields.io/cocoapods/l/FGHUD.svg?style=flat)](http://cocoadocs.org/docsets/FGHUD)
[![Platform](https://img.shields.io/cocoapods/p/FGHUD.svg?style=flat)](http://cocoadocs.org/docsets/FGHUD)
![Language](https://img.shields.io/badge/Language-%20Swift%204.0%20-blue.svg)

----------------------------------------
### FGHUD
- [x] Toast
- [x] HUD

### Screen Shots

![](/img/demo.png)

![](/img/demo.gif)

***See Vedio Here***
[Demo Vedio](http://p5gxxccbw.bkt.clouddn.com/vedio.mov)

### Usage

#### in a view controller
- showHUD()
- showHUD(.loading("Hi, FGHUD"))
- showHUD(.content("Hi, FGHUD"))
- showHUD(.toast("Hi, FGHUD"))
- hideHUD()

#### or in a view
- _ = FGHUD.show(on: targetView, type: .loading("请稍后"))
- _ = FGHUD.show(on: targetView, type: .content("Hi,FGHUD"))
- _ = FGHUD.show(on: targetView, type: .toast("Hi,FGHUD"))
- FGHUD.hide(from: targetView)

### Style
```
public enum HUDType {
    //show void hud
    case `void`
    //show a hud with template
    case loading(String?)
    //show a hud with given content
    case content(String?)
    //auto dismiss after FGHUDToastDuration sec.
    case toast(String?)
}
```

