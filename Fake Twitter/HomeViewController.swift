//
//  ViewController.swift
//  Fake Twitter
//
//  Created by Gregorius Albert on 10/05/22.
//

import UIKit

class HomeViewController: UIViewController {
	
	var tweets = [Tweet]()
	var selectedTweet:Tweet?
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		fetchFromAPI()
	}
	
	func fetchFromAPI() -> Void {
		tweets.removeAll()
		
		// TODO: Create GET Method to API (Get all Tweet)
		
		// Define the URL
		// Create the HTTP request
		// Define the request method (GET / POST / PUT / DELETE)
		
		let url = URL(string: Helper.BASE_URL)
		var request = URLRequest(url: url!)
		request.httpMethod = "GET"
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			let json = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
			
			for result in json {
				let tweet = Tweet(
					id: result["id"] as! Int,
					author: result["author"] as! String,
					content: result["content"] as! String
				)
				self.tweets.append(tweet)
			}
			
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
			
		}.resume()
		
		// Execute the request
		/// Get the JSON Object from the API and cast as array of [String:Any]
		/// Loop through the array and put into a model
		/// Append object to array
		/// Reload the tableview
		
	}
    
    @IBAction func refresh(_ sender: Any) {
        fetchFromAPI()
    }
    
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
    }
	
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
		let tweet = tweets[indexPath.row]
		cell.authorLabel.text = tweet.author
		cell.contentLabel.text = tweet.content
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tweets.count
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedTweet = tweets[indexPath.row]
		performSegue(withIdentifier: "toEditSegue", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "toEditSegue" {
			let dest = segue.destination as! EditTweetViewController
			dest.tweet = selectedTweet
		}
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			
			let id = tweets[indexPath.row].id

			// TODO: Create DELETE Method to API (Delete Tweet)
			
			// Define the URL
			// Create the HTTP request
			// Define the request method (GET / POST / PUT / DELETE)
			
			// Execute the request
			/// Refetch the data and Reload the tableview after deletion - fetchFromAPI()
			
			let url = URL(string: "\(Helper.BASE_URL)/\(id)")
			var request = URLRequest(url: url!)
			request.httpMethod = "DELETE"
			
			URLSession.shared.dataTask(with: request) { data, response, error in
				DispatchQueue.main.async {
					self.fetchFromAPI()
				}
			}.resume()
			
			
		}
	}
	
}

