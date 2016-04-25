require 'spec_helper'

RSpec.describe BasicMessagesController do
  specify { expect(described_class).to be < ApplicationController }
  let(:logger_service) { double }

  describe '#perform' do
    it 'logs to file' do
      expect(subject)
        .to receive(:sleep)
        .with(10)

      expect(LoggerService)
        .to receive(:new)
        .and_return(logger_service)

      expect(logger_service)
        .to receive(:write_to_file)

      subject.perform
    end
  end
end
