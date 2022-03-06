=begin
  Example of request body

  { bounds: { bottomLeft: { lat: 55.56727024240635, lng: 37.56896544957144 },
              topRight: { lat: 55.56741881152076, lng: 37.569773465037166 } },
    filters: { banks: ['tcs'], showUnavailable: true, currencies: ["RUB"] },
    zoom: 21 }
=end

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
