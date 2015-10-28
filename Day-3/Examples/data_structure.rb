require "pry"

class DataStructure
  def self.data_array

    # arr = [
    #   { :arr => [1, 2, 3]},
    #   { :arr => [4, 5, 6]},
    #   { :arr => [7, 8, 9]}
    # ]

    # arr = [
    #   ["a", "b", "c"],
    #   [1, 2, 3],
    #   ["pizza", "asparagus", "chicken"],
    #   ["coffee", "tea", "cola"]
    # ]

    arr = [
      { :lat => 25, :lng => 80, :name => "Miami" },
      { :lat => 48, :lng => 2,  :name => "Paris" },
      { :lat => 40, :lng => 3,  :name => "Madrid" },
      { :lat => 18, :lng => 66, :name => "San Juan" },
    ]
  end
end

da = DataStructure.data_array
binding.pry
