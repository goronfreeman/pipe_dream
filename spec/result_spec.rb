require_relative 'spec_helper'

describe PipeDream::Result do
  def item(type)
    { 'id' => { 'kind' => "youtube##{type}" } }
  end

  describe '.for' do
    context 'youtube#channel' do
      it 'manufactures the correct object' do
        expect(subject.for(item('channel')))
          .to be_kind_of(PipeDream::Result::Channel)
      end
    end

    context 'youtube#playlist' do
      it 'manufactures the correct object' do
        expect(subject.for(item('playlist')))
          .to be_kind_of(PipeDream::Result::Playlist)
      end
    end

    context 'youtube#video' do
      it 'manufactures the correct object' do
        expect(subject.for(item('video')))
          .to be_kind_of(PipeDream::Result::Video)
      end
    end
  end
end
