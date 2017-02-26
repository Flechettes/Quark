//
//  TextViewController.swift
//  Quark
//
//  Created by Pujan Tandukar on 2/25/17.
//  Copyright © 2017 Flechettes. All rights reserved.
//

import UIKit
import Highlightr
import AZDropdownMenu

class TextViewController: UIViewController, UITextViewDelegate {
    
    var textView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var selectedLanguage : String {
        //
        let language = "HTML"
        return language
        
    }
    
    var selectedFont: String {
        //Courier, Courier New, CourierNewPSMT, Courier-Bold, Menlo-Regular
        let font = "Menlo-Bold"
        return font
    }
    
    var selectedFontSize: CGFloat {
        let fontSize = 18.0
        return CGFloat(fontSize)
    }
    
    var Menu: AZDropdownMenu {
        let titles = ["HTML", "CSS", "JS", "Java", "Scala", "Swift"]
        let menu = AZDropdownMenu(titles: titles)
        menu.itemHeight = 40
        menu.itemFontName = "Futura"
        menu.itemFontColor = UIColor(netHex: 0xD5B0AC)
        menu.itemFontSize = 18.0
        menu.overlayAlpha = 0.0
        menu.overlayColor = UIColor(netHex:0x2A2D34)
        menu.menuSeparatorColor = UIColor(netHex: 0x684551)
        menu.itemAlignment = .center

        return menu
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.delegate = self
        view.backgroundColor = UIColor(netHex: 0x2A2D34);
        view.addSubview(textView)
        self.textView.addSubview(Menu)
        setUpNavigationBar()
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpTextEditor()
        self.Menu.cellTapHandler = { [weak self] (indexPath: IndexPath) -> Void in
            print(indexPath.item)
            print(indexPath.row)
            self?.textView.backgroundColor = .red
            print("drop down item selected")
            //            self?.textView.text = String(indexPath.count)
            //            self?.navigationController?.pushViewController(self!, animated:true)
        }
    }
    
    
    
    
    
    func setUpTextEditor(){
        textView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 25, leftConstant: 25, bottomConstant: 25, rightConstant: 25, widthConstant: 25, heightConstant: 25)
        textView.autocorrectionType = .no
        textView.font = .systemFont(ofSize: 26)
        textView.backgroundColor = UIColor(netHex: 0x2A2D34)
        textView.font = UIFont(name: selectedFont, size: selectedFontSize)
        
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
        self.Menu.hideMenu()
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
        
//        self.Menu.hideMenu()
//        self.Menu.itemFontName = "Futura"
//        self.Menu.itemFontColor = UIColor(netHex: 0xD5B0AC)
//        self.Menu.itemFontSize = 18.0
//        self.Menu.overlayAlpha = 0.2
//        self.Menu.overlayColor = .gray
//        self.Menu.menuSeparatorColor = UIColor(netHex: 0x684551)
//        self.Menu.itemAlignment = .center
        
        let dropdownButton = UIBarButtonItem(title: "Language", style: .plain, target: self, action: #selector(showDropdown))
        
        navigationItem.leftBarButtonItems = [homeButton, dropdownButton]
        navigationItem.rightBarButtonItems = [saveButton]
    }
    
    func showHomeView() {
//        let newView = HomeViewController()
        navigationController?.popViewController(animated: true)
//        present(newView, animated: true)
    }
    
    func showDropdown() {
        print("show drop down")
        
        if (self.Menu.isDescendant(of: self.textView) == true) {
            self.Menu.hideMenu()
        } else {
            self.Menu.showMenuFromView(self.textView)
        }
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
        let highlightedCode = highlightr?.highlight(textView.text, as: selectedLanguage, fastRender: true)
        textView.attributedText = highlightedCode
        textView.font = UIFont(
            name: selectedFont,
            size: selectedFontSize)
    }
}

