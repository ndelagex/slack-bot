require 'slack-ruby-bot'

class Micheline < SlackRubyBot::Bot
  #command /.*owe/ do |client, data, match|
    #client.say(text: match[:expression], channel: data.channel)
  command /.*owe/ do |client, data, match| # this works
    exp = match[:expression]
    hash_exp = parse_exp(exp)
    client.say(text: data.user, channel: data.channel)
    client.say(text: hash_exp[:who], channel: data.channel)
    #match[:command] for the entire command
  end

  def self.parse_exp(exp)
    pattern = /<@(?<who>\S*)>\s(?<number>\d*)(?<what>.*)/
    match_data = exp.match(pattern)
    {
      who: match_data[:who],
      number: match_data[:number] ,
      what: match_data[:what]
    }
  end
end

#match /.*owe @(?<who>.*)/ works only if @user is not a slack user
