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
		
		// Define the URL
		// Create the HTTP request
		// Define the request method (GET / POST / PUT / DELETE)
		// Define the HTTP Header (Only for POST and PUT)
		// Define the HTTP Body (What to POST / PUT)
		// Execute the request
		
		let url = URL(string: Helper.BASE_URL)
		var request = URLRequest(url: url!)
		request.httpMethod = "POST"
		
		request.allHTTPHeaderFields = ["Content-Type" : "application/json"]
		
		request.httpBody = try! JSONSerialization.data(withJSONObject: [
			"author" : author,
			"content" : content
		])
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			DispatchQueue.main.async {
				self.performSegue(withIdentifier: "unwindToHomeSegue", sender: self)
			}
		}.resume()
		
        
    }
    

}
