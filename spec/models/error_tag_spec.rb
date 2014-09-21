require 'rails_helper'

RSpec.describe ErrorTag, :type => :model do

  it { should belong_to(:errorlog) }
  it { should belong_to(:tag) }

	before :each do
		@errorlog = create(:errorlog)
		@tag = create(:tag)
	end

  it "is valid with both errorlog id and tag id" do
  	errortag = create(:error_tag, errorlog_id: @errorlog.id, tag_id: @tag.id)
  	expect(errortag).to be_valid
  end

  it "correctly references the associated errorlog" do
  	errortag = create(:error_tag, errorlog_id: @errorlog.id, tag_id: @tag.id)
  	expect(errortag.errorlog).to eq @errorlog
  end

  it "correctly references the associated tag" do
  	errortag = create(:error_tag, errorlog_id: @errorlog.id, tag_id: @tag.id)
  	expect(errortag.tag).to eq @tag
  end
end