import SwiftUI
import CoreHwp

struct FileInfoView: View {
    @Binding var show: Bool

    @State private var tabSelection = Tabs.general

    private enum Tabs: Hashable {
        case general
        case summary
        case statistic
        case font
        case picture
        case copyright
    }

    var body: some View {
        TabView(selection: $tabSelection) {
            GeneralInfoView()
                .tabItem { Label("fileinfo.general".l, systemImage: "star") }.tag(Tabs.general)
            SummaryView()
                .tabItem { Label("fileinfo.summary".l, systemImage: "star") }.tag(Tabs.summary)
            Text("Tab Content 3").tabItem { Label("fileinfo.statistic".l, systemImage: "star") }.tag(Tabs.statistic)
            Text("Tab Content 3").tabItem { Label("fileinfo.font".l, systemImage: "star") }.tag(Tabs.font)
            Text("Tab Content 3").tabItem { Label("fileinfo.picture".l, systemImage: "star") }.tag(Tabs.picture)
            Text("Tab Content 3").tabItem { Label("fileinfo.copyright".l, systemImage: "star") }.tag(Tabs.copyright)
        }.tabViewStyle(DefaultTabViewStyle())
        #if os(macOS)
        Button("Dismiss", action: {show = false})
        #endif
    }
}

struct FileInfoViewPreviews: PreviewProvider {
    static var previews: some View {
        FileInfoView(show: .constant(true))
    }
}
