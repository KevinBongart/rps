#!/usr/bin/env ruby

require_relative "models/game"

Game.new(strategy: ARGV[0]).play
