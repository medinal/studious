RSpec.describe User, type: :model do
  subject { described_class.new(name: "name", email: "example@example.com", password: "123456")}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without e-mail" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a string without an @ symbol" do
    subject.email = "test"
    expect(subject).to_not be_valid
  end

  it "is not valid with a string without an ." do
    subject.email = "test@test"
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a short password" do
    subject.password = "25"
    expect(subject).to_not be_valid
  end

  it "has a default role of student" do
    expect(subject.role).to eq("student")
  end

  it "creates a unique identifier" do
    subject.create_identifier
    expect(subject.identifier).to_not be_nil
  end

end
