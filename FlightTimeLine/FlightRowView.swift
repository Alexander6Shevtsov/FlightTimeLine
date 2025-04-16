//
//  FlightRowView.swift
//  FlightTimeLine
//
//  Created by Alexander Shevtsov on 15.04.2025.
//

import SwiftUI

struct FlightRowView: View {
    let flight: FlightInformation
    
    var body: some View {
        HStack {
            Text("\(flight.airline) \(flight.number)")
                .frame(width: 120, alignment: .leading) // размер, по лев краю
            Text(flight.otherAirport)
                .frame(alignment: .leading)
            
            Spacer()
            
            Text(flight.flightStatus)
        }
    }
}

#Preview {
    FlightRowView(flight: FlightInformation.generateFlight())
}
