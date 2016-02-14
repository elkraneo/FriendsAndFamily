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
import RxSwift

struct RandomUserClient {
	
	typealias networkCallCompletion = (list: PersonList) -> ()
	let serviceURL = "http://api.randomuser.me/"
	let nationality = "ES"
	
	func fetchUsers(limit limit: Int, completion: networkCallCompletion) {
		Alamofire.request(.GET, serviceURL, parameters: ["results": limit, "nationality": nationality])
			.responseJSON { response in
				
				guard let JSONData = response.data else {
					return
				}
				
				do {
					let json = try JSON(data: JSONData)
					let personList = try PersonList(json: json)
					
					completion(list: personList)
					
				} catch {
					print("Error: \(error)")
					return
				}
		}
	}
	
	func fetchUser(named name: String) {
		self.fetchUsers(limit: 10) { (list) -> () in
			let users = list.results.filter { $0.username == name }
			print("named: \(users.first)")
		}
	}
	
	func fetchUser(gender gender: String) -> Observable<[Person]> {
		return Observable.create {o in
			self.fetchUsers(limit: 10) { (list) -> () in
				let users = list.results.filter { $0.gender == gender }
				
				o.onNext(users)
				o.onCompleted()
			}
			
			return NopDisposable.instance
		}
	}
}




public struct PersonList {
	public let nationality: String
	public let results: Array<Person>
	public let version: String
}

extension PersonList: JSONDecodable {
	public init(json value: JSON) throws {
		version = try value.string("version")
		nationality = try value.string("nationality")
		
		results = try value.array("results")
			.map{ try JSON($0.dictionary("user")) }
			.map(Person.init)
	}
}
