//
//  ViewController.swift
//  TSample
//
//  Created by Wonyoung on 27/11/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let text:UILabel = UILabel()
    let password:UITextField = UITextField()
    let button:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initContainer()
        initCenterLabel()
        initBottomButton()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initTopBar()
        super.viewWillAppear(animated)
    }
    
    func initTopBar() {
        self.navigationController?.setNavigationBarHidden(true, animated:false)
    }
    
    func initContainer() {
        let containerView = UIView()
        containerView.frame = UIScreen.main.bounds
        containerView.backgroundColor = .red
        self.view.addSubview(containerView)
    }
    
    func initCenterLabel() {
        text.text = "TYPE YOUR PASSWORD."
        text.textColor = .white
        text.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        text.textAlignment = NSTextAlignment.left
        self.view.addSubview(text)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.centerYAnchor.constraint(equalTo:self.view.centerYAnchor).isActive = true
        
        let margins = view.layoutMarginsGuide
        text.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0.0).isActive = true
        
        password.font = UIFont.systemFont(ofSize: 20.0)
        password.isSecureTextEntry = true // password
        password.textContentType = UITextContentType.password
        password.backgroundColor = .white
        password.delegate = self
        self.view.addSubview(password)
        password.translatesAutoresizingMaskIntoConstraints = false
        
        password.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 10.0).isActive = true
        password.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        password.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    }
    
    func initBottomButton() {
        button.setTitle("CLICK ME!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(btnClickedToCollectionView), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        button.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10.0).isActive = true
        button.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10.0).isActive = true
        button.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20.0).isActive = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1.0/5.0).isActive = true
        // comment: height = (multiplier) * widthAnchor + constraint, and widthAnchor has already set with leading and trailing.
    }
    
    @objc func btnClicked() {
        goToNextViewController()
    }
    
    
    @objc func btnClickedToCollectionView() {
        let nextVc = CollectionViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    private func goToNextViewController() {
        // present a modal with an embed UINavigationController
        let rvc = SecondViewController()
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    func hideKeyboardWhenTappedAround() {
        print("hideKeyboardWhenTappedAround")
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) ->Bool {
        textField.resignFirstResponder()
        return true
    }
}
