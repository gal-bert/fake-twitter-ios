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
		
		let url = URL(string: "\(Helper.BASE_URL)/\(id!)")!
		var request = URLRequest(url: url)
		request.httpMethod = "PUT"
		
		request.allHTTPHeaderFields = [
			"Content-Type" : "application/json"
		]
		
		request.httpBody = try! JSONSerialization.data(withJSONObject: [
			"author": author,
			"content": content
		])
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			Helper.getNetworkResponse(data: data, response: response, error: error)
			
			let httpResponse = response as? HTTPURLResponse
			
			if httpResponse?.statusCode == 200 {
				DispatchQueue.main.async {
					self.performSegue(withIdentifier: "unwindToHomeSegue", sender: self)
				}
			} else {
				DispatchQueue.main.async {
					self.present(Helper.pushAlert(title: "Oops!", message: "Something is wrong with the server, please try again later!"), animated: true)
				}
			}
			
		}.resume()
		
    }
    
}
