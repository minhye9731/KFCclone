//
//  MenuViewController.swift
//  KFCclone
//
//  Created by 강민혜 on 5/27/22.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menu1: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        
        menu1.addGestureRecognizer(gestureRecognizer)
        menu1.isUserInteractionEnabled = true
    }
    
    @objc func gestureFired(_ gesture: UITapGestureRecognizer) {
        let cartViewController = self.storyboard?.instantiateViewController(identifier: "CartVC") as! CartVC
                
        self.present(cartViewController, animated: true, completion: nil)
        
    }


}
