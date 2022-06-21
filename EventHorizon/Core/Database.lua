EventHorizon.defaults = {
	profile = {
		past = -3,
		future = 9,
		height = 25,
		width = 375,
		gcdSpellId = 1243,
		enabled = true,
		hidden = false,
		locked = false,
		channels = {},
		dots = {},
		directs = {}
	}
}

EventHorizon.defaults.profile.scale = 1/(EventHorizon.defaults.profile.future-EventHorizon.defaults.profile.past)

function EventHorizon:InitializeDatabase()
	self.database = LibStub("AceDB-3.0")
	:New("EventHorizonDatabase", self.defaults, true)
	self.opt = self.database.profile
	self.database.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
    self.database.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
    self.database.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")
end

function EventHorizon:OnProfileChanged()
	self.opt = self.database.profile
	self:RefreshMainFrame()
end
