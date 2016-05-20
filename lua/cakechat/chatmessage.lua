local self = {}
CakeChat.ChatMessage = CakeChat.MakeConstructor (self)

--[[
	Events:
		ChildMessageAdded (ChatMessage message)
			Fired when a child chat message has been added.
		ChildMessageRemoved (ChatMessage message)
			Fired when a child chat message has been removed.
		Deleted ()
			Fired when this chat message has been deleted.
		Edited (User user)
			Fired when this chat message has been edited by a user.
		Removed ()
			Fired when this chat message has been removed.
]]

function self:ctor ()
	-- Identity
	self.Id                = nil
	
	self.Channel           = nil -- nil if not applicable. eg. default or group chat
	self.OriginatingServer = nil -- nil if message is client generated
	self.OriginatingUser   = nil -- nil if no user, or console
	
	-- Message
	self.Timestamp         = 0   -- UTC timestamp in seconds
	self.MessageType       = CakeChat.ChatMessageType.System
	self.Text              = nil
	self.FormattedText     = nil -- GLib.FormattedText ()
	
	-- Message hierarchy
	self.ParentMessage     = nil -- nil if no parent
	self.Children          = nil -- nil if no children
	
	CakeChat.EventProvider (self)
end

function self:dtor ()
end

-- Identity
function self:GetId ()
	return self.Id
end

function self:GetChannel ()
	return self.Channel
end

function self:GetOriginatingServer ()
	return self.OriginatingServer
end

function self:GetOriginatingUser ()
	return self.OriginatingUser
end

-- Message
function self:GetFormattedText ()
	return self.FormattedText
end

function self:GetMessageType ()
	return self.MessageType
end

function self:GetText ()
	return self.Text
end

function self:GetTimestamp ()
	return self.Timestamp
end

-- Message hierarchy
function self:GetChildMessage (index)
	if not self.Children then return nil end
	return self.Children [index]
end

function self:GetChildMessageCount ()
	if not self.Children then return 0 end
	return #self.Children
end

function self:GetChildMessageEnumerator ()
	if not self.Children then return GLib.NullCallback end
	
	local i = 0
	return function ()
		i = i + 1
		return self.Children [i]
	end
end

function self:GetParentMessage ()
	return self.ParentMessage
end