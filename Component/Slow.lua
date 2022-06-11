--@ BeginEntityEventHandler
--@ Scope=All
--@ Target=self
--@ EventName=TriggerLeaveEvent
HandleTriggerLeaveEvent
{
		-- Parameters
		local TriggerBodyEntity = event.TriggerBodyEntity
		--------------------------------------------------------
		-- 장애물을 떠날 때 속도 원상복귀
		
		local IsPlayer = TriggerBodyEntity.PlayerComponent
		
		if IsPlayer ~= nil then -- player일때
			if TriggerBodyEntity.RigidbodyComponent ~= nil then
				local Quart_X = TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationX
				local Quart_Y = TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationY
				
				Quart_X = 3
				Quart_Y = 3
				TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationX = Quart_X 
				TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationY = Quart_Y
				TriggerBodyEntity.ChatBalloonComponent.Enable = false
			end
		else -- player가 아닐 때
			if TriggerBodyEntity.RigidbodyComponent ~= nil then
				local Quart_X = TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationX
				local Quart_Y = TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationY
				
				Quart_X = 2
				Quart_Y = 2
				TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationX = Quart_X 
				TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationY = Quart_Y
			end
		end
		
		
		
		
}
--@ EndEntityEventHandler

--@ BeginEntityEventHandler
--@ Scope=All
--@ Target=self
--@ EventName=TriggerEnterEvent
HandleTriggerEnterEvent
{ -- 해당 엔티티 위를 지나가는 동안만 적용되는 이벤트
		-- Parameters
		local TriggerBodyEntity = event.TriggerBodyEntity
		--------------------------------------------------------
		math.randomseed(os.time())
		
		local RanNum = math.random(1,100)
		
		if TriggerBodyEntity.RigidbodyComponent ~= nil then
			if TriggerBodyEntity.PlayerComponent ~= nil then
				local Face = TriggerBodyEntity.AvatarRendererComponent
				Face:PlayEmotion(EmotionalType.Oops,3)
				
		
				if TriggerBodyEntity.ChatBalloonComponent.Enable == false then
					if RanNum >= 1 and RanNum < 26 then -- 랜덤으로 대사 출력
						TriggerBodyEntity.ChatBalloonComponent.Message = "아, 안사요!!"
					elseif RanNum >= 26 and RanNum < 51 then
						TriggerBodyEntity.ChatBalloonComponent.Message = "아, 놔요!!!"
					elseif RanNum >= 51 and RanNum < 76 then
						TriggerBodyEntity.ChatBalloonComponent.Message = "잡지마요!"
					else
						TriggerBodyEntity.ChatBalloonComponent.Message = "아오! 진짜!!!"
					end
					TriggerBodyEntity.ChatBalloonComponent.Enable = true
				end
			end
			local Quart_X = TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationX
			local Quart_Y = TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationY
			Quart_X = 0.5 -- x축 가속도 반토막
			Quart_Y = 0.5 -- y축 가속도 반토막
			TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationX = Quart_X 
			TriggerBodyEntity.RigidbodyComponent.QuaterViewAccelerationY = Quart_Y
		end
		
		
		
}
--@ EndEntityEventHandler
