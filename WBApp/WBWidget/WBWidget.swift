import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), theme: .light)
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let theme = configuration.theme == .light ? ColorScheme.light : ColorScheme.dark
        let entry = SimpleEntry(date: Date(), configuration: configuration, theme: theme)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let theme = configuration.theme == .light ? ColorScheme.light : ColorScheme.dark
        var entries: [SimpleEntry] = []
        let currentDate = Date()
       
        
        if let contactID = configuration.contactID, UUID(uuidString: contactID) != nil {
            for hourOffset in stride(from: 0, to: 24, by: 3) {
                let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                let entry = SimpleEntry(date: entryDate, configuration: configuration, theme: theme)
                entries.append(entry)
            }
        } else {
            for hourOffset in stride(from: 0, to: 24, by: 3) {
                let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                let entry = SimpleEntry(date: entryDate, configuration: configuration, theme: theme)
                entries.append(entry)
            }
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}


struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let theme: ColorScheme
}

struct WBWidgetEntryView: View {
    @EnvironmentObject var contactStore: ContactStore
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)
                .environment(\.colorScheme, entry.theme)
            switch widgetFamily {
            case .systemSmall:
                SmallWidgetView(entry: entry)
                    .padding()
            case .systemMedium:
                MediumWidgetView(entry: entry)
                    .padding()
            case .systemLarge:
                LargeWidgetView(entry: entry)
                    .padding()
            default:
                SmallWidgetView(entry: entry)
                    .padding()
            }
        }
        .onOpenURL { url in
            handleURL(url)
        }
    }
    
    private func handleURL(_ url: URL) {
        
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        
        if url.scheme == "myapp" {
            
            if let contactID = components.path.components(separatedBy: "/").last,
               let id = UUID(uuidString: contactID) {
                contactStore.selectedContactID = id
            } else if let queryItems = components.queryItems {
                for queryItem in queryItems {
                    if queryItem.name == "contactID", let contactID = queryItem.value {
                        contactStore.selectedContactID = UUID(uuidString: contactID)
                        break
                    }
                }
            }
        }
    }
}

struct WBWidget: Widget {
    let kind: String = "WBWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WBWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Виджет для WBApp")
        .description("Виджет покажет список онлайн/всех контактов с возможностью перехода к конкретному профилю.")
    }
}

struct WBWidget_Previews: PreviewProvider {
    static var previews: some View {
        WBWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), theme: .dark))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
