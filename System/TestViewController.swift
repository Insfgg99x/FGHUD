//
//  TestViewController.swift
//  FGHUD
//
//  Created by xgf on 2018/3/16.
//  Copyright © 2018年 xgf. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FGHUD in view"
        view.backgroundColor = .white
        
        let targetView = UIView.init()
        targetView.backgroundColor = .red
        view.addSubview(targetView)
        targetView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 200, height: 200))
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
                    _ = FGHUD.show(on: targetView, type: .loading("请稍后"))
                    break
                case 1:
                    _ = FGHUD.show(on: targetView, type: .loading("Hi,FGHUD"))
                    break
                case 2:
                    _ = FGHUD.show(on: targetView, type: .content("Hi,FGHUD"))
                    break
                case 3:
                    _ = FGHUD.show(on: targetView, type: .toast("Hi,FGHUD"))
                    break
                case 4:
                    FGHUD.hide(from: targetView)
                    break
                default:
                    break
                }
            })
        }
    }
}
