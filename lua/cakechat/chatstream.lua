local self = {}
CakeChat.ChatStream = CakeChat.MakeConstructor (self)

--[[
	Events:
		Closed ()
			Fired when this chat stream has been closed.
		MessageAdded (ChatMessage message)
			Fired when a chat message has been added.
		MessageRemoved (ChatMessage message)
			Fired when a chat message has been removed.
]]

function self:ctor ()
	-- Identity
	self.Server  = nil -- nil if global
	self.Channel = nil -- nil if default or group chat
	
	self.DisplayName = nil
	
	-- Users
	self.UserSet = nil
	
	-- Historical messages
	self.Messages = {}
	
	CakeChat.EventProvider (self)
end

function self:dtor ()
end

function self:GetChannel ()
	return self.Channel
end

function self:GetServer ()
	return self.Server
end

function self:GetDisplayName ()
	return self.DisplayName
end

-- Users
function self:GetUser (index)
	return self.UserSet:GetUser (index)
end

function self:GetUserCount ()
	return self.UserSet:GetUserCount ()
end

function self:GetUserEnumerator ()
	return self.UserSet:GetEnumerator ()
end

function self:GetUserSet ()
	return self.UserSet
end

-- Historical messages
function self:GetHistoricMessage (index)
	return self.Messages [index]
end

function self:GetHistoricMessageCount ()
	return #self.Messages
end

function self:GetHistoricMessageEnumerator ()
	local i = 0
	return function ()
		i = i + 1
		return self.Messages [index]
	end
end

function self:IsChatHistoryAvailable ()
	return false
end