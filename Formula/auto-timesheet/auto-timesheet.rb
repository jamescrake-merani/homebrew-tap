class AutoTimesheet < Formula
  desc "CLI application for automatically keeping timesheets"
  homepage "https://github.com/jamescrake-merani/auto-timesheet"
  url "https://github.com/jamescrake-merani/auto-timesheet/archive/refs/tags/0.2.0.tar.gz"
  sha256 "d6bfbcec3f2d80300d83bead86019f554e6d7174a2765c9ecd16aac4316335cc"
  license "GPL-3.0-or-later"

  depends_on "clojure" => :build
  depends_on "graalvm" => :build
  depends_on "zlib"

  env :std
  def install
    system "clojure", "-T:build", "ci"
    system("native-image \
  --features=clj_easy.graal_build_time.InitClojureClasses \
  -H:-CheckToolchain \
  -jar target/com.github.jamescrake-merani/auto-timesheet-*.jar \
  -o auto-timesheet")
    bin.install "auto-timesheet"
  end
end
