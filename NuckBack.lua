--@ BeginEntityEventHandler
--@ Scope=All
--@ Target=self
--@ EventName=TriggerEnterEvent
HandleTriggerEnterEvent
{
-- Parameters
local TriggerBodyEntity = event.TriggerBodyEntity -- 밖에서 부딪혀 오는 것의 정보가 저장되는 것!
local Rigid = TriggerBodyEntity.RigidbodyComponent

--------------------------------------------------------
log(TriggerBodyEntity.Name.."가 부딪혔다!")

local VelX = TriggerBodyEntity.RigidbodyComponent.MoveVelocity.x
local VelY = TriggerBodyEntity.RigidbodyComponent.MoveVelocity.y


local Force = 7


if VelX > 0 then
	if VelY > 0 then
		-- 오른쪽 + 위로 이동 중
		TriggerBodyEntity.RigidbodyComponent:AddForce(Vector2((-1)*Force,(-1)*Force))
	elseif VelY == 0 then
		-- 오른쪽으로만 이동 중
		TriggerBodyEntity.RigidbodyComponent:AddForce(Vector2((-1)*Force,0))
	elseif VelY < 0 then
		-- 오른쪽 + 아래로 이동 중
		TriggerBodyEntity.RigidbodyComponent:AddForce(Vector2((-1)*Force,Force))
	end
elseif VelX == 0 then
	if VelY > 0 then
		-- 위쪽으로만 이동 중
		TriggerBodyEntity.RigidbodyComponent:AddForce(Vector2(0,(-1)*Force))
	elseif VelY == 0 then
		-- 제자리에 있을 때
		-- log("막자중!") -- 막음!! ㅋㅋㅋㅋ
	elseif VelY < 0 then
		-- 아래로만 이동 중
		TriggerBodyEntity.RigidbodyComponent:AddForce(Vector2(0,Force))
	end
	
elseif VelX < 0 then
	if VelY > 0 then
		-- 왼쪽 + 위로 이동 중
		TriggerBodyEntity.RigidbodyComponent:AddForce(Vector2(Force,(-1)*Force))
	elseif VelY == 0 then
		-- 왼쪽으로만 이동 중
		TriggerBodyEntity.RigidbodyComponent:AddForce(Vector2(Force,0))
	elseif VelY < 0 then
		-- 왼쪽 + 아래로 이동 중
		TriggerBodyEntity.RigidbodyComponent:AddForce(Vector2(Force,Force))
	end
end




}
--@ EndEntityEventHandler

