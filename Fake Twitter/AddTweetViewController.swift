//
//  AddTweetsViewController.swift
//  Fake Twitter
//
//  Created by Gregorius Albert on 10/05/22.
//

import UIKit

class AddTweetViewController: UIViewController {

    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.text = ""
        contentTextView.layer.borderColor = UIColor.gray.cgColor
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.cornerRadius = 5.0
    }
    

    @IBAction func post(_ sender: Any) {
        let author = authorTextField.text
        let content = contentTextView.text
       
		// TODO: Create POST Method to API (Create new Tweet)
		
        
    }
    

}
