//
//  SignInTextFieldView.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/02/07.
//

import UIKit

import SnapKit
import Then

final class SignInTextFieldView: UIView {
    
    // MARK: - UI Components
    
    private let signTextField = UITextField()
    private let underLineView = UIView()
    
    // MARK: - Properties
    
    private var textFieldValue: String
    private var textHidden: Bool
    
    // MARK: - Initializer
    
    init(frame: CGRect, textFieldValue: String, textHidden: Bool) {
        self.textFieldValue = textFieldValue
        self.textHidden = textHidden
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignInTextFieldView {
    
    // MARK: - UIComponents Propertys
    
    private func setUI() {
        backgroundColor = .clear
        
        signTextField.do {
            $0.placeholder = textFieldValue
            $0.font = .systemFont(ofSize: 17, weight: .medium)
            $0.textColor = .systemGray2
            $0.isSecureTextEntry = textHidden
        }
        
        underLineView.do {
            $0.backgroundColor = .systemGray3
        }
    }
    
    // MARK: - Layout Helper
    
    func setLayout() {
        addSubviews(signTextField, underLineView)
        
        signTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(21)
            $0.trailing.equalToSuperview().inset(21)
            $0.height.equalTo(49)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(signTextField.snp.bottom)
            $0.leading.trailing.equalTo(signTextField)
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Methods
    
    func passTextFieldValue() -> String? {
        let text = signTextField.text
        return text
    }
    
    private func setDelegate() {
        signTextField.delegate = self
    }
}

extension SignInTextFieldView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        signTextField.textColor = .black
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        underLineView.backgroundColor = .black
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        underLineView.backgroundColor = .black
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let text = signTextField.text
        if text == "" {
            underLineView.backgroundColor = .systemGray3
        }
        return true
    }
}
