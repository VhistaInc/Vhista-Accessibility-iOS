//
//  NewReviewTableViewController.swift
//  Accessibility
//
//  Created by Juan David Cruz Serrano on 12/8/18.
//  Copyright © 2018 Juan David Cruz Serrano. All rights reserved.
//

import UIKit

class NewReviewTableViewController: UITableViewController {
    
    
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var coverLabel: UILabel!
    
    
    @IBOutlet weak var appNameTextField: UITextField!
    @IBOutlet weak var appStoreLinkTextField: UITextField!
    
    @IBOutlet weak var accessibilityRatingSlider: UISlider!
    @IBOutlet weak var positiveFeedbackTextField: UITextField!
    @IBOutlet weak var improvementsTextField: UITextField!
    @IBOutlet weak var accessibilityFeedbackTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var subscriptionSwitch: UISwitch!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpObservers()
        setUpTableView()
    }
    
    func setUpObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(changedTextSize), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    deinit {
        removeObservers()
    }

}

extension NewReviewTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if appNameTextField.isFirstResponder {
            appStoreLinkTextField.becomeFirstResponder()
        } else if appStoreLinkTextField.isFirstResponder {
            positiveFeedbackTextField.becomeFirstResponder()
        } else if positiveFeedbackTextField.isFirstResponder {
            improvementsTextField.becomeFirstResponder()
        } else if improvementsTextField.isFirstResponder {
            accessibilityFeedbackTextField.becomeFirstResponder()
        } else if accessibilityFeedbackTextField.isFirstResponder {
            emailTextField.becomeFirstResponder()
        } else if emailTextField.isFirstResponder {
            self.view.endEditing(true)
        }
        
        return true
    }
    
}

extension NewReviewTableViewController {
    
    @objc func changedTextSize() {
        setUpTableView()
    }
    
    func setUpTableView() {
        coverView.frame.size = CGSize(width: coverView.frame.size.width, height: coverLabel.requiredHeight + 40)
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
}
