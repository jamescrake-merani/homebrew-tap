class AutoTimesheet < Formula
  desc "A CLI application for automatically keeping timesheets."
  homepage "https://github.com/jamescrake-merani/auto-timesheet"
  url "https://github.com/jamescrake-merani/auto-timesheet/archive/refs/tags/0.1.0.tar.gz"
  sha256 "f77a6a40d02a2b4cb926dc8e356f48930ff4de526fad97f6291f73055d40104c"
  license "GPL-3.0-or-later"

  depends_on "zlib"
  depends_on "graalvm" => :build
  depends_on "clojure" => :build
  depends_on "xcodes" => :build

  env :std
  def install
    system "clojure -T:build ci"
    system "native-image --features=clj_easy.graal_build_time.InitClojureClasses -H:-CheckToolchain -jar target/com.github.jamescrake-merani/auto-timesheet-*.jar -o auto-timesheet"
    bin.install "auto-timesheet"
  end
end
