require 'rails_helper'

RSpec.describe Note, type: :model do
  it 'is valid with title, content, priority' do
    note = create(:note)
    expect(note).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:date_taken) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:priority) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'Instance Methods' do
    it '#init' do
      note = create(:note)
      expect(note.date_taken).not_to be_nil  
    end
  end
end
