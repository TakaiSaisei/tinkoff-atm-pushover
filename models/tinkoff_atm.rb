require 'ostruct'

class TinkoffAtm
  attr_reader :atm

  def initialize(atm)
    @atm = JSON.parse(atm, object_class: OpenStruct)
  end

  def usd_available?
    limits.each do |limit|
      if limit.currency == 'USD'
        return true
      end
    end

    false
  end

  def usd_amount
    limits.each do |limit|
      if limit.currency == 'USD'
        return limit.amount
      end
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
