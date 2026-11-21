attached_ped = {}
attached_bone = {}
attached_x = {}
attached_y = {}
attached_z = {}
attached_rx = {}
attached_ry = {}
attached_rz = {}
attached_to_bones = {}

function attachElementToBone(element,ped,bone,x,y,z,rx,ry,rz)
	if not (isElement(element) and isElement(ped)) then return false end
	if getElementType(ped) ~= "ped" and getElementType(ped) ~= "player" then return false end
	bone = tonumber(bone)
	if not bone or bone < 1 or bone > 20 then return false end
	x, y, z, rx, ry, rz = tonumber(x) or 0, tonumber(y) or 0, tonumber(z) or 0, tonumber(rx) or 0, tonumber(ry) or 0, tonumber(rz) or 0
	if not attached_to_bones[ped] then
		attached_to_bones[ped] = {}
	end
	attached_to_bones[ped][element] = bone
	attached_ped[element] = ped
	attached_bone[element] = bone
	attached_x[element] = x
	attached_y[element] = y
	attached_z[element] = z
	attached_rx[element] = rx
	attached_ry[element] = ry
	attached_rz[element] = rz
	if setElementCollisionsEnabled then
		setElementCollisionsEnabled(element,false)
	end
	if not localPlayer then
		triggerClientEvent("boneAttach_attach", resourceRoot, element,ped,bone,x,y,z,rx,ry,rz)
	end
	return true
end

function detachElementFromBone(element)
	if not element then return false end
	if not attached_ped[element] then return false end
	clearAttachmentData(element)
	if setElementCollisionsEnabled then
		setElementCollisionsEnabled(element,true)
	end
	if not localPlayer then
		triggerClientEvent("boneAttach_detach", resourceRoot, element)
	end
	return true
end

function isElementAttachedToBone(element)
	if not element then return false end
	return isElement(attached_ped[element])
end

function isPedHasAttachment( element, boneCheck )
	if isElement( element ) and attached_to_bones[element] then
		for obj, bone in pairs( attached_to_bones[element] ) do
			if ( not boneCheck and bone > 2 ) or 
			( boneCheck and boneCheck == bone ) then return true end
		end
	end
	return false
end

--function isPedHasAttachment(element)
--	if isElement( element ) and attached_to_bones[element] then
--		return true
--	end
--	return false
--end

function getElementBoneAttachmentDetails(element)
	if not isElementAttachedToBone(element) then return false end
	return attached_ped[element],attached_bone[element],
		attached_x[element],attached_y[element],attached_z[element],
		attached_rx[element],attached_ry[element],attached_rz[element]
end

function setElementBonePositionOffset(element,x,y,z)
	local ped,bone,ox,oy,oz,rx,ry,rz = getElementBoneAttachmentDetails(element)
	if not ped then return false end
	return attachElementToBone(element,ped,bone,x,y,z,rx,ry,rz)
end

function setElementBoneRotationOffset(element,rx,ry,rz)
	local ped,bone,x,y,z,ox,oy,oz = getElementBoneAttachmentDetails(element)
	if not ped then return false end
	return attachElementToBone(element,ped,bone,x,y,z,rx,ry,rz)
end

if localPlayer then
	function getBonePositionAndRotation(ped,bone)
		bone = tonumber(bone)
		if not bone or bone < 1 or bone > 20 then return false end
		if not isElement(ped) then return false end
		if getElementType(ped) ~= "player" and getElementType(ped) ~= "ped" then return false end
		if not isElementStreamedIn(ped) then return false end
		local x,y,z = getPedBonePosition(ped,bone_0[bone])
		local rx,ry,rz = getEulerAnglesFromMatrix(getBoneMatrix(ped,bone))
		return x,y,z,rx,ry,rz
	end
end

------------------------------------

function clearAttachmentData(element)
	if not element then return end
	local ped = attached_ped[element]
	if ped then
		attached_to_bones[ped][element] = nil
		if not next( attached_to_bones[ped] ) then attached_to_bones[ped] = nil end
	end
	attached_ped[element] = nil
	attached_bone[element] = nil
	attached_x[element] = nil
	attached_y[element] = nil
	attached_z[element] = nil
	attached_rx[element] = nil
	attached_ry[element] = nil
	attached_rz[element] = nil
end

function forgetDestroyedElements()
	if attached_ped[source] then
		clearAttachmentData( source )
	elseif attached_to_bones[source] then
		for element, bone in pairs( attached_to_bones[source] ) do
			clearAttachmentData( element )
		end
	end
end
addEventHandler( localPlayer and "onClientElementDestroy" or "onElementDestroy", root, forgetDestroyedElements )
addEventHandler( localPlayer and "onClientPlayerQuit" or "onPlayerQuit", root, forgetDestroyedElements, true, "low-9" )