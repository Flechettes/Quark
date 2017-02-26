//
//  TextViewController.swift
//  Quark
//
//  Created by Jose Canizares on 2/25/17.
//  Copyright © 2017 Flechettes. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    let textView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupTextEditor()
    }
    
    func setupTextEditor() {
        textView.backgroundColor = .yellow
//        textView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    

}
