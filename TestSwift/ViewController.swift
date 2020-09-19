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
//        print("--点击--")
//        let popView = JZTPopViewController()
//        popView.titlesArray = ["去拜访","添加拜访计划"]
//        popView.clickItemBlock = { index in
//            print("----click index \(index) ---")
//        }
//        popView.setupTransitioningAnimate(.present)
//        self.presentVC(popView)
        
//        var tempData = [ZiXunModel]()
//        for num in 1...10 {
//            var tempModel = ZiXunModel()
//            tempModel.name = "C罗\(num)"
//            tempModel.title = "测试标题\(num)"
//            tempModel.content = "拆分体式空调需要有经验的人来操作才会更安全，而拆空调前需要进行收氟。收氟之前，先检查空调室外机有无出现漏氟，空调有无出现漏电，如果有，请先将有泄露的地方补"
//            tempModel.imageUrl = "https://lupic.cdn.bcebos.com/20191203/3016253704_14.jpg"
//            tempData.append(tempModel)
//        }
        
        let ziXun = JZTShopCategoryViewController()
        ziXun.setupTransitioningAnimate(.rightToLeft)
        self.presentVC(ziXun)
    }

}

