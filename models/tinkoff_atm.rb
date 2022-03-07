# frozen_string_literal: true

require 'ostruct'

class TinkoffAtm
  attr_reader :atm

  def initialize(atm)
    @atm = JSON.parse(atm, object_class: OpenStruct)
  end

  def usd_available?
    limits.each do |limit|
      return true if limit.currency == 'USD'
    end

    false
  end

  def usd_amount
    limits.each do |limit|
      return limit.amount if limit.currency == 'USD'
    end
  end

  private

  def cluster
    atm.payload.clusters.first
  end

  def limits
    cluster.points.first.limits
  end

end
