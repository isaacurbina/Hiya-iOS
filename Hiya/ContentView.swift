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
	private var session = LanguageModelSession()
	
	@State private var response: String = ""

	
	// MARK: - body
	
    var body: some View {
        VStack {
			Spacer()
			
			switch largeLanguageModel.availability {
				case .available:
					Text(response)
					.multilineTextAlignment(.center)
					.font(.largeTitle)
					.bold()
				case .unavailable(.deviceNotEligible) :
					Text("Unavailable: Your device isn't eligible for Apple Inteligence.")
				case .unavailable(.appleIntelligenceNotEnabled) :
					Text("Unavailable: Please enable Apple Intelligence in Settings")
				case .unavailable(.modelNotReady) :
					Text("Unavailable: The AI model isn't ready")
				case .unavailable(let reason):
					Text("Unavailable: The AI feature is unavailable for an unknown reason: \(String(describing: reason))")
			}
			
			Spacer()
			
			Button {
				Task {
					let prompt = "Say hi in a fun way."
					
					do {
						let reply = try await session.respond(to: prompt)
						response = reply.content
					} catch {
						response = "Failed to get response: \(error.localizedDescription)"
					}
				}
			} label : {
				Text("Welcome")
					.font(.largeTitle)
					.padding()
			}
			.buttonStyle(.borderedProminent)
			.buttonSizing(.flexible)
			.glassEffect(.regular.interactive())
        }
        .padding()
		.tint(.purple)
    }
}


// MARK: - preview

#Preview {
    ContentView()
}

