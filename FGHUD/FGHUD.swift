//
//  FGHUD.swift
//  FGHUD
//
//  Created by xgf on 2018/3/15.
//  Copyright © 2018年 xgf. All rights reserved.
//

import UIKit
import SnapKit

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

class FGHUD: UIView {
    class func show(on v: UIView?, type:HUDType) -> FGHUD? {
        guard let view = v else {
            return nil
        }
        hide(from: view)
        let hud = FGHUD.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        hud.backgroundColor = FGHUDTintColor
        hud.layer.cornerRadius = 10
        
        let contentLb = UILabel.init(frame: .zero)
        contentLb.textColor = .white
        contentLb.textAlignment = .center
        contentLb.numberOfLines = 0
        contentLb.font = UIFont.systemFont(ofSize: FGHUDFontSize)
        hud.addSubview(contentLb)
        
        var trimx:CGFloat = 50
        var hudw:CGFloat = 100
        var hudh:CGFloat = 100
        func contentBlock(_ msg: String?) {
            trimx = 40
            contentLb.text = msg
            contentLb.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.left.equalTo(hud).offset(5)
                make.right.equalTo(hud).offset(-5)
                make.height.equalTo(20)
            }
            var w = contentLb.sizeThatFits(.init(width: .greatestFiniteMagnitude, height: FGHUDMinHeight)).width
            if w < FGHUDMinWidth {
                w = FGHUDMinWidth
            } else if w > FGHUDMaxWidth {
                w = FGHUDMaxWidth
            }
            var h = contentLb.sizeThatFits(.init(width: w, height: .greatestFiniteMagnitude)).height
            if h < FGHUDMinHeight {
                h = FGHUDMinHeight
            } else if h > FGHUDMaxHeight {
                h = FGHUDMaxHeight
            }
            hudw = w + 20
            hudh = h
        }
        switch type {
        case let .loading(msg):
            contentLb.text = msg
            contentLb.snp.makeConstraints { (make) in
                make.centerY.equalTo(hud).offset(25)
                make.left.equalTo(hud).offset(5)
                make.right.equalTo(hud).offset(-5)
                make.height.equalTo(20)
            }
            let indicator = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
            hud.addSubview(indicator)
            indicator.snp.makeConstraints { (make) in
                make.top.equalTo(hud).offset(20)
                make.centerX.equalTo(hud)
                make.size.equalTo(CGSize.init(width: 30, height: 30))
            }
            indicator.startAnimating()
            break
        case let .content(msg):
            contentBlock(msg)
            break
        case let .toast(msg):
            contentBlock(msg)
            DispatchQueue.main.asyncAfter(deadline: .now() + FGHUDToastDuration, execute: {
                hud.hide()
            })
            break
        default:
            break
        }
        view.addSubview(hud)
        hud.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize.init(width: hudw, height: hudh))
        }
        hud.alpha = 0.0
        UIView.animate(withDuration: 0.2, animations: {
            hud.alpha = 1.0
        })
        return hud
    }
}
//MARK: -
//MARK: Hide
extension FGHUD {
    class func hide(from:UIView?) {
        guard let view = from else {
            return
        }
        view.subviews.forEach {
            if $0 is FGHUD {
                let hud = $0
                UIView.animate(withDuration: 0.2, animations: {
                    hud.alpha = 0.0
                }, completion: { (_) in
                    hud.removeFromSuperview()
                })
            }
        }
    }
    func hide() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0.0
        }, completion: { (_) in
            self.removeFromSuperview()
        })
    }
    func hideWithoutAnimation() {
        removeFromSuperview()
    }
}
//MARK: -
//MARK: UIViewController
extension UIViewController {
    func showHUD() {
        DispatchQueue.main.async {
            if let tmp = objc_getAssociatedObject(self, &FGHUDKey) as? FGHUD {
                tmp.hideWithoutAnimation()
            }
            let hud = FGHUD.show(on: self.view, type: .loading("请稍后"))
            objc_setAssociatedObject(self, &FGHUDKey, hud, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    func showHUD(_ type:HUDType) {
        if let tmp = objc_getAssociatedObject(self, &FGHUDKey) as? FGHUD {
            tmp.hideWithoutAnimation()
        }
        let hud = FGHUD.show(on: self.view, type: type)
        objc_setAssociatedObject(self, &FGHUDKey, hud, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    func hideHUD() {
        if let hud = objc_getAssociatedObject(self, &FGHUDKey) as? FGHUD {
            hud.hide()
        }
    }
}
