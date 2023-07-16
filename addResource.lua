function addResource(plr, Resource, Amount)
	local Inventory = plr.Inventory
	local MaxStack = Items[Resource].MaxStack

	repeat
		for a,b in pairs(Inventory:GetChildren()) do
			if b.Name == Resource then
				if b.Value <= MaxStack - 1 then
					repeat
						b.Value += 1
						Amount -= 1

						if Amount == 0 then
							break
						end
					until b.Value == MaxStack
				end
			end
		end

		if Amount >= 1 then
			local ResourceVal = Instance.new("IntValue", Inventory)
			ResourceVal.Name = Resource

			repeat
				ResourceVal.Value += 1
				Amount -= 1

				if Amount == 0 then
					break
				end
			until ResourceVal.Value == MaxStack
		end
	until Amount == 0
end