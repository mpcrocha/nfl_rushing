class PopulateRushings < ActiveRecord::Migration[6.0]
  def up
    rushings_file = File.read(Rails.root.join('config', 'json_data', 'rushing.json'))
    rushings_data = JSON.parse(rushings_file)
    rushings_data.each do |rushing_data|
      rushing = Rushing.new
      rushing.player = rushing_data['Player']
      rushing.team = rushing_data['Team']
      rushing.pos = rushing_data['Pos']
      rushing.att = rushing_data['Att']
      rushing.att_g = rushing_data['Att/G']
      rushing.yds = rushing_data['Yds']
      rushing.avg = rushing_data['Avg']
      rushing.yds_g = rushing_data['Yds/G']
      rushing.td = rushing_data['TD']
      rushing.lng = rushing_data['Lng']
      rushing.first = rushing_data['1st']
      rushing.first_pct = rushing_data['1st%']
      rushing.twenty_plus = rushing_data['20+']
      rushing.forty_plus = rushing_data['40+']
      rushing.fum = rushing_data['FUM']
      rushing.save
end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
