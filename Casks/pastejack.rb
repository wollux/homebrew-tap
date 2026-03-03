cask "pastejack" do
  version "0.2.0"
  sha256 "259145c1c9383b0c848e2c3f841fde55f7f2c15478fbc5cb76b04bfde0efe749"
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
