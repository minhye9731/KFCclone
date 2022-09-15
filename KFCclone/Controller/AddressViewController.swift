//
//  AddressViewController.swift
//  KFCclone
//
//  Created by 강민혜 on 5/27/22.
//

import UIKit

class AddressViewController: UIViewController {

    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var orderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addressTextField.delegate = self
        
        makeUI()
    }
    
    func makeUI() {
        addressTextField.placeholder = "배달받을 주소 입력"
        addressTextField.keyboardType = UIKeyboardType.emailAddress
        addressTextField.becomeFirstResponder()
        addressTextField.autocorrectionType = .no
        addressTextField.returnKeyType = .done
        addressTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        orderButton.backgroundColor = .gray
        orderButton.isEnabled = false
        orderButton.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    }
    
    
    // MARK: - 주문하기 버튼 클릭시 데이터&화면 넘어가기 동작
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        // 버튼클릭시 데이터 전송 및 화면전환
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


// MARK: - 확장
extension AddressViewController: UITextFieldDelegate {
    
    // 텍스트란 입력시 주문하기 버튼 활성화
    @objc func textFieldEditingChanged(_ textField: UITextField) {
        // 한글자가 입력되었다면
        if addressTextField.text?.count == 1 {
            // 그 한글자가 스페이스바이면 아무것도 안친 상태로 돌려라
            if addressTextField.text?.first == " " {
                addressTextField.text = ""
                return
            }
        }
        guard
            let address = addressTextField.text, !address.isEmpty
        else {
            orderButton.isEnabled = false
            return
        }
        orderButton.backgroundColor = .red
        orderButton.isEnabled = true
    }
}
