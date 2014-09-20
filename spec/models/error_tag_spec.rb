require 'rails_helper'

describe ErrorTag do
  it "is valid with both errorlog id and tag id" do
  	errorlog = create(:errorlog)
  	tag = create(:tag)
  	errortag = create(:error_tag, tag_id: tag, errorlog_id: errorlog)
  	expect(errortag).to be_valid
  end
end
