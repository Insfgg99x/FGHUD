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
            make.height.equalTo(90)
        })
        
        
        let titles = ["loading1","loading2","success","error", "warn","content", "toast","hide"]
        let gapx:CGFloat = 10
        let gapy:CGFloat = 10
        let marginx:CGFloat = 5
        let marginy:CGFloat = 10
        let totalCol = 4
        let w = (sw - marginx * 2 - CGFloat(totalCol - 1) * gapx) / CGFloat(totalCol)
        let h:CGFloat = 30
        for i in 0 ..< titles.count {
            let row = i / totalCol
            let col = i % totalCol
            let xpos = marginx + (w + gapx) * CGFloat(col)
            let ypos = marginy + (h + gapy) * CGFloat(row)
            let btn = UIButton.init()
            btn.setTitle(titles[i], for: .normal)
            btn.setTitleColor(.blue, for: .normal)
            btn.setTitleColor(.red, for: .highlighted)
            btn.layer.borderColor = UIColor.lightGray.cgColor
            btn.layer.borderWidth = 0.5
            btn.layer.cornerRadius = 4
            btn.showsTouchWhenHighlighted = true
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            view.addSubview(btn)
            btn.snp.makeConstraints({ (make) in
                make.left.equalTo(self.view).offset(xpos)
                make.height.equalTo(h)
                make.width.equalTo(w)
                make.bottom.equalToSuperview().offset(-60 + ypos)
            })
            btn.handleClick(events: .touchUpInside, click: { (sender) in
                switch  i {
                case 0:
                    targetView.showHUD()
                    break
                case 1:
                    targetView.showHUD(.loading("Hi,FGHUD"))
                    break
                case 2:
                    targetView.showHUD(.success("哈哈哈"))
                    break
                case 3:
                    targetView.showHUD(.error("Hi, FGHUD"))
                    break
                case 4:
                    targetView.showHUD(.warning("Hi, FGHUD"))
                    break
                case 5:
                    targetView.showHUD(HUDType.content("Hi,FGHUD"))
                    break
                case 6:
                    targetView.showHUD(.toast("Hi, FGHUD"))
                    break
                case 7:
                    targetView.hideHUD()
                    break
                default:
                    break
                }
            })
        }
    }
}
