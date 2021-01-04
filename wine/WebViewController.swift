//
//  WebViewController.swift
//  wine
//
//  Created by dosoon on 2021/01/04.
//

import UIKit
import Foundation
import WebKit

//class WebViewController: UIViewController {
class WebViewController: UIViewController, WKUIDelegate {
    @IBOutlet weak var WebViewMain: WKWebView!
    //    @IBOutlet weak var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let urlString = "http://ec2-13-124-226-51.ap-northeast-2.compute.amazonaws.com:8080/app/map"
        if let url = URL(string: urlString) {
            let urlReq = URLRequest(url: url)
            WebViewMain.load(urlReq)
        }
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        WebViewMain = WKWebView(frame: .zero, configuration: webConfiguration)
        WebViewMain.uiDelegate = self
        view = WebViewMain
    }
    

    
}
