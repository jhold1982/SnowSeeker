//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Justin Hold on 11/25/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
		VStack {
			Text("Welcome to SnowSeeker!")
				.font(.largeTitle)
			
			Text("Please select a resort from the left hand menu. Do some swipe stuff with your finger.")
				.foregroundColor(.secondary)
		}
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
