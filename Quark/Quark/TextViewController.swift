//
//  TextViewController.swift
//  Quark
//
//  Created by Pujan Tandukar on 2/25/17.
//  Copyright © 2017 Flechettes. All rights reserved.
//

import UIKit
import Highlightr

class TextViewController: UIViewController, UITextViewDelegate {
    
    var textView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.delegate = self
        view.backgroundColor = UIColor(netHex: 0x2A2D34);
        view.addSubview(textView)
        setUpNavigationBar()
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpTextEditor()
    }
    
    
    func setUpTextEditor(){
        textView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 25, leftConstant: 25, bottomConstant: 25, rightConstant: 25, widthConstant: 25, heightConstant: 25)
        textView.autocorrectionType = .no
        textView.font = .systemFont(ofSize: 26)
        textView.backgroundColor = UIColor(netHex: 0x2A2D34)
        
//        let textStorage = CodeAttributedString()
//        textStorage.language = "Swift"
//        let layoutManager = NSLayoutManager()
//        textStorage.addLayoutManager(layoutManager)
//        
//        let textContainer = NSTextContainer(size: view.bounds.size)
//        layoutManager.addTextContainer(textContainer)
        
        //        textView = QuarkTextView(frame: view.frame, textContainer: textContainer)
        

        
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

    func textViewDidChange(_ textView: UITextView) {
        print("typing")
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "atom-one-dark")
        // You can omit the second parameter to use automatic language detection.
        let highlightedCode = highlightr?.highlight(textView.text, as: "CSS", fastRender: true)
        textView.attributedText = highlightedCode
        textView.font = UIFont(
            name: "Menlo-Bold",
            size: 18.0)
    }

}

