import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct WBWidgetEntryView: View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)
            switch widgetFamily {
            case .systemSmall:
                smallWidgetView
                    .padding()
            case .systemMedium:
                mediumWidgetView
                    .padding()
            case .systemLarge:
                largeWidgetView
                    .padding()
            default:
                smallWidgetView
                    .padding()
            }
        }
    }
    
    // Вид для маленького виджета
    private var smallWidgetView: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
            ForEach(contactSample.filter { $0.status }.prefix(4)) { contact in
                contactAvatarView(contact: contact)
            }
        }
    }
    
    // Вид для среднего виджета
    private var mediumWidgetView: some View {
        VStack(alignment: .leading) {
            ForEach(contactSample.filter { $0.status }.prefix(2)) { contact in
                HStack(alignment: .top, spacing: 10) {
                    contactAvatarView(contact: contact)
                    VStack(alignment: .leading) {
                        Text(contact.name)
                            .bold().font(.system(size: 14))
                            .padding(.vertical, 1)
                        Text("Online")
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                }
            }
        }
    }
    
    // Вид для большого виджета
    private var largeWidgetView: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(contactSample.prefix(5)) { contact in
                HStack(alignment: .top, spacing: 10) {
                    contactAvatarView(contact: contact)
                    VStack(alignment: .leading) {
                        Text(contact.name)
                            .bold().font(.system(size: 14))
                            .padding(.vertical, 1)
                        Text(contact.status ? "Online" : contact.lastOnline?.lastOnlineAgo() ?? "")
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                }
            }
        }
    }
    
    // Вид аватарки контакта
    @ViewBuilder
    private func contactAvatarView(contact: Contacts) -> some View {
        Group {
            if let imageName = contact.avatar {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .cornerRadius(16)
                    .padding(2)
                    .overlay(StoryOverlay(contact: contact))
                    .overlay(StatusOverlay(contact: contact))
            } else {
                Text(contact.initials())
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .frame(width: 48, height: 48)
                    .background(Color("avatarColor"))
                    .cornerRadius(16)
                    .padding(2)
                    .overlay(StoryOverlay(contact: contact))
                    .overlay(StatusOverlay(contact: contact))
            }
        }
        .widgetURL(URL(string: "myapp://profile/\(contact.id.uuidString)"))
    }
}

struct WBWidget: Widget {
    let kind: String = "WBWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WBWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WBWidget_Previews: PreviewProvider {
    static var previews: some View {
        WBWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
