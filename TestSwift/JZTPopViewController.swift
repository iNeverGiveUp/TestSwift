//
//  JZTPopViewController.swift
//  TestSwift
//
//  Created by 赵奎 on 2020/9/8.
//  Copyright © 2020 赵奎. All rights reserved.
//

import UIKit
import SwiftComponents


class JZTPopViewController: UIViewController {
    typealias clickItemIndex = (Int)->()
    var clickItemBlock: clickItemIndex?

    var titlesArray = [String]()
    
    private let contentView = UIView(color: .white)
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(contentView)
        contentView.addSubview(stackView)
        ///横竖向  分布  对齐
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        contentView.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalToSuperview()
        }
        stackView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-SafeBottomArea)
        }
        for (index, title) in titlesArray.enumerated() {
            let tempBtn = UIButton.init(font: .font16, title: title, titleColor: .black)
            tempBtn.tag = index
            tempBtn.add(target: self, action: #selector(clickItem(item:)))
            tempBtn.snp.makeConstraints { (make) in
                make.height.equalTo(49)
            }
            stackView.addArrangedSubview(tempBtn)
            
            if index != titlesArray.count - 1 {
                let tempLine = UIView.init(color: .hexE5E5E5)
                tempLine.snp.makeConstraints { (make) in
                    make.height.equalTo(0.5)
                }
                stackView.addArrangedSubview(tempLine)
            }
        }
        
        let bottomLine = UIView.init(color: .hexF6F6F6)
        let cancleBtn = UIButton.init(font: .font16, title: "取消", titleColor: .black, image: nil)
        cancleBtn.add(target: self, action: #selector(cancleClick))
        
        bottomLine.snp.makeConstraints { (make) in
            make.height.equalTo(8)
        }
        cancleBtn.snp.makeConstraints { (make) in
            make.height.equalTo(49)
        }
        stackView.addArrangedSubviews([bottomLine,cancleBtn])
        
    }
    
    @objc func cancleClick() {
        self.dismissVC()
    }
   
    @objc func clickItem(item: UIButton)  {
        clickItemBlock?(item.tag)
    }
    
}
