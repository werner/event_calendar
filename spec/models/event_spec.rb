require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'does not pass when lack of description' do
    event = Event.new start_date: '01-01-2010'.to_time, end_date: '02-01-2010'.to_time
    expect(event).not_to be_valid
    expect(event.errors.messages[:description]).to eq ["can't be blank"]
  end

  it 'does not pass when lack of start date' do
    event = Event.new end_date: '02-01-2010'.to_time, description: 'Party'
    expect(event).not_to be_valid
    expect(event.errors.messages[:start_date]).to eq ["can't be blank"]
  end

  it 'does not pass when lack of end date' do
    event = Event.new start_date: '01-01-2010'.to_time, description: 'Party'
    expect(event).not_to be_valid
    expect(event.errors.messages[:end_date]).to eq ["can't be blank"]
  end

  it 'fails validation because start date is bigger than end date' do
    event = Event.new start_date: '01-01-2010'.to_time,
                      end_date: '02-01-2008'.to_time,
                      description: 'Party'
    expect(event).not_to be_valid
    expect(event.errors.messages[:end_date]).to eq ["must be bigger than start date"]
  end

  it 'passes all validation' do
    event = Event.new start_date: '01-01-2010'.to_time,
                      end_date: '02-01-2010'.to_time,
                      description: 'Party'
    expect(event).to be_valid
  end

end
