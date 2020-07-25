# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_725_185_634) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'event_store_events', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'event_type', null: false
    t.binary 'metadata'
    t.binary 'data', null: false
    t.datetime 'created_at', null: false
    t.index ['created_at'], name: 'index_event_store_events_on_created_at'
    t.index ['event_type'], name: 'index_event_store_events_on_event_type'
  end

  create_table 'event_store_events_in_streams', id: :serial, force: :cascade do |t|
    t.string 'stream', null: false
    t.integer 'position'
    t.uuid 'event_id', null: false
    t.datetime 'created_at', null: false
    t.index ['created_at'], name: 'index_event_store_events_in_streams_on_created_at'
    t.index %w[stream event_id], name: 'index_event_store_events_in_streams_on_stream_and_event_id', unique: true
    t.index %w[stream position], name: 'index_event_store_events_in_streams_on_stream_and_position', unique: true
  end
end