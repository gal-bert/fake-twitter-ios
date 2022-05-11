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

			// TODO: Create DELETE Method to API (Delete Tweet)
			
		}
	}
	
}

