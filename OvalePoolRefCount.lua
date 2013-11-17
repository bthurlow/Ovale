--[[--------------------------------------------------------------------
    Ovale Spell Priority
    Copyright (C) 2013 Johnny C. Lam

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License in the LICENSE
    file accompanying this program.
--]]--------------------------------------------------------------------

--[[
	Reference-counting table pool.

	Tables from the pool have four properties added automatically:

	_refcount_pool_object	reference to pool from which the table came.
	GetReference()			increments the count of references to this table.
	ReleaseReference()		decrements the count of references to this table and
							releases the table back to the pool if then count is zero.
	ReferenceCount()		the count of references to this table.
--]]

local _, Ovale = ...
local OvalePoolRefCount = Ovale:NewModule("OvalePoolRefCount")
Ovale.OvalePoolRefCount = OvalePoolRefCount

--<private-static-properties>
local assert = assert
local setmetatable = setmetatable
local tinsert = table.insert
local tostring = tostring
local tremove = table.remove
local wipe = table.wipe
--</private-static-properties>

--<public-static-properties>
OvalePoolRefCount.name = "OvalePoolRefCount"
OvalePoolRefCount.pool = nil
OvalePoolRefCount.refcount = nil
OvalePoolRefCount.size = 0
OvalePoolRefCount.unused = 0
OvalePoolRefCount.__index = OvalePoolRefCount
--</public-static-properties>

--<private-static-methods>
local function ReferenceCount(item)
	return item._refcount_pool_object.refcount[item] or 0
end

local function GetReference(item)
	local refcount = item:ReferenceCount()
	item._refcount_pool_object.refcount[item] = refcount + 1
	return item
end

local function ReleaseReference(item)
	local refcount = item:ReferenceCount()
	local poolObject = item._refcount_pool_object
	if refcount > 1 then
		poolObject.refcount[item] = refcount - 1
	else
		poolObject.refcount[item] = nil
		poolObject:Clean(item)
		wipe(item)
		tinsert(poolObject.pool, item)
		poolObject.unused = poolObject.unused + 1
	end
	return item
end
--</private-static-methods>

--<private-static-properties>
local itemPrototype = {
	_refcount_pool_object = nil,
	AddReference = AddReference,
	ReferenceCount = ReferenceCount,
	ReleaseReference = ReleaseReference,
}
--</private-static-properties>

--<public-static-methods>
do
	-- Class constructor
	setmetatable(OvalePoolRefCount, { __call = function(self, ...) return self:NewPool(...) end })
end

function OvalePoolRefCount:NewPool(name)
	name = name or self.name
	local obj = setmetatable({ name = name }, self)
	obj.refcount = {}
	obj:Drain()
	return obj
end

function OvalePoolRefCount:Get()
	assert(self.pool and self.refcount)
	local item = tremove(self.pool)
	if item then
		self.unused = self.unused - 1
	else
		self.size = self.size + 1
		item = {}
	end
	for name, method in pairs(itemPrototype) do
		item[name] = method
	end
	item._refcount_pool_object = self
	return item:GetReference()
end

function OvalePoolRefCount:Release(item)
	item:ReleaseReference()
end

function OvalePoolRefCount:Clean(item)
	-- virtual function; override as needed.
end

function OvalePoolRefCount:Drain()
	self.pool = {}
	self.size = self.size - self.unused
	self.unused = 0
end

function OvalePoolRefCount:Debug()
	Ovale:FormatPrint("Pool %s has size %d with %d item(s).", tostring(self.name), self.size, self.unused)
end
--</public-static-methods>
