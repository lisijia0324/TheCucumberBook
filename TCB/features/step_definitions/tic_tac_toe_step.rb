Given /^A board like this:$/ do |table|
  @board = table.raw
end

When /^Player X plays in row (\d+), column (\d+)$/ do |row, col|
  row, col = row.to_i, col.to_i
  @board[row][col] = 'x'
end

Then /^The board should look like this:$/ do |table|
  @board
end