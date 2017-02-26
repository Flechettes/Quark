//
//  TextViewController.swift
//  Quark
//
//  Created by Pujan Tandukar on 2/25/17.
//  Copyright © 2017 Flechettes. All rights reserved.
//

import UIKit
import Highlightr

class TextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white;
        view.addSubview(textView)
        setUpNavigationBar()
        setUpTextEditor()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    var textView: UITextView = {
       let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpTextEditor(){
        textView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 25, leftConstant: 25, bottomConstant: 25, rightConstant: 25, widthConstant: 25, heightConstant: 25)
        textView.font = .systemFont(ofSize: 26)
        
        textView.autocorrectionType = .no
        
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "paraiso-dark")
        let code = "let a = 1"
        // You can omit the second parameter to use automatic language detection.
        let highlightedCode = highlightr?.highlight(code, as: "swift", fastRender: true)
        textView.attributedText = highlightedCode
        
        let textStorage = CodeAttributedString()
        textStorage.language = "Swift"
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer(size: view.bounds.size)
        layoutManager.addTextContainer(textContainer)
        
        textView = UITextView(frame: self.view.frame, textContainer: textContainer)
        
    }
    
    func setUpNavigationBar(){
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "quark_logo"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        let homeButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(showHomeView))
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveFile))
        homeButton.tintColor = .gray
        saveButton.tintColor = .gray
        navigationItem.leftBarButtonItems = [homeButton]
        navigationItem.rightBarButtonItems = [saveButton]
    }
    
    func showHomeView() {
//        let newView = HomeViewController()
        navigationController?.popViewController(animated: true)
//        present(newView, animated: true)
    }
    
    func saveFile(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

