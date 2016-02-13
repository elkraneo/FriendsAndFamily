//
//  RandomUserClient.swift
//  FriendsAndFamily
//
//  Created by Cristian Diaz on 13/02/16.
//  Copyright © 2016 metodowhite. All rights reserved.
//

import Foundation
import Alamofire
import Freddy

struct RandomUserClient {
	
	let serviceURL = "http://api.randomuser.me/"
	
	func fetchUsers(limit limit: Int) {
		Alamofire.request(.GET, serviceURL, parameters: ["results": limit])
			.responseJSON { response in
				
				guard let JSONData = response.data else {
					return
				}
				
				do {
					let personList =  try PersonList(json: JSON(data: JSONData))
					print(personList.results.count)
					
				} catch {
					return
				}
		}
	}
}


public struct PersonList {
	public let nationality: String
	public let results: Array<JSON>
	public let version: String
}

extension PersonList: JSONDecodable {
	public init(json value: JSON) throws {
		nationality = try value.string("nationality")
		results = try value.array("results")
		version = try value.string("version")
	}
}