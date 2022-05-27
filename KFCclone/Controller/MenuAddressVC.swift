//
//  MenuAddressVC.swift
//  KFCclone
//
//  Created by 강민혜 on 5/27/22.
//

import UIKit

class MenuAddressVC: UIViewController {

    
    @IBOutlet weak var yourView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        if let MenuVC = self.storyboard?.instantiateViewController(identifier: "MenuViewController") {
            self.navigationController?.pushViewController(MenuVC, animated: true)
        }
    }
    
    @IBAction func addressButtonTapped(_ sender: UIButton) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != self.yourView {
            dismiss(animated: true, completion: nil)
        }
    }
  

}
