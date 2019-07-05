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
        view.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        title = "FGHUD in view controller"
        let rightBtn = UIButton.init()
        rightBtn.setTitle("in view", for: .normal)
        rightBtn.setTitleColor(.white, for: .normal)
        weak var wkself = self
        rightBtn.handleClick(events: .touchUpInside, click: { (sender) in
            sender.isEnabled = false
            let inview = TestViewController()
            wkself?.navigationController?.pushViewController(inview, animated: true)
            sender.isEnabled = true
        })
        let rightItem = UIBarButtonItem.init(customView: rightBtn)
        navigationItem.rightBarButtonItem = rightItem
        
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
                    self.HUDLoading()
                    break
                case 1:
                    self.HUD(.loading("Hi,FGHUD"))
                    break
                case 2:
                    self.HUD(.success("Good Boy!"))
                    break
                case 3:
                    self.HUD(.error("Index outof Range!"))
                    break
                case 4:
                    self.HUD(.warning("Be Happy!"))
                    break
                case 5:
                    self.HUD(HUDType.content("Hi,FGHUD"))
                    break
                case 6:
                    self.HUD(.toast("Hi, FGHUD"))
                    break
                case 7:
                    self.HUDHide()
                    break
                default:
                    break
                }
            })
        }
    }
}

