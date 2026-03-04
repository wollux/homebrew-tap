cask "pastejack" do
  version "0.8.1"
  sha256 "ed82696fb2e47e9ad101ce7f49567674c93df1c7ada0d243821b66063b70549f"
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
