//
//  AddressViewController.swift
//  KFCclone
//
//  Created by 강민혜 on 5/27/22.
//

import UIKit

class AddressViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addressTextField.delegate = self
        
        addressTextField.placeholder = "배달받을 주소 입력"
        addressTextField.keyboardType = UIKeyboardType.emailAddress
        addressTextField.becomeFirstResponder()
        addressTextField.autocorrectionType = .no
        addressTextField.returnKeyType = .done
    }
    
    @IBAction func orderTapAction(_ sender: Any) {
        let addressData : String = addressTextField.text!
        let orderViewController = self.storyboard?.instantiateViewController(identifier: "OrderViewController") as! OrderViewController
        
        orderViewController.result = addressData
        
        self.present(orderViewController, animated: true, completion: nil)
    }
    
    // 공백란 클릭시 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addressTextField.resignFirstResponder()
    }
    
    // 엔터키 클릭시 키보드 내려감
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addressTextField.resignFirstResponder()
        return true
    }

}
