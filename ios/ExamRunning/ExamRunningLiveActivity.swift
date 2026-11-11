//
//  ExamRunningLiveActivity.swift
//  ExamRunning
//
//  Created by Daniel Santana on 09/06/25.
//

import ActivityKit
import SwiftUI
import WidgetKit

struct LiveActivitiesAppAttributes: ActivityAttributes, Identifiable {
    public typealias LiveDeliveryData = ContentState  // don't forget to add this line, otherwise, live activity will not display it.

    public struct ContentState: Codable, Hashable {}

    var id = UUID()
}

let liveactivitiesTag = "group.biologix.liveactivities2"

struct ExamRunningLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivitiesAppAttributes.self) {
            context in
            
            let sharedDefault = UserDefaults(suiteName: liveactivitiesTag)!

            let title = sharedDefault.string(
                forKey: context.attributes.prefixedKey("title")
            )!
            let subTitle = sharedDefault.string(
                forKey: context.attributes.prefixedKey("subTitle")
            )!
            let logo = UIImage(
                contentsOfFile: sharedDefault.string(
                    forKey: context.attributes.prefixedKey("logo")
                ) ?? ""
            )
            let iconBodystar = UIImage(
                contentsOfFile: sharedDefault.string(
                    forKey: context.attributes.prefixedKey("iconBodystar")
                ) ?? ""
            )
            let iconOxistar = UIImage(
                contentsOfFile: sharedDefault.string(
                    forKey: context.attributes.prefixedKey("iconOxistar")
                ) ?? ""
            )
            let iconMic = UIImage(
                contentsOfFile: sharedDefault.string(
                    forKey: context.attributes.prefixedKey("iconMic")
                ) ?? ""
            )
            let startDateMilliseconds = Date(
                timeIntervalSince1970: sharedDefault.double(
                    forKey: context.attributes.prefixedKey("startDateMilliseconds")
                ) / 1000
            )

            let backgroundColor = Color(
                red: 10 / 255,
                green: 18 / 255,
                blue: 21 / 255
            )

            VStack(alignment: .leading) {
                // Header
                HStack {
                    if logo != nil {
                        Image(uiImage: logo!)
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    Text(title)
                        .font(.system(size: 12))
                        .foregroundColor(
                            Color(red: 0.89, green: 0.9, blue: 0.91)
                        )

                    Spacer()

                    // Top right icons
                    HStack(spacing: 4) {
                        if iconMic != nil {
                            Image(uiImage: iconMic!)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                        if iconBodystar != nil {
                            Image(uiImage: iconBodystar!)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                        if iconOxistar != nil {
                            Image(uiImage: iconOxistar!)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                    }
                    .font(.callout)
                    .foregroundColor(Color(red: 0.7, green: 0.75, blue: 0.76))
                }
                Divider()
                // Body
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(subTitle)
                            .font(.subheadline)
                            .foregroundColor(
                                Color(red: 0.95, green: 0.95, blue: 0.95)
                            )
                        Text(
                            timerInterval: startDateMilliseconds...Date.distantFuture,
                            countsDown: false
                        )
                        .font(.system(size: 33, weight: .bold))
                        .foregroundColor(.white)
                    }
                }
            }
            .padding(20)
            .activityBackgroundTint(backgroundColor)
        } dynamicIsland: { context in
            
            let sharedDefault = UserDefaults(suiteName: liveactivitiesTag)!

            let title = sharedDefault.string(
                forKey: context.attributes.prefixedKey("title")
            )!
            let logo = UIImage(
                contentsOfFile: sharedDefault.string(
                    forKey: context.attributes.prefixedKey("logo")
                )!
            )
            let iconBodystar = UIImage(
                contentsOfFile: sharedDefault.string(
                    forKey: context.attributes.prefixedKey("iconBodystar")
                )!
            )
            let iconOxistar = UIImage(
                contentsOfFile: sharedDefault.string(
                    forKey: context.attributes.prefixedKey("iconOxistar")
                )!
            )
            let iconMic = UIImage(
                contentsOfFile: sharedDefault.string(
                    forKey: context.attributes.prefixedKey("iconMic")
                )!
            )
            let startDateMilliseconds = Date(
                timeIntervalSince1970: sharedDefault.double(
                    forKey: context.attributes.prefixedKey("startDateMilliseconds")
                ) / 1000
            )

            let actionColor = Color(
                red: 0 / 255,
                green: 205 / 255,
                blue: 157 / 255
            )

            return DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    if logo != nil {
                        HStack(spacing: 8) {
                            Image(uiImage: logo!)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }.padding(8)
                    }
                }
                DynamicIslandExpandedRegion(.trailing) {
                    HStack(spacing: 4) {
                        if iconMic != nil {
                            Image(uiImage: iconMic!)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                        if iconBodystar != nil {
                            Image(uiImage: iconBodystar!)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                        if iconOxistar != nil {
                            Image(uiImage: iconOxistar!)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                    }
                    .padding(8)
                    .font(.callout)
                    .foregroundColor(Color(red: 0.7, green: 0.75, blue: 0.76))
                }

                DynamicIslandExpandedRegion(.bottom) {
                   
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.system(size: 12))
                            .foregroundColor(Color(red: 0.79, green: 0.83, blue: 0.84))
                            .padding(.leading, 8)
                        HStack(alignment: .bottom) {
                            Text(
                                timerInterval: startDateMilliseconds...Date.distantFuture,
                                countsDown: false
                            )
                            .font(.system(size: 33, weight: .bold))
                            .foregroundColor(.white)
                            
                        }.padding(8)
                    }
                }
            } compactLeading: {
                if logo != nil {
                    Image(uiImage: logo!)
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            } compactTrailing: {
                HStack(alignment: .center, spacing: 2.0) {
                    Text(
                        timerInterval: startDateMilliseconds...Date.distantFuture,
                        countsDown: false
                    )
                    .multilineTextAlignment(.center)
                    .frame(width: 50)
                    .monospacedDigit()
                    .font(.footnote)
                    .foregroundStyle(.white)
                }
            } minimal: {
                if logo != nil {
                    Image(uiImage: logo!)
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
            .widgetURL(URL(string: "la://br.com.biologix.dev/sleep-exam"))
            .keylineTint(actionColor)
        }
    }
}

extension LiveActivitiesAppAttributes {
    func prefixedKey(_ key: String) -> String {
        return "\(id)_\(key)"
    }
}
