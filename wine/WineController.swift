//
//  WineController.swift
//  wine
//
//  Created by dosoon on 2021/01/08.
//

import Foundation
import UIKit

class WineViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var wineSearchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        wineSearchBar.text = ''
        wineSearchBar.showsCancelButton = true
        wineSearchBar.placeholder = "와인 이름으로 검색해주세요"
        wineSearchBar.delegate = self
    }
    
//    func searchDisplayControllerWillBeginSearch(controller: UISearchDisplayController) {
//        self.searchDisplayController?.searchBar.showsCancelButton = true
//        var cancelButton: UIButton
//        var topView: UIView = self.searchDisplayController?.searchBar.subviews[0] as UIView
//        for subView in topView.subviews {
//            if subView.isKindOfClass(NSClassFromString("UINavigationButton")) {
//                cancelButton = subView as UIButton
//                cancelButton.setTitle("Vazgeç", forState: UIControlState.Normal)
//            }
//        }
//    }

        
}   
