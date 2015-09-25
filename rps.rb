#!/usr/bin/env ruby

require_relative "game"

Game.new(strategy: ARGV[0]).play
