require 'support/shared_examples_for_bike_container'

class BikeContainerTest
  include BikeContainer
end

describe BikeContainerTest do
  it_behaves_like BikeContainer
end
