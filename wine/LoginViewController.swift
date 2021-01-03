//
//  ViewController.swift
//  wine
//
//  Created by dosoon on 2020/12/28.
//

import UIKit
import KakaoSDKAuth



class LoginViewController: UIViewController {
    
    @IBAction func onClickKakaoLogin(_ sender: Any) {
        print("clicked")
        
        // 추가 : 카카오 로그인
        if (AuthApi.isKakaoTalkLoginAvailable()) {
          print("-> KakaoTalkLoginAvailable")
          AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
            print("completion")
            print(oauthToken)
            if let error = error {
              print("login error")
              print(error)
            }
            else {
              print("loginWithKakaoTalk() success.")
              //do something
              _ = oauthToken
                self.bar()
            
            }
          }
        }
      }

    func bar() {
        print("SANA-001")
        let vc = storyboard?.instantiateViewController(identifier: "green_vc") as! UITabBarController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

