require_relative '../lib/classes/book.rb'

describe Book do
  cover_state = 'Good'
  publish_date = '2011/10/10'
  let(:book) { Book.new(publish_date, cover_state) }

  it 'book should be an instance of Book' do
    expect(book).to be_an_instance_of(Book)
  end

  it 'should return the cover_state of the book object' do
    expect(book.cover_state).to eq('Good')
  end

  it 'Can_be_archived should return true if publish_date > 10' do
    expect(book.can_be_archived?).to eq(true)
  end
end

