//
//  AppAccessPopupViewController.swift
//  KFCclone
//
//  Created by 강민혜 on 5/24/22.
//

import UIKit

class AppAccessPopupViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func appAccessTapped(_ sender: UIButton) {
        print("앱 접근 권한 허용이 확인되었습니다.")
        self.view.removeFromSuperview()
    }

}
