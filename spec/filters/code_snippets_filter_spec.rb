# line 19: if content language - what happens if its not provided
# line 69: what happens if list.any? is true
# line 111: what is parent_config with & without config['application']
# line 138: what is active_index w & w/o options[:code_language]

require 'rails_helper'

RSpec.describe CodeSnippetsFilter do
  it 'returns unaltered input if input is not matching' do
    input = 'hello'

    expect(described_class.call(input)).to eq('hello')
  end

  it 'returns an ArgumentError if no input provided' do
    expect { described_class.call }.to raise_error(ArgumentError)
  end

  it 'creates correct html output with correct input' do
    expect(Base64).to receive(:urlsafe_encode64) do |arg|
      arg
    end

    input = <<~HEREDOC
      ```code_snippets
      source: '_examples/messaging/sms/send-an-sms'
      ```
    HEREDOC

    expect(described_class.call(input)).to include('div class="Vlt-tabs__header--bordered skip-pushstate" data-has-initial-tab="false">', '<a data-section="code"')
  end
end
