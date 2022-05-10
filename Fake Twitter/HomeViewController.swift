//
//  ViewController.swift
//  Fake Twitter
//
//  Created by Gregorius Albert on 10/05/22.
//

import UIKit

class HomeViewController: UIViewController {
	
	var tweets = [Tweet]()
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		fetchFromAPI()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		fetchFromAPI()
		tableView.reloadData()
	}
	
	func fetchFromAPI() -> Void {
		let url = URL(string: Helper.BASE_URL)!
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		
		URLSession.shared.dataTask(with: request){ (data, response, error) in
			let json = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
			for result in json {
				let id = result["id"] as! Int
				let author = result["author"] as! String
				let content = result["content"] as! String
				let tweet = Tweet(id: id, author: author, content: content)
				self.tweets.append(tweet)
			}
			
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
			
		}.resume()
	}
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
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
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			//TODO: get ID
			//TODO: call delete
			//TODO: reload data
			
			
			
		}
	}
	
}

