//
//  JZTShopCategoryViewController.swift
//  TestSwift
//
//  Created by 赵奎 on 2020/9/18.
//  Copyright © 2020 赵奎. All rights reserved.
//

import UIKit
import SwiftComponents

struct JZTShopDataModel: Convertible {
    var data = [JZTShopCategoryModel]()
}

class JZTShopCategoryModel: Convertible{
    required init() {
        
    }
    var id = ""
    var name = ""
    var type = ""
    var state = ""
    var officeCode = ""
    var expand = ""
    var orderNum = ""
    var createTime = ""
    var check = ""
    var pid = ""
    var isSelect = false
}

class JZTShopCategoryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var listDataArray = [JZTShopCategoryModel]()
    var collectionView = UICollectionView(scrollDirection: .vertical, backgroundColor: .white, layout: UICollectionViewLeftAlignedLayout(), interitemSpacing: 10, lineSpacing: 10, sectionInset: .init(top: 0, left: 20, bottom: 80, right: 20))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    func setUpUI() {
        if let dataModel = read(JZTShopDataModel.self, from: Bundle.main.url(forResource: "test", withExtension: "json")!) {
            listDataArray = dataModel.data
        }
        
        collectionView.register(JZTCategoryCell.self, forCellWithReuseIdentifier: "JZTCategoryCell")
        collectionView.register(supplementaryViewOfKind: "JZTHeaderView", withClass: JZTHeaderView.self)
        collectionView.register(supplementaryViewOfKind: "JZTFooterView", withClass: JZTFooterView.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.add(self.collectionView).snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(64)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listDataArray.count
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: JZTCategoryCell.self, for: indexPath)
        let dataModel = listDataArray[indexPath.item]
        cell.shopCateBtn.setTitle(dataModel.name, for: .normal)
        cell.shopCateBtn.isSelected = dataModel.isSelect
        cell.shopCateBtn.tag = indexPath.item
        cell.contentView.backgroundColor = dataModel.isSelect ? .main : .init(hex: "E5E5E5")
        cell.shopCateBtn.add(target: self, action: #selector(shopCategoryClick))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "UICollectionElementKindSectionHeader"{
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: "JZTHeaderView", withClass: JZTHeaderView.self, for: indexPath)
            headerView.titleLabel.text = "商品分类"
            return headerView
        }else{
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: "JZTFooterView", withClass: JZTFooterView.self, for: indexPath)
            footerView.cancleBtn.setTitle("重置", for: .normal)
            footerView.cancleBtn.add(target: self, action: #selector(resetClick))
            footerView.confirmBtn.setTitle("确定", for: .normal)
            footerView.confirmBtn.add(target: self, action: #selector(confirmClick))
            return footerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: self.view.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: self.view.frame.width, height: 50)
    }
    
    @objc func resetClick() {
        listDataArray.forEach{ $0.isSelect = false }
        collectionView.reloadData()
    }
    @objc func confirmClick() {
        let temp = listDataArray.filter{$0.isSelect}.map{$0.name}
        print("---- \(temp)---")
    }
    @objc func shopCategoryClick(item:UIButton) {
        listDataArray[item.tag].isSelect.toggle()
        collectionView.reloadData()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismissVC()
    }
}

extension JZTShopCategoryViewController{
    class JZTCategoryCell: LZCollectionViewCell {
        let shopCateBtn = UIButton.init(font: .font16, titleColor: .hex333333)
        override func setupUI() {
            contentView.cornerRadius = 15
            shopCateBtn.setTitleColor(.white, for: .selected)
            contentView.backgroundColor = .init(hex: "e5e5e5")
            contentView.add(shopCateBtn).snp.makeConstraints { (make) in
                make.center.top.equalToSuperview()
                make.left.equalToSuperview().offset(15)
                make.height.equalTo(30)
            }
        }
    }
    
    class JZTHeaderView: LZCollectionReusableView {
        let titleLabel = UILabel.init(font: UIFont.font15.bold, textColor: .hex333333)
        override func setupUI() {
            self.add(titleLabel).snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(20)
            }
        }
    }
    
    class JZTFooterView: LZCollectionReusableView {
        let cancleBtn = UIButton.init(font: .font14, title: "重置", titleColor: .red);
        let confirmBtn = UIButton.init(font: .font14, title: "确定", titleColor: .red)
        override func setupUI() {
            let stack = UIStackView.init(arrangedSubviews: [cancleBtn,confirmBtn], axis: .horizontal, spacing: 20, alignment: .fill, distribution: .fillEqually)
            cancleBtn.layer.cornerRadius = 25
            cancleBtn.borderColor = .init(hex: "333333")
            cancleBtn.borderWidth = 1
            confirmBtn.layer.cornerRadius = 25
            confirmBtn.backgroundColor = .main
            confirmBtn.borderWidth = 1
            confirmBtn.borderColor = .init(hex: "ff344d")
            self.add(stack).snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
        }
    }
}
