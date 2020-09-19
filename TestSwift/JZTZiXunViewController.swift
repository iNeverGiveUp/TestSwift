//
//  JZTZiXunViewController.swift
//  TestSwift
//
//  Created by 赵奎 on 2020/9/15.
//  Copyright © 2020 赵奎. All rights reserved.
//

import UIKit
import KakaJSON

struct ZiXunModel: Convertible{
    var name = "克里斯蒂亚诺·罗纳尔多"
    var content = "拆分体式空调需要有经验的人来操作才会更安全，而拆空调前需要进行收氟。收氟之前，先检查空调室外机有无出现漏氟，空调有无出现漏电，如果有，请先将有泄露的地方补"
    var img = "https://lupic.cdn.bcebos.com/20191203/3016253704_14.jpg"
    var title = "测试标题"
}

class JZTZiXunViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var listDataArray = [ZiXunModel]()
    let tableView = UITableView.init(style: .plain, backgroundColor: .hex181818, separatorStyle: .none)
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "资讯"
        if let arr = read([ZiXunModel].self, from: Bundle.main.url(forResource: "tongcheng", withExtension: "json")!) {
            listDataArray = arr
        }
        view.backgroundColor = .clear
        tableView.register(JZTZiXunCell.self)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        view.add(tableView).snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(50)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: JZTZiXunCell.self)
        cell.titleLabel.text = listDataArray[indexPath.row].title
        cell.nameLabel.text = listDataArray[indexPath.row].name
        cell.contentLabel.text = listDataArray[indexPath.row].content
        cell.iconImage.kf.setImage(with: URL(string: listDataArray[indexPath.row].img))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismissVC()
    }
    
    

}


