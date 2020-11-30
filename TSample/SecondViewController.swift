//
//  SecondViewController.swift
//  TSample
//
//  Created by Wonyoung on 29/11/20.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // disabling edge gesture to navigate back
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        // make navigationbar hidden
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // bar color to black
        self.navigationController?.navigationBar.barTintColor = .black
        // removing traslucent layer
        self.navigationController?.navigationBar.isTranslucent = false
        // back button title to nil
        self.navigationController?.navigationBar.backItem?.backButtonTitle = ""
        // bar item color (arrow)
        self.navigationController?.navigationBar.tintColor = .white
        // changing status bar color to black
        self.navigationController?.navigationBar.barStyle = .black
        
        
        self.view.backgroundColor = .black
        initBottomButton()
    }
    
    func initBottomButton() {
        // Button test
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Bottom Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(dynamicTopBarColor), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let margin = view.layoutMarginsGuide
        button.leadingAnchor.constraint(equalTo:margin.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: margin.bottomAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1.0/5.0).isActive = true
    }
    
    @objc
    private func dynamicTopBarColor() {
        if(self.navigationController?.navigationBar.tintColor == .blue) {
            self.navigationController?.navigationBar.tintColor = .white
        } else {
            self.navigationController?.navigationBar.tintColor = .blue
        }
    }
}
