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
		"Accommodation": "house",
		"Beginners": "1.circle",
		"Cross-country": "map",
		"Eco-friendly": "leaf.arrow.circlepath",
		"Family": "person.3"
	]
	
	private let descriptions = [
		"Accommodation": "This resort has popular on-site accommodations.",
		"Beginners": "This resort has many beginner friendly ski schools.",
		"Cross-country": "This resort has several cross-country routes.",
		"Eco-friendly": "This resort is carbon neutral.",
		"Family": "This resort is popular with families with kids."
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
	var description: String {
		if let message = descriptions[name] {
			return message
		} else {
			fatalError("Uknown facility type: \(name)")
		}
	}
}
