class Incident < ActiveRecord::Base
  class << self
    def synchronize
      result = RestClient.get("http://traffic.houstontranstar.org/data/layers/incidents_json.js")
      incidents = JSON.parse(result.body)["incidents"]
      incidents.each do |i|
        incident = Incident.new
        incident.location = i["location"]
        incident.description = i["desc"]
        incident.vehicles = i["veh"]
        incident.lanes = i["lanes"]
        incident.status = i["status"]
        incident.reported_at = Chronic.parse i["time"]
        incident.latitude = i["lat"]
        incident.longitude = i["lng"]
        incident.save! rescue nil
      end
    end
  end
end
