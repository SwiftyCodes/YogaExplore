//
//  ViewController.swift
//  YogaExplore
//
//  Created by Anurag Kashyap on 07/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var roundedTabView : UIView!
  
    var yogaViewController: UIViewController!
    var chatsViewController: UIViewController!
    var articlesViewController: UIViewController!
    var settingsViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundedTabView.roundedTabView(view: roundedTabView)
        roundedTabView.dropShadow(view: roundedTabView)
        
        intialSetupForControllers()
        buttons[selectedIndex].isSelected = true
        didPressTabButtons(buttons[selectedIndex])
    }
    
    func intialSetupForControllers() {
        yogaViewController = storyboard?.instantiateViewController(withIdentifier: "YogaViewController") as? YogaViewController
        chatsViewController = storyboard?.instantiateViewController(withIdentifier: "ChatsViewController") as? ChatsViewController
        articlesViewController = storyboard?.instantiateViewController(withIdentifier: "ArticlesViewController") as? ArticlesViewController
        settingsViewController = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
        
        viewControllers = [yogaViewController, chatsViewController, articlesViewController, settingsViewController]
        
    }
    
    @IBAction func didPressTabButtons(_ sender: UIButton) {
        
        let previousIndex = selectedIndex //Keeping previous tag
        selectedIndex = sender.tag //Assigning current tag
        
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        sender.isSelected = true
        let currentVC = viewControllers[selectedIndex]
        addChild(currentVC)
        
        currentVC.view.frame = self.contentView.bounds
        self.contentView.addSubview(currentVC.view)
        
        currentVC.viewDidAppear(true)
        currentVC.didMove(toParent: self)
    }
    
}

extension UIView {
    
    func roundedTabView(view:UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 55
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func roundedImageView(view:UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 55
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
   
    func dropShadow(view:UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset =  CGSize.zero
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
     }
}
