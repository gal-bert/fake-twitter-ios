//
//  Helper.swift
//  Fake Twitter
//
//  Created by Gregorius Albert on 10/05/22.
//

import Foundation
import UIKit

class Helper {
	
	static let BASE_URL = "https://fake-twitter.gregorius.id/api/tweets"
	
	static func pushAlert(title:String, message:String) -> UIAlertController {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		return alert
	}
	
	static func getNetworkResponse(data:Data?, response:URLResponse?, error:Error?) -> Void {
		print("Response: \(response as Any)\n")
		print("Error: \(error)\n")
		guard let data = data else { return }
		print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
	}
	
}
