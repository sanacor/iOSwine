//
//  File.swift
//  wine
//
//  Created by dosoon on 2021/01/05.
//


import UIKit
import Foundation


struct ChatResponse: Codable {
    var results: [Chat]
}

struct Chat: Codable {
    let id: String?
    let shop: String?
    let wine: String?
    let state: String?
    let content: String?

}


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    private var chats: [Chat] = []
    private var shopList: [String] = []
    private var wineList: [String] = []
    private var stateList: [String] = []
    private var contentList: [String] = []
    
    
    private func getChats() {
        
        //URLSession의 싱글턴 객체
        let session = URLSession.shared
        let urlComponents = URLComponents(string: "https://9l885hmyfg.execute-api.ap-northeast-2.amazonaws.com/dev/inquiry")!
        let requestURL = urlComponents.url!

        // 네트워킹 시작
        session.dataTask(with: requestURL) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    //Json타입의 데이터를 디코딩
//                    let resultData = try JSONDecoder().decode(ChatResponse.self, from: data)
                    let ChatList = try JSONDecoder().decode([Chat].self, from: data)
                    self.chats = ChatList
                    
                    for chat in self.chats {
                        print("SANA-000-009")
                        self.shopList.append(chat.shop!)
                        self.wineList.append(chat.wine!)
                        self.stateList.append(chat.state!)
                        self.contentList.append(chat.content!)
    
                    }
                        
                    DispatchQueue.main.async {
                        //UI작업은 꼭 main 스레드에서 !!
                        self.tableView.reloadData()
                    }
                    
                } catch(let err) {
                    print("Decoding Error")
                    print(err.localizedDescription)
                }
            }
        }.resume()
    }
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getChats()
        
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//
//        // URL
//        // URL Components
//        let urlComponents = URLComponents(string: "https://9l885hmyfg.execute-api.ap-northeast-2.amazonaws.com/dev/inquiry")!
//        let requestURL = urlComponents.url!
//
//        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
//            guard error == nil else { return }
//
//            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
//            let successRange = 200..<300
//
//            guard successRange.contains(statusCode) else {
//                // handle response error
//                return
//            }
//
//            guard let resultData = data else { return }
//            let resultString = String(data: resultData, encoding: .utf8)
//
//
//
////            print("---> result : \(resultString)")
//            print("SANA-000-005")
//
//            do {
//                let ChatList = try JSONDecoder().decode([Chat].self, from: resultData)
//                print(ChatList)
//                print(ChatList[0])
//                self.chats = ChatList
//                print("SANA-000-006")
//            } catch {
//                print("SANA-000-007")
//                print(error)
//
//            }
//
//            print("SANA-000-008")
//            for chat in self.chats {
//                print("SANA-000-009")
//                self.shopList.append(chat.shop!)
//                self.wineList.append(chat.wine!)
//                self.stateList.append(chat.state!)
//                self.contentList.append(chat.content!)
//
//
//            }
//
//            print("SANA-000-010")
//            print(self.shopList)
//            print(self.wineList)
//            print(self.stateList)
//            print(self.contentList)
//        }

//        dataTask.resume()
        
        titleView.layer.addBorder([.bottom], color: UIColor.lightGray, width: 0.5)

        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("SANA-000-002")
        print(self.chats.count)
        return self.chats.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("SANA-000-003")
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "ChatTableViewCell",
                for: indexPath
            ) as! ChatTableViewCell
        
//        let cell = tableView.dequeueReusableCell("ChatTableViewCell", forIndexPath: indexPath) as! ChatTableViewCell

        
        
        cell.separatorInset = UIEdgeInsets.zero
        
        cell.shopName?.text = self.shopList[indexPath.row]
        cell.wineName?.text = self.wineList[indexPath.row]
        cell.chatState?.text = self.stateList[indexPath.row]
        
        print("SANA-000-001")
        print(cell)

        return cell
    }
}


class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var wineName: UILabel!
    @IBOutlet weak var wineImage: UIImageView!
    @IBOutlet weak var elapsedTime: UILabel!
    @IBOutlet weak var chatState: UILabel!
    
    func setupView(model: Chat) {

        shopName.text = model.shop
        wineName.text =  model.wine
        chatState.text = model.state
    }

    
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
