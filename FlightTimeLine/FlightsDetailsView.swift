//
//  FlightsDetailsView.swift
//  FlightTimeLine
//
//  Created by Alexander Shevtsov on 16.04.2025.
//

import SwiftUI

struct FlightsDetailsView: View {
    let flight: FlightInformation
    
    var body: some View {
        VStack(alignment: .leading) { // выравниваем стек по левому краю
            HStack {
                Text("\(flight.airline) - Flifht \(flight.number)")
                    .font(.title)
                Spacer()
            }
            
            Text("\(flight.direction == .arrival ? "From: " : "To: ") \(flight.otherAirport)")
            Text(flight.flightStatus)
                .foregroundStyle(Color(flight.timelineColor)) // смена цвета
            Spacer()
        }
        .font(.headline)
        .padding()
    }
}

#Preview {
    FlightsDetailsView(flight: FlightInformation.generateFlight())
}
