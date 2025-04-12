def count_matches(teams)
  if teams == 1
    0
  elsif teams % 2 == 0
    matches = teams / 2
    matches + count_matches(matches)
  else
    matches = (teams-1) / 2
    matches + count_matches(matches+1)
  end
end

total_teams = gets.chomp.to_i
puts count_matches(total_teams)


