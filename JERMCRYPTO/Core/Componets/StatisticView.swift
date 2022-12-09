//
//  StatisticView.swift
//  JERMCRYPTO
//
//  Created by Apple on 21/10/2022.
//

import SwiftUI

struct StatisticView: View {
    let stat: StatisticModel
    var body: some View {
        VStack(alignment:.leading, spacing: 4){
            Text(stat.title)
                .font(.caption)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(.black)
            HStack{
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0 ) >= 0 ? 0 : 180))
            Text(stat.percentageChange?.aspercenttring() ?? "")
                .font(.caption)
                .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0 ) >= 0 ? Color.green : Color.red)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
        StatisticView(stat:dev.stat1)
                .previewLayout(.sizeThatFits)
            StatisticView(stat:dev.stat2)
                .previewLayout(.sizeThatFits)
            StatisticView(stat:dev.stat3)
                .previewLayout(.sizeThatFits)
        }
    }
}
