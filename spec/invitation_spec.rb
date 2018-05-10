require 'spec_helper'

describe 'invitation.rb prompts the user for the right information' do
  it 'outputs a welcome message that prompts the user for input' do
    allow($stdout).to receive(:puts)
    allow(self).to receive(:gets).and_return("Hermoine")

    expect($stdout).to receive(:puts).with("Hi, you've been invited to a party! What is your name?"), "Make sure something is printed to the console that outputs 'Hi, you've been invited to a party! What is your name?' exactly."

    run_file("./invitation.rb")
  end

  it 'captures the user input and sets it equal to a variable called guest_name' do
    allow($stdout).to receive(:puts)

    expect(self).to receive(:gets).and_return("Hermoine").at_least(:once)

    guest_name = get_variable_from_file("./invitation.rb", "guest_name")

    expect(guest_name).to eq("Hermoine")
  end

  it 'captures the user input and sets it equal to a variable called party_name' do
    allow($stdout).to receive(:puts)

    expect(self).to receive(:gets).and_return("Best Halloween Party Ever").at_least(:once)
    party_name = get_variable_from_file("./invitation.rb", "party_name")

    expect(party_name).to eq("Best Halloween Party Ever")
  end

  it 'captures the user input and sets it equal to a variable called date' do
    allow($stdout).to receive(:puts)

    expect(self).to receive(:gets).and_return("October 31").at_least(:once)
    date = get_variable_from_file("./invitation.rb", "date")

    expect(date).to eq("October 31")
  end

  it 'captures the user input and sets it equal to a variable called time' do
    allow($stdout).to receive(:puts)

    expect(self).to receive(:gets).and_return("6pm").at_least(:once)
    time = get_variable_from_file("./invitation.rb", "time")

    expect(time).to eq("6pm")
  end

  it 'captures the user input and sets it equal to a variable called host_name' do
    allow($stdout).to receive(:puts)

    expect(self).to receive(:gets).and_return("Harry Potter").at_least(:once)
    host_name = get_variable_from_file("./invitation.rb", "host_name")

    expect(host_name).to eq("Harry Potter")
  end
end


describe 'invitation.rb generates a complete invitation, interpolating the provided data' do
  it "returns the new greeting, interpolating the user's name" do
      allow($stdout).to receive(:puts)
      allow(self).to receive(:gets).and_return("Hermoine", "Best Halloween Party Ever", "October 31", "6pm", "Harry Potter")

      output = capture_puts{ run_file("invitation.rb") }

      expect(output).to include("Hermoine")
      expect(output).to include("Best Halloween Party Ever ")
      expect(output).to include("October 31 ")
      expect(output).to include("6pm")
      expect(output).to include("Harry Potter")
    end
end
