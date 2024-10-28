#! /usr/bin/env ruby
# frozen_string_literal: true

#
#   check-temperature
#
# DESCRIPTION:
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: socket
#   lm-sensors
#
# USAGE:
#
# NOTES:
#
# LICENSE:
#   Jordan Beauchamp beauchjord@gmail.com
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'
require 'socket'
require 'json'

#
# Sensors
#
class CheckTemperature < Sensu::Plugin::Check::CLI
  #
  # Setup variables
  #
  def initialize
    super
    @crit_temp = []
    @warn_temp = []
  end

  #
  # Generate output
  #

  def usage_summary
    (@crit_temp + @warn_temp).join(', ')
  end

  #
  # Main function
  #
  def run
    raw = `sensors -Aj`
    metrics = parse_json(raw)
    if metrics.empty? || metrics.nil?
      raw = `sensors -A`
      sections = raw.split("\n\n")
      metrics = {}
      sections.each do |section|
        section.split("\n").drop(1).each do |line|
          key, value = line.split(':')
          key = key.downcase.gsub(/\s/, '')
          if key.start_with?('temp', 'core', 'loc', 'physical')
            # Need to check to see if the temperature includes both high and critical values
            has_high = value.include?('high')
            has_critical = value.include?('crit')
            if has_high && has_critical
              current, high, critical = value.scan(/[-+]+(\d+\.\d+)/i)
            elsif has_high
              current, high = value.scan(/[-+]+(\d+\.\d+)/i)
              critical = high
            elsif has_critical
              current, critical = value.scan(/[-+]+(\d+\.\d+)/i)
              high = critical
            else
              current = value.scan(/[-+]+(\d+\.\d+)/i)
              high = current
              critical = current
            end
            metrics[key] = [current[0], high[0], critical[0]].map(&:to_f)
          end
        rescue StandardError
          print "malformed section from sensors: #{line}\n"
        end
      end
    end
    metrics.each do |k, v|
      current, high, critical = v
      if current > critical
        @crit_temp << "#{k} has exceeded CRITICAL temperature @ #{current}°C"
      elsif current > high
        @warn_temp << "#{k} has exceeded WARNING temperature @ #{current}°C"
      end
    end

    critical usage_summary unless @crit_temp.empty?
    warning usage_summary unless @warn_temp.empty?

    ok 'All sensors are reporting safe temperature readings.'
  end
end

def parse_json(raw)
  rawj = JSON.parse(raw)
  metrics = {}
  rawj.each do |chip, section|
    section.each do |key, value|
      key = key.downcase.gsub(/\s/, '')
      next unless key.start_with?('temp', 'core', 'loc', 'power', 'physical', 'packageid')

      key = [chip, key].join('.')

      current = 0
      high = nil
      critical = nil
      value.each do |k, v|
        if k.end_with?('input')
          current = v
        elsif k.end_with?('max')
          high = v
        elsif k.end_with?('crit')
          critical = v
        end
      end
      if high.nil? || critical.nil?
        if critical.nil? && high.nil?
          critical = high = current
        elsif critical.nil?
          critical = high
        elsif high.nil?
          high = critical
        end
      end
      metrics[key] = [current, high, critical].map(&:to_f)
    end
  end
  metrics
rescue JSON::ParserError
  {}
end
