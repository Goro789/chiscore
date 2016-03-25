require 'chiscore/repository/noop_strategy'

module ChiScore
  class DevStrategy < ChiScore::NoopRepositoryStrategy
    def self.time_for(*args)
      rand(1500)
    end

    def self.active_for(*args)
      (1..10).to_a
    end

    def self.checkins_for(*args)
      (1..10).reduce({}) do |hash, val|
        hash.merge(val => (Time.now - 10 * 60).to_i + rand(500))
      end
    end

    def self.checkouts_for(*args)
      (1..10).reduce({}) do |hash, val|
        hash.merge(val => Time.now.to_i + rand(1500))
      end
    end

    def self.fetch_race_start(*args)
      Time.now.to_i.to_s
    end
  end
end
