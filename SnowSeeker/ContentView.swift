//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Justin Hold on 11/25/22.
//

import SwiftUI

// MARK: PHONE ONLY NAV VIEW EXTENSION
extension View {
	@ViewBuilder func phoneOnlyNavigationView() -> some View {
		if UIDevice.current.userInterfaceIdiom == .phone {
			self.navigationViewStyle(.stack)
		} else {
			self
		}
	}
}

enum SortType {
	case `default`, alphabetical, country
}

struct ContentView: View {
	
	@StateObject var favorites = Favorites()
	@State private var searchText = ""
	
	@State private var sortType = SortType.default
	@State private var showingSortOptions = false
	
	let resorts: [Resort] = Bundle.main.decode("resorts.json")
	
    var body: some View {
		
		NavigationView {
			
			List(sortedResults) { resort in
				
				NavigationLink {
					
					ResortView(resort: resort)
					
				} label: {
					HStack {
						Image(resort.country)
							.resizable()
							.scaledToFit()
							.frame(width: 40, height: 25)
							.clipShape(RoundedRectangle(cornerRadius: 5))
							.overlay(RoundedRectangle(cornerRadius: 5)
								.stroke(.black, lineWidth: 1))
						
						VStack(alignment: .leading) {
							
							Text(resort.name)
								.font(.headline)
							
							Text("\(resort.runs) runs")
								.foregroundColor(.secondary)
						}
						
						if favorites.contains(resort) {
							Spacer()
							Image(systemName: "heart.fill")
								.accessibilityLabel("This is a favorited resort")
								.foregroundColor(.red)
						}
					}
				}
			}
			.navigationTitle("Resorts")
			.searchable(text: $searchText, prompt: "Search for a resort")
			.toolbar {
				Button {
					showingSortOptions = true
				} label: {
					Label("Change sort order", systemImage: "arrow.up.arrow.down")
				}
			}
			.confirmationDialog("Sort Order", isPresented: $showingSortOptions) {
				Button("Default") { sortType = .default }
				Button("Alphabetical") { sortType = .alphabetical }
				Button("By Country") { sortType = .country }
			}
			
			WelcomeView()
			
		}
		.environmentObject(favorites)
//		.phoneOnlyNavigationView()
	}
	var filteredResorts: [Resort] {
		if searchText.isEmpty {
			return resorts
		} else {
			return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
		}
	}
	var sortedResults: [Resort] {
		switch sortType {
		case .default:
			return filteredResorts
		case .alphabetical:
			return filteredResorts.sorted { $0.name < $1.name }
		case .country:
			return filteredResorts.sorted { $0.country < $1.country }
		}
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
