//
//  RegisterPasswordViewController.swift
//  nanamatch_v1.0
//
//  Created by Miguel Tomairo on 6/11/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class RegisterPasswordViewController: UIViewController {

    @IBOutlet weak var imgAppLogo: UIImageView!
    @IBOutlet weak var lblAppTitle: UILabel!
    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewForm: UIView!
    
    @IBOutlet weak var loadingRegister: UIActivityIndicatorView!
    @IBOutlet weak var btnRegister: UIButton!
    
    var username: String!
    var password: String!
    
    var mainValueCenterConstraint: CGFloat?
    
    @IBAction func tapCloseKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    //Keyboard stuff
    @objc func keyboardWillShown(notificacion : NSNotification) -> Void{
        let keyboardSize = (notificacion.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        
        let finalForm = self.viewForm.frame.size.height / 2 + self.mainValueCenterConstraint!
        
        let screenSize = UIScreen.main.bounds.size.height / 2
        let areaAvailable = screenSize - (keyboardSize?.height)!
        
        if finalForm > areaAvailable {
            
            UIView.animate(withDuration: 0.35, animations: {
                
                self.centerConstraint.constant = self.mainValueCenterConstraint! - (finalForm - areaAvailable) - 2
                
                self.imgAppLogo.transform = CGAffineTransform(scaleX: 0.84, y: 0.84)
                self.lblAppTitle.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func keyboardWillBeHidden(notification : NSNotification) -> Void {
        
        UIView.animate(withDuration: 0.35, animations: {
            self.imgAppLogo.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.lblAppTitle.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.centerConstraint.constant = self.mainValueCenterConstraint!
            self.view.layoutIfNeeded()
        })
    }
    
    //Shake
    func shake(duration: TimeInterval = 0.5, xValue: CGFloat = 12, yValue: CGFloat = 0) {
        self.txtPassword.transform = CGAffineTransform(translationX: 15, y: 0)
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.txtPassword.transform = CGAffineTransform.identity
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblUsername.text = self.username
        
        //Main value of center constraint
        self.mainValueCenterConstraint = self.centerConstraint.constant
        //NavBar appearance
        Util.navbarAppearance((self.navigationController?.navigationBar)!)
        
        self.txtPassword.autocorrectionType = .no
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnRegistrar(_ sender: Any) {
        
        self.password = self.txtPassword.text ?? ""
        
        if validateIsCorrect(self.password) {
            self.loadingRegister.startAnimating()
            self.btnRegister.isEnabled = false
            
            UserBL.register(self.username, password: self.password) { (status) in
                
                if status == 0 { // Correct
                    self.loadingRegister.stopAnimating()
                    self.btnRegister.isEnabled = true
                    
                    let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
                self.navigationController!.popToViewController(viewControllers[0], animated: true)
                } else { // Failed
                    self.loadingRegister.stopAnimating()
                    self.btnRegister.isEnabled = true
                    
                    self.present(AppMessage.messagePopup(title: "Register failed", message: "The username already exists."), animated: true, completion: nil)
                }
            }
        } else {
            self.shake()
        }
    }
    
    
    func validateIsCorrect(_ input: String) -> Bool {
        
        if !input.isEmpty && input.index(of: " ") == nil {
            return true
        } else {
            return false
        }
        
    }
    //Appear & disappear
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShown(notificacion:)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: .UIKeyboardWillHide, object: nil)
        super.viewWillAppear(animated)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self)
        super.viewWillDisappear(animated)
    }

}
