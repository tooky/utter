module Utter
  class Site < Sequel::Model
    set_primary_key :key

    before_create do
      self[:key] = generate_key
    end
  
    def regenerate
      self.update
      Jekyll.process(self[:source], self[:destination]) if source_exists?
    end
  
    def source_exists?
      File.exist? self.source
    end
  
    def clone
      unless source_exists?
        Git.clone self[:repo], self[:source]
      end
    end
    
    def update
      if source_exists?
        g = Git.open self[:source]
        g.pull 
      end
    end
    
    def self.make_table
      begin
        DB.create_table :sites do
          primary_key :key, :string, :auto_increment => false
          String :name
          String :source
          String :destination
          String :repo
          Time :created_at
        end
      rescue
        # table exists!
      end
    end
  
    private
    def generate_key
      Digest::SHA1.hexdigest self[:name] + Salt
    end
  end
end