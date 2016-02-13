//
//  PersonPresenter.swift
//  FriendsAndFamily
//
//  Created by Cristian Diaz on 13/02/16.
//  Copyright © 2016 metodowhite. All rights reserved.
//

import Foundation

protocol UserPresentable {
	func userDidUpdate(users: [Person])
}

struct PersonPresenter: UserPresentable {
	
	func userDidUpdate(users: [Person]) {
		print("gender: \(users)")
		
	}

}