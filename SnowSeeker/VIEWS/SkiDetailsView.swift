//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Justin Hold on 11/25/22.
//

import SwiftUI

struct SkiDetailsView: View {
	
	let resort: Resort
	
    var body: some View {
		
		// MARK: "GROUP" IS A TRANSPARENT LAYOUT CONTAINER
		Group {
			VStack {
				Text("Elevation")
					.font(.caption.bold())
				Text("\(resort.elevation)m")
					.font(.title3)
			}
			VStack {
				Text("Snow")
					.font(.caption.bold())
				Text("\(resort.snowDepth)cm")
					.font(.title3)
			}
		}
		.frame(maxWidth: .infinity)
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
		SkiDetailsView(resort: Resort.example)
    }
}
