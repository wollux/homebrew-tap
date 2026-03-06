cask "pastejack" do
  version "0.9.6"
  sha256 "d39ec9408ab104bd920f739d6cf6462042fdaf1f8277a3a28e7b6a80b7b24d2b"
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
