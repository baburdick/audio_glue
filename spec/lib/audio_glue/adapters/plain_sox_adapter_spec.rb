require 'spec_helper'

describe AudioGlue::PlainSoxAdapter do
  let(:adapter)        { described_class.new }
  let(:snippet_packet) { double(:snippet_packet, :format => :mp3) }

  describe '#build' do
    it 'should catch Sox::Error and raise AudioGlue::BuildError' do
      adapter.snippet_packet = snippet_packet
      adapter.should_receive(:write).and_raise(::Sox::Error)

      expect { adapter.build }.
        to raise_error(::AudioGlue::BuildError)
    end
  end
end
