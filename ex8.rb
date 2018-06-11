# creates a string variable that can be called by %{name} and placed
# at designated anchor points inside of the string.
formatter = "%{first} %{second} %{third} %{fourth}"
# the variable name formatter followed by a framing of % {}
# repeat the name from the formatter string to place input in the matching space.
# Here the anchors place integers, 1..4
puts formatter % {first: 1, second: 2, third: 3, fourth: 4}
# Achored points place string values, this time 1..4 in english.
puts formatter % {first: "one", second: "two", third: "three", fourth: "four"}
# Anchored points place boolean values as well.
puts formatter % {first: true, second: false, third: true, fourth: false}
# Curious interaction, it places the full string value of 'formatter'
# from beginning to end inside each leg of the achored segmets.
# first: 1..4 second: 1..4, etc.
puts formatter % {first: formatter, second: formatter, third: formatter, fourth: formatter}
# Another cool interaction. puts formatter %{} at the start of the block
# When puts, it prints in a single string. I believe this is because
# The original formatter variable encases the anchors in a target string
# So that it behaves like a single string. This time full sentences were entered
# As string objects, just like the second example.
puts formatter % {
  first: "I had this thing.",
  second: "That you could type up right.",
  third: "But it didn't sing.",
  fourth: "So I said goodnight."
}
