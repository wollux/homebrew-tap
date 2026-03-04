cask "pastejack" do
  version "0.8.0"
  sha256 "7bf8f5cc1f3d0d81eddfacefe3e29def3afc8671ad2c5988fdaa9f9b0ffd9815"
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
