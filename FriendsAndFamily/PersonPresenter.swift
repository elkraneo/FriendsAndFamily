//
//  PersonPresenter.swift
//  FriendsAndFamily
//
//  Created by Cristian Diaz on 13/02/16.
//  Copyright © 2016 metodowhite. All rights reserved.
//

import Foundation
import RxSwift

struct PersonPresenter {
	
	let testAPIClient = RandomUserClient()
	
	func fetchUser(gender gender: String) -> Observable<[String]> {
		return testAPIClient.fetchUser(gender: gender)
			.flatMap { persons -> Observable<[String]> in
				let filteredPersons = persons.map { person in
					return person.username
				}
				
				return Observable.of(filteredPersons)
		}
	}
}
