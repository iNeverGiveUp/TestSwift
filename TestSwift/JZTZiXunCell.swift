//
//  JZTZiXunCell.swift
//  TestSwift
//
//  Created by 赵奎 on 2020/9/15.
//  Copyright © 2020 赵奎. All rights reserved.
//

import UIKit
import SwiftComponents

class JZTZiXunCell: LZTableViewCell {
    
    let titleLabel = UILabel.init(font: .font12, textColor: .hex333333 , numberOfLines: 1, textAlignment: .left)
    let nameLabel = UILabel(font: .font10, textColor: .hex999999 , numberOfLines: 1, textAlignment: .left)
    let contentLabel = UILabel.init(font: .font12, textColor: .hex999999 , numberOfLines: 0, textAlignment: .left)
    let iconImage = UIImageView()
    
    override func setupUI() {
        iconImage.contentMode = .scaleAspectFit
        contentView.add(iconImage).snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(120)
        }
        contentView.add(titleLabel).snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
        }
        contentView.add(nameLabel).snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel)
            make.leading.equalTo(titleLabel.snp.trailing).offset(8)
        }
        contentView.add(contentLabel).snp.makeConstraints { (make) in
            make.leading.equalTo(self.titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.trailing.equalTo(iconImage.snp.leading).offset(-8)
        }
    }
}
