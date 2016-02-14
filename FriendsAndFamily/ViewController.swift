//
//  ViewController.swift
//  FriendsAndFamily
//
//  Created by Cristian Diaz on 13/02/16.
//  Copyright © 2016 metodowhite. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
	
	let presenter = PersonPresenter()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		_ = presenter.fetchUser(gender: "female")
			.subscribe( { event in
				print(event)
			})
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

