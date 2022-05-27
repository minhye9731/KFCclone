//
//  OrderViewController.swift
//  KFCclone
//
//  Created by 강민혜 on 5/27/22.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var addressResultLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var requestTextField: UITextField!
    
    var result : String? = "배달받을 주소 입력값"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressResultLabel.text = result
        phoneNumberTextField.placeholder = "전화번호 입력"
        phoneNumberTextField.keyboardType = UIKeyboardType.numberPad
        requestTextField.placeholder = "요청사항 입력: 예) 집 앞에서 전화주세요"
        requestTextField.autocorrectionType = .no
        requestTextField.returnKeyType = .done
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if phoneNumberTextField.text != "", requestTextField.text != "" {
            requestTextField.resignFirstResponder()
            return true

             // 두번째 텍스트필드로 넘어가도록
        } else if phoneNumberTextField.text != "" {
            requestTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    

    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        print("주문하신 메뉴의 결제가 완료되었습니다.^^")
    }
    

}
