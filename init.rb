APP_ROOT = File.dirname(__FILE__)

require("#{APP_ROOT}/lib/play")

play = Play.new();
play.launch!