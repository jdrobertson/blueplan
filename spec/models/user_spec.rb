require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: "John Appleseed", email: "john.appleseed@email.com", password: "foobar", password_confirmation: "foobar") }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user.name = ""
      expect(user).to be_invalid
    end

    it "is invalid with a name longer than 50 characters" do
      user.name = "a" * 51
      expect(user).to be_invalid
    end

    it "is invalid without an email" do
      user.email = ""
      expect(user).to be_invalid
    end

    it "is invalid with an email longer than 255 characters" do
      user.email = "a" * 244 + "@example.com"
      expect(user).to be_invalid
    end

    let(:valid_emails) { %w[user@example.com USER@foobar.COM A_US-ER@foobar.bar.org first.last@foobar.jp alice+bob@baz.cn] }
    it "is valid with a valid email" do
      valid_emails.each do |email|
        user.email = email
        expect(user).to be_valid
      end
    end

    let(:invalid_emails) { %w[user@example,com user_at_foobar.org user.name@example. foobar@bar_baz.com foobar@bar+baz.com] }
    it "is invalid with an invalid email" do
      invalid_emails.each do |email|
        user.email = email
        expect(user).to be_invalid
      end
    end

    it "is invalid if another user with same email exists (case-insensitive)" do
      user.save
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      expect(duplicate_user).to be_invalid
    end
  end
end
