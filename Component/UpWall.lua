--@ BeginProperty
--@ SyncDirection=All
number x_pos = "0"
--@ EndProperty

--@ BeginProperty
--@ SyncDirection=All
number y_pos = "0"
--@ EndProperty

--@ BeginEntityEventHandler
--@ Scope=All
--@ Target=self
--@ EventName=TriggerEnterEvent
HandleTriggerEnterEvent
{
-- Parameters
local TriggerBodyEntity = event.TriggerBodyEntity
local other = TriggerBodyEntity.MovementComponent

--------------------------------------------------------

-- TriggerBodyEntity = 부딪히는 놈 = 인파 or Player >> 인파에도 TransformComponent가 있는지 확인하고, 없으면 추가할 것(Movement도)

x_pos = TriggerBodyEntity.TransformComponent.Position.x  -- 캐릭터의 x좌표 위치
y_pos = self.Entity.TransformComponent.Position.y  -- 위쪽 벽은 캐릭터를 아래로 다시 보내야 하니까 고정된 y좌표 위치를 설정(벽의)


--log("x :"..x_pos)
--log("y :"..y_pos)

if other ~= nil then
	other:SetPosition(Vector2(x_pos,y_pos-1.3)) -- 위치 바꾸기
end




}
--@ EndEntityEventHandler
