//
//  HomeViewController.swift
//  Quark
//
//  Created by Pujan Tandukar on 2/25/17.
//  Copyright © 2017 Flechettes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(netHex: 0x0C0707)
        self.navigationController?.isNavigationBarHidden = true
        setUpUIView()
        
        let newProjectButton: UIButton = UIButton()
        newProjectButton.frame.size = CGSize(width: 200, height: 50)
        newProjectButton.backgroundColor = UIColor(netHex: 0x0C0707)
        newProjectButton.setTitle("Create New Project", for: .normal)
        newProjectButton.addTarget(self, action: #selector(showTextView), for: .touchUpInside)
        newProjectButton.tag = 1
        newProjectButton.center.x = self.view.center.x
        newProjectButton.center.y = self.view.center.y + 85
        self.view.addSubview(newProjectButton)
        
        let recentOpenProjectButton: UIButton = UIButton()
        recentOpenProjectButton.frame.size = CGSize(width: 200, height: 50)
        recentOpenProjectButton.backgroundColor = UIColor(netHex: 0x0C0707)
        recentOpenProjectButton.setTitle("Open Recent Project", for: .normal)
        recentOpenProjectButton.addTarget(self, action: #selector(showRecentFileView), for: .touchUpInside)
        recentOpenProjectButton.tag = 1
        recentOpenProjectButton.center.x = self.view.center.x
        recentOpenProjectButton.center.y = self.view.center.y + 130
        self.view.addSubview(recentOpenProjectButton)
        
        
        let quarkLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        quarkLabel.center.x = self.view.center.x
        quarkLabel.center.y = self.view.center.y - 0
        quarkLabel.textAlignment = .center
        quarkLabel.text = "Quark Text Editor"
        quarkLabel.textColor = UIColor(netHex: 0xFAFAFF)
        quarkLabel.font = UIFont(name: "Savoye Let", size: 40)
        view.addSubview(quarkLabel)
        
        let quarkLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        quarkLabel2.center.x = self.view.center.x
        quarkLabel2.center.y = self.view.center.y + 25
        quarkLabel2.textAlignment = .center
        quarkLabel2.text = "Version 1.0.0"
        quarkLabel2.textColor = UIColor(netHex: 0xFAFAFF)
        quarkLabel2.font = UIFont(name: "Savoye Let", size: 25)
        view.addSubview(quarkLabel2)
        
        
        
        let image: UIImage = UIImage(named: "quark_logo")!
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 400, height: 360)
        imageView.center.x = self.view.center.x
        imageView.center.y = self.view.center.y - 140
        imageView.tintColor = UIColor(netHex: 0xFAFAFF)
        view.addSubview(imageView)
        
    }
        // Do any additional setup after loading the view.
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    let homeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpButton(){
        homeView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func setUpUIView(){
        let newProjectButton = UIButton(type: .system)
        self.view.addSubview(newProjectButton)
        
    }
    
    func buttonAction(sender: UIButton!) {
        showTextView()
    }
    
    func showTextView() {
        let newView = TextViewController()
        navigationController?.pushViewController(newView, animated: true)
    }
    
    func showRecentFileView() {
        let newView = RecentFileViewController()
        navigationController?.pushViewController(newView, animated: true)
    }
//    
//    func hideNavBar(){
////        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.backgroundColor = .clear
//        navigationController?.navigationBar.barTintColor = .clear
////        navigationController?.navigationBar.isTranslucent = true
////        navigationController?.navigationBar.shadowImage = UIImage()
//    }
//    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
