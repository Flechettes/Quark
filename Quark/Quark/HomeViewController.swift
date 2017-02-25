//
//  ViewController.swift
//  Quark
//
//  Created by Pujan Tandukar on 2/25/17.
//  Copyright © 2017 Flechettes. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    let textView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textView)
        setUpNavigationBar()
        setUpTextEditor()
        
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "quark_logo"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        let homeButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(showHomeView))
        homeButton.tintColor = .gray
        navigationItem.leftBarButtonItems = [homeButton]
        
    }
    
    func showHomeView() {
        print("home view")
    }
    
    func setUpTextEditor() {
        textView.backgroundColor = .blue
        textView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

