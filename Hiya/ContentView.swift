//
//  ContentView.swift
//  Hiya
//
//  Created by Isaac Urbina on 1/15/26.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
	
	
	// MARK: - properties
	
	private var largeLanguageModel = SystemLanguageModel.default
	@State private var response: String = ""

	
	// MARK: - body
	
    var body: some View {
        VStack {
			switch largeLanguageModel.availability {
				case .available:
					Text(response)
				case .unavailable(.deviceNotEligible) :
					Text("Unavailable: Your device isn't eligible for Apple Inteligence.")
				case .unavailable(.appleIntelligenceNotEnabled) :
					Text("Unavailable: Please enable Apple Intelligence in Settings")
				case .unavailable(.modelNotReady) :
					Text("Unavailable: The AI model isn't ready")
				case .unavailable(let reason):
					Text("Unavailable: The AI feature is unavailable for an unknown reason: \(String(describing: reason))")
			}
        }
        .padding()
    }
}


// MARK: - preview

#Preview {
    ContentView()
}

