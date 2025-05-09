//
//  FlightsDetailsView.swift
//  FlightTimeLine
//
//  Created by Alexander Shevtsov on 16.04.2025.
//

import SwiftUI

struct FlightsDetailsView: View {
    @Binding var isPresented: Bool
    let flight: FlightInformation
    
    var body: some View {
        VStack(alignment: .leading) { // выравниваем стек по левому краю
            HStack {
                Text("\(flight.airline) - Flifht \(flight.number)")
                    .font(.title)
                Spacer()
                Button("Done") {
                    isPresented.toggle()
                }
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
    FlightsDetailsView(isPresented: .constant(true), flight: FlightInformation.generateFlight())
}
