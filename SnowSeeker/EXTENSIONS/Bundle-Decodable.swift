//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Justin Hold on 11/25/22.
//

import Foundation

extension Bundle {
	func decode<T: Decodable>(_ file: String) -> T {
		guard let url = self.url(forResource: file, withExtension: nil) else {
			fatalError("Failed to locate \(file) in app bundle.")
		}
		guard let data = try? Data(contentsOf: url) else {
			fatalError("Failed to load \(file) from app bundle.")
		}
		let decoder = JSONDecoder()
		guard let loaded = try? decoder.decode(T.self, from: data) else {
			fatalError("Failed to decode \(file) from app bundle.")
		}
		return loaded
	}
}
