//
//  ViewController.swift
//  TestSwift
//
//  Created by 赵奎 on 2020/9/8.
//  Copyright © 2020 赵奎. All rights reserved.
//

import UIKit
import SwiftComponents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton.init(color: .random);
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(200)
            make.size.equalTo(CGSize.init(width: 50, height: 50))
        }
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
    }
    
    @objc func btnClick() {
        print("--点击--")
        let popView = JZTPopViewController()
        popView.titlesArray = ["去拜访","添加拜访计划"]
        popView.clickItemBlock = { index in
            print("----click index \(index) ---")
        }
        popView.setupTransitioningAnimate(.present)
        self.presentVC(popView)
    }

}

