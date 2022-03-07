class TinkoffAtmFilter
  attr_reader :scope

  def initialize
    @scope = { bounds: {}, filters: {} }
  end

  def geo(bottom_left:, top_right:)
    filter = { bottomLeft: bottom_left, topRight: top_right }
    scope[:bounds].merge!(filter)
    self
  end

  def show_unavailable(show_unavailable)
    filter = { showUnavailable: show_unavailable }
    scope[:filters].merge!(filter)
    self
  end

  def banks(banks)
    filter = { banks: banks }
    scope[:filters].merge!(filter)
    self
  end

  def currencies(currencies)
    filter = { currencies: currencies }
    scope[:filters].merge!(filter)
    self
  end

  def zoom(zoom)
    filter = { zoom: zoom }
    scope.merge!(filter)
    self
  end

end
