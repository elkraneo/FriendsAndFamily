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
	public let name: String
	public let age: Int
	public let spouse: Bool
}

extension Person: JSONDecodable {
	public init(json value: JSON) throws {
		name = try value.string("name")
		age = try value.int("age")
		spouse = try value.bool("spouse")
	}
}