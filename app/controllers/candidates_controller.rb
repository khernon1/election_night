class CandidatesController < ApplicationController

  def index
    election = Candidate.new
    election.twitter
    
    trump = Candidate.find_by(name: 'Trump')
    @trump = trump.total
    
    clinton = Candidate.find_by(name: 'Clinton')
    @clinton = clinton.total

    seconds = Candidate.find_by(name: 'Seconds Ran')
    @seconds = seconds.total

  end

end
