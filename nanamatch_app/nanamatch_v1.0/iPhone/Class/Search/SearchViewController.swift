//
//  ViewController.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 9/06/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, TabBarViewControllerDelegate{

    @IBOutlet weak var viewDetail: UIView!
    @IBOutlet weak var viewTabBar: UIView!
    
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!
    var centerConstraintValue : CGFloat?
    var yFromMainY : CGFloat = 0.0
    
    @IBOutlet weak var loadingVC: UIActivityIndicatorView!
    var objBE: UserBE!
    
    var centerConstraintDetailValue : CGFloat?
    
    var controllerDetailsNana: ViewDetailsNanaViewController?

    var selectedId = 0
    
    // swipe list nanas
    var pageViewController: UIPageViewController?
    var arrayNanas = [NanaBE]()
    
    func createPageViewController() -> Void{
        let pageController = self.storyboard?.instantiateViewController(withIdentifier: "pageVC") as! UIPageViewController
        pageController.dataSource = self
        pageController.delegate   = self
        
        if self.arrayNanas.count > 0 {
            let contentController = getContentViewController(withIndex: 0)
            let contentControllers = [contentController] as! [UIViewController]
            
            pageController.setViewControllers(contentControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        }
        
        pageViewController = pageController
        
        self.addChildViewController(pageViewController!)
        
        pageViewController?.view.bounds = self.view.bounds
        
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
        
        self.view.bringSubview(toFront: self.viewDetail)
        self.view.bringSubview(toFront: self.viewTabBar)
    }
    
    func getContentViewController(withIndex index: Int) -> ContentViewController? {
        if index < self.arrayNanas.count {
            let contentVC = self.storyboard?.instantiateViewController(withIdentifier: "contentVC") as! ContentViewController
            contentVC.itemIndex = index
            contentVC.objNana = self.arrayNanas[index]
            self.selectedId = index
            self.controllerDetailsNana?.objNana = self.arrayNanas[contentVC.itemIndex]
            return contentVC
        }
        
        return nil
    }
    
    
    // UIPageViewController
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! ContentViewController
        self.controllerDetailsNana?.objNana = self.arrayNanas[contentVC.itemIndex]
        if contentVC.itemIndex + 1 < self.arrayNanas.count {
            return getContentViewController(withIndex: contentVC.itemIndex + 1)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! ContentViewController
        self.controllerDetailsNana?.objNana = self.arrayNanas[contentVC.itemIndex]
        if contentVC.itemIndex > 0 {
            return getContentViewController(withIndex: contentVC.itemIndex - 1)
        }

        return nil
    }
    
    
    // Labels animation
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.controllerDetailsNana?.dismiss()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        self.controllerDetailsNana?.present()
    }
    
    
    //Translation action
    @objc func didPan(sender: UIPanGestureRecognizer) {
        
        let point = sender.translation(in: view)
        
        
        //Screen height
        let screenHeight : CGFloat = UIScreen.main.bounds.size.height
        
        //Main position
        let mainY = CGFloat((screenHeight/2 - 30)) //SE = 254
        
        //Max Y position
        let maxY  = CGFloat((screenHeight/2 - 106)) //SE = 178
        //let maxPosition = CGPoint(x: view.center.x, y: maxY)
        
        //Kinda like a margin to be reach
        let marginY = CGFloat((screenHeight/2 - 55)) //SE = 229
        
        
        //What happens when the DetailView gets moved
        
        if self.centerConstraint.constant >= maxY && self.centerConstraint.constant <= mainY{
            self.centerConstraint.constant = self.centerConstraintValue! + point.y
            self.controllerDetailsNana?.viewExtraInformation.alpha = (self.yFromMainY-point.y) / 76
        }
        
        if sender.state == UIGestureRecognizerState.ended {
            
            if self.centerConstraint.constant < marginY {
                UIView.animate(withDuration: 0.2, animations: {
                    self.yFromMainY = 76.0
                    self.controllerDetailsNana?.viewExtraInformation.alpha = self.yFromMainY / 76
                    self.centerConstraint.constant = maxY
                    self.centerConstraintValue! = self.centerConstraint.constant
                    self.view.layoutIfNeeded()
                })
            }
            if self.centerConstraint.constant > marginY {
                UIView.animate(withDuration: 0.2, animations: {
                    self.yFromMainY = 0
                    self.centerConstraint.constant = mainY
                    self.controllerDetailsNana?.viewExtraInformation.alpha = self.yFromMainY / 76
                    self.centerConstraintValue! = self.centerConstraint.constant
                    self.view.layoutIfNeeded()
                })
            }
            
        }
    }
    
    @IBOutlet weak var heightConstraintViewDetail: NSLayoutConstraint!
    @IBOutlet weak var centerConstraintViewDetail: NSLayoutConstraint!
    
    
    // More details nana transition
    func tabBarViewController(tabBarViewController: TabBarViewController, TransitionWillStart state: Bool) {
        
        performSegue(withIdentifier: "DetailsNanaViewController", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.controllerDetailsNana?.viewExtraInformation.alpha = 0
    Util.navbarAppearanceTransparent((self.navigationController?.navigationBar)!)
        
        self.loadingVC.startAnimating()
        
        self.centerConstraintValue = CGFloat((UIScreen.main.bounds.size.height/2 - 30))
        //print(UIScreen.main.bounds.size.height,"MIRA AQUI")
        self.centerConstraint.constant = self.centerConstraintValue!
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        
        viewDetail.isUserInteractionEnabled = true
        viewDetail.addGestureRecognizer(panGestureRecognizer)
        
        NanaBL.listNanas { (arrayResponse) in
            self.arrayNanas = arrayResponse
            self.createPageViewController()
            self.loadingVC.stopAnimating()
            self.selectedId = 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3, animations: {
            UIApplication.shared.statusBarView?.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.2)
            UIApplication.shared.statusBarStyle = .lightContent
            
            self.view.layoutIfNeeded()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewDetailsNanaViewController" {
            self.controllerDetailsNana = segue.destination as? ViewDetailsNanaViewController
        }
        
        if segue.identifier == "TabBarViewController" {
            let controllerTabBar = segue.destination as? TabBarViewController
            controllerTabBar?.delegate = self
        }
        
        if segue.identifier == "DetailsNanaViewController" {
            let controller = segue.destination as! DetailsNanaViewController
            controller.idNana = String(self.selectedId)
        }
    }
    
    @IBAction func unwindToSearchViewController(_ segue: UIStoryboardSegue){}
    
}

