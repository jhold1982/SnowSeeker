//
//  Facility.swift
//  SnowSeeker
//
//  Created by Justin Hold on 11/26/22.
//

import SwiftUI

struct Facility: Identifiable {
	let id = UUID()
	var name: String
	
	private let icons = [
		"Accomodations": "house",
		"Beginners": "1.circle",
		"Cross-Country": "map",
		"Eco-Friendly": "leaf.arrow.circlepath",
		"Family": "person.3"
	]
	
	
	var icon: some View {
		if let iconName = icons[name] {
			return Image(systemName: iconName)
				.accessibilityLabel(name)
				.foregroundColor(.secondary)
		} else {
			fatalError("Uknown facility type: \(name)")
		}
	}
}
