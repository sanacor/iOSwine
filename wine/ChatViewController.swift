//
//  File.swift
//  wine
//
//  Created by dosoon on 2021/01/05.
//


import UIKit
import Foundation


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    let shops = ["저스트와인", "와인엔모어 데일리 서판교점", "와인타임 판교점"]
    let wines = ["Primitivo di Manduria 2015", "Primitivo di Manduria 2015", "1000 StoriesZinfandel 2016"]
    let states = ["답변 완료", "답변 완료", "답변 완료"]
    let contents = ["재고 충분합니다. 궁금한 사항 연락주세요:)", "재고 충분합니다. 궁금한 사항 연락주세요:)",  "재고 충분합니다. 궁금한 사항 연락주세요:)"]

 
    @IBOutlet weak var titleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.layer.addBorder([.bottom], color: UIColor.lightGray, width: 0.5)

    
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(shops.count)
        return shops.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "SanaCustomCell",
                for: indexPath
            )
        
        cell.separatorInset = UIEdgeInsets.zero

        return cell
    }
}

class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var wineName: UILabel!
    @IBOutlet weak var wineImage: UIImageView!
    @IBOutlet weak var elapsedTime: UILabel!
    @IBOutlet weak var chatState: UILabel!
}


extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}
