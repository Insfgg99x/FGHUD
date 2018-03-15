//
//  ViewController.swift
//  FGHUD
//
//  Created by xgf on 2018/3/15.
//  Copyright © 2018年 xgf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = ["show loading", "show msg", "toast", "hide"]
        for i in 0 ..< titles.count {
            let btn = UIButton.init()
            btn.setTitle(titles[i], for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.layer.cornerRadius = 4
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.lightGray.cgColor
            view.addSubview(btn)
            btn.snp.makeConstraints({ (make) in
                make.centerX.equalToSuperview()
                make.height.equalTo(40)
                make.width.equalTo(130)
                make.top.equalToSuperview().offset(150 + 60 * i)
            })
            btn.handleClick(events: .touchUpInside, click: { (sender) in
                switch  i {
                case 0:
                    showHUD()
                    break
                case 1:
                    showHUD(.content("FGHUD show msg style"))
                    break
                case 2:
                    showHUD(.toast("FGHUD toast style"))
                    break
                case 3:
                    hideHUD()
                    break
                default:
                    break
                }
            })
        }
    }
}

