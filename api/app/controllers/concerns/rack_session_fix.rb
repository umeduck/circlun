module RackSessionFix
  extend ActiveSupport::Concern

  class FakeRackSession < Hash
    def enabled?
      false
    end
  end

  included do
    before_action :inject_fake_session
  end

  private

  def inject_fake_session
    request.env['rack.session'] ||= FakeRackSession.new
  end
end
