//
//  File.swift
//  wine
//
//  Created by dosoon on 2021/01/05.
//


import UIKit
import Foundation

class ChatItem {
    let id: String?
    let shop: String?
    let wine: String?
    let state: String?
    let content: String?
    
    init(id: String, shop: String, wine: String, state: String, content: String) {
        self.id = id
        self.shop = shop
        self.wine = wine
        self.state = state
        self.content = content
    }
}

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var titleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // URL
        // URL Components
        let urlComponents = URLComponents(string: "https://9l885hmyfg.execute-api.ap-northeast-2.amazonaws.com/dev/inquiry")!
        let requestURL = urlComponents.url!

        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            guard error == nil else { return }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
            let successRange = 200..<300
            
            guard successRange.contains(statusCode) else {
                // handle response error
                return
            }
            
            guard let resultData = data else { return }
            let resultString = String(data: resultData, encoding: .utf8)
            
            
            
            print("---> result : \(resultString)")
        }

        dataTask.resume()
        
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
