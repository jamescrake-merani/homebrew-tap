class AutoTimesheet < Formula
  desc "CLI application for automatically keeping timesheets"
  homepage "https://github.com/jamescrake-merani/auto-timesheet"
  url "https://github.com/jamescrake-merani/auto-timesheet/archive/refs/tags/0.3.0.tar.gz"
  sha256 "0da656445e163ad25a29ee681fc886ececb51ecbe5f8d22ea98a1dc0b5be92d9"
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
