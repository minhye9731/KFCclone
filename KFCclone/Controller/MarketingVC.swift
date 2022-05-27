//
//  MarketingVC.swift
//  KFCclone
//
//  Created by 강민혜 on 5/25/22.
//

import UIKit

class MarketingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func noMarketing(_ sender: UIButton) {
        print("마케팅 수신동의를 설정하지 않습니다.")
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func yesMarketing(_ sender: UIButton) {
        print("'설정'화면으로 이동하여 마케팅 수신동의를 설정합니다.")
    }
    
    
    
}
