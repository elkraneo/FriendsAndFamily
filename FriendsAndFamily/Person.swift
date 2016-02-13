//
//  Person.swift
//  FriendsAndFamily
//
//  Created by Cristian Diaz on 13/02/16.
//  Copyright © 2016 metodowhite. All rights reserved.
//

import Foundation
import Freddy

public struct Person {
	public let username: String
}

extension Person: JSONDecodable {
	public init(json value: JSON) throws {
		username = try value.string("username")
	}
}