//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Justin Hold on 11/26/22.
//

import Foundation

class Favorites: ObservableObject {
	private var resorts: Set<String>
	private let saveKey = "Favorites"
	
	init() {
		// load saved data
		resorts = []
	}
	func contains(_ resort: Resort) -> Bool {
		resorts.contains(resort.id)
	}
	func add(_ resort: Resort) {
		objectWillChange.send()
		resorts.insert(resort.id)
		save()
	}
	func remove(_ resort: Resort) {
		objectWillChange.send()
		resorts.remove(resort.id)
		save()
	}
	func save() {
		// write out data
	}
}