//
//  ViewController.swift
//  TSample
//
//  Created by Wonyoung on 27/11/20.
//

import UIKit

class ViewController: UIViewController {

    let text:UILabel = UILabel()
    let button:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initCenterLabel()
        initBottomButton()
    }
    
    func initCenterLabel() {
        text.text = "Hello World"
        text.textColor = .darkGray
//        text.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        text.textAlignment = NSTextAlignment.center
        text.backgroundColor = .magenta
        self.view.addSubview(text)
        
        text.translatesAutoresizingMaskIntoConstraints = false
//        text.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
//        text.centerYAnchor.constraint(equalTo:self.view.centerYAnchor).isActive = true
        
        let margins = view.layoutMarginsGuide
        text.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        text.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true
        text.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0).isActive = true
        text.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0.0).isActive = true
    }
    
    func initBottomButton() {
        button.setTitle("CLICK ME!", for: .normal)
        button.setTitleColor(.magenta, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
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
        let newText = "Toru"
        if(text.text == "Hello World") {
            text.text = newText
        } else {
            text.text = "Hello World"
        }
        
    }
}

