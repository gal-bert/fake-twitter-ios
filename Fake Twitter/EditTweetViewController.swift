//
//  EditTweetViewController.swift
//  Fake Twitter
//
//  Created by Gregorius Albert on 10/05/22.
//

import UIKit

class EditTweetViewController: UIViewController {

    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
	
	var tweet:Tweet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorTextField.text = tweet?.author
        contentTextView.text = tweet?.content
		
		contentTextView.layer.borderColor = UIColor.gray.cgColor
		contentTextView.layer.borderWidth = 1.0
		contentTextView.layer.cornerRadius = 5.0
    }

    @IBAction func update(_ sender: Any) {
		let author = authorTextField.text
		let content = contentTextView.text
        
        let id = tweet?.id
		
		// TODO: Create PUT Method to API (Edit Tweet)
		
    }
    
}
