![](/img/title.png)

[![Version](https://img.shields.io/cocoapods/v/FGHUD.svg?style=flat)](http://cocoadocs.org/docsets/FGHUD)
[![License](https://img.shields.io/cocoapods/l/FGHUD.svg?style=flat)](http://cocoadocs.org/docsets/FGHUD)
[![Platform](https://img.shields.io/cocoapods/p/FGHUD.svg?style=flat)](http://cocoadocs.org/docsets/FGHUD)
![Language](https://img.shields.io/badge/Language-%20Swift%204.0%20-blue.svg)

----------------------------------------
### FGHUD
- [x] HUD
- [x] toast
- [x] rotation support

### Screen Shots

![](/img/1.png)


![HUD](/img/2.png)


![HUD](/img/3.png)


![](/img/demo.gif)

***See Vedio Here***

[Vedio](https://pan.baidu.com/s/1mYi3fG7K-5kq_aI-gNhsbA)

### Usage

#### in a view controller
templete hud
```
showHUD()
```
or
```
showHUD(.loading("Hi, FGHUD"))
```
toast style
```
showHUD(.content("Hi, FGHUD"))
```
toast
```
showHUD(.toast("Hi, FGHUD"))
```
hide
```
hideHUD()
```

#### or in a view
show hud with content
```
_ = FGHUD.show(on: targetView, type: .loading("请稍后"))
or
_ = FGHUD.show(on: targetView, type: .content("Hi,FGHUD"))
```
toast
```
_ = FGHUD.show(on: targetView, type: .toast("Hi,FGHUD"))
```
hide
```
FGHUD.hide(from: targetView)
```

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

