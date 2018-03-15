//
//  ViewController.swift
//  FGHUD
//
//  Created by xgf on 2018/3/15.
//  Copyright © 2018年 xgf. All rights reserved.
//

import UIKit

let sw = UIScreen.main.bounds.size.width
let sh = UIScreen.main.bounds.size.height

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let targetView = UIView.init()
        targetView.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        view.addSubview(targetView)
        targetView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(90)
            make.size.equalTo(CGSize.init(width: 160, height: 120))
        }
        
        let menu = UIView.init()
        view.addSubview(menu)
        menu.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        menu.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(50)
        })
        
        let titles = ["style1","style2","style3", "toast", "hide"]
        let gapx:CGFloat = 5
        let marginx:CGFloat = 5
        let marginy:CGFloat = 10
        let w = (sw - marginx * 2 - CGFloat(titles.count - 1) * gapx) / CGFloat(titles.count)
        let h:CGFloat = 30
        for i in 0 ..< titles.count {
            let btn = UIButton.init()
            btn.setTitle(titles[i], for: .normal)
            btn.setTitleColor(.blue, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            view.addSubview(btn)
            let xpos = marginx + (w + gapx) * CGFloat(i)
            btn.snp.makeConstraints({ (make) in
                make.left.equalTo(self.view).offset(xpos)
                make.height.equalTo(h)
                make.width.equalTo(w)
                make.bottom.equalToSuperview().offset(-marginy)
            })
            btn.handleClick(events: .touchUpInside, click: { (sender) in
                switch  i {
                case 0:
                    showHUD()
                    _ = FGHUD.show(on: targetView, type: .loading("请稍后"))
                    break
                case 1:
                    showHUD(.loading("Hi, FGHUD"))
                    _ = FGHUD.show(on: targetView, type: .loading("Hi,FGHUD"))
                    break
                case 2:
                    showHUD(.content("Hi, FGHUD"))
                    _ = FGHUD.show(on: targetView, type: .content("Hi,FGHUD"))
                    break
                case 3:
                    showHUD(.toast("Hi, FGHUD"))
                    _ = FGHUD.show(on: targetView, type: .toast("Hi,FGHUD"))
                    break
                case 4:
                    hideHUD()
                    FGHUD.hide(from: targetView)
                    break
                default:
                    break
                }
            })
        }
    }
}

