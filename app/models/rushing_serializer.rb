# frozen_string_literal: true

class RushingSerializer < ActiveModel::Serializer
  attributes :id, :player, :team, :pos, :att, :att_g, :yds, :avg, :yds_g, :td, :lng, :first, :first_pct, :twenty_plus,
             :forty_plus, :fum
end
