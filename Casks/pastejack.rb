cask "pastejack" do
  version "0.8.1"
  sha256 "64e5a2591b4a053745f2db3164794bdde433febe9c4120c75960fc1482b76789"
  url "https://github.com/wollux/PasteJack/releases/download/v#{version}/PasteJack-#{version}.dmg"
  name "PasteJack"
  desc "Paste clipboard contents as simulated keystrokes — bypass paste-blocking"
  homepage "https://github.com/wollux/PasteJack"
  livecheck do
    url :url
    strategy :github_latest
  end
  depends_on macos: ">= :sonoma"
  app "PasteJack.app"
  zap trash: [
    "~/Library/Preferences/com.pastejack.app.plist",
    "~/Library/Application Support/PasteJack",
  ]
  caveats <<~EOS
    PasteJack requires Accessibility permission to simulate keystrokes.
    After installation, go to:
      System Settings > Privacy & Security > Accessibility
    and enable PasteJack.
    Default hotkey: Ctrl+Shift+V
  EOS
end
