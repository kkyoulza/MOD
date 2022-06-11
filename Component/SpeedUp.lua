--@ BeginMethod
--@ MethodExecSpace=All
void SpeedUpFunction(Entity other)
{
		local Quart_X = other.RigidbodyComponent.QuaterViewAccelerationX
		local Quart_Y = other.RigidbodyComponent.QuaterViewAccelerationY
		Quart_X = 5 -- x축 가속도가 폭발적으로 증가
		Quart_Y = 5 -- y축 가속도 증가
		other.RigidbodyComponent.QuaterViewAccelerationX = Quart_X 
		other.RigidbodyComponent.QuaterViewAccelerationY = Quart_Y
		log(other.Name.." speed up")
		wait(2) -- 2초동안 증가
		if other.PlayerComponent ~= nil then -- 플레이어와 인파의 원래 속도로 복귀
			log("Down")
			other.RigidbodyComponent.QuaterViewAccelerationX = 3
			other.RigidbodyComponent.QuaterViewAccelerationY = 3
		else
			other.RigidbodyComponent.QuaterViewAccelerationX = 2
			other.RigidbodyComponent.QuaterViewAccelerationY = 2
		end

}
--@ EndMethod

--@ BeginEntityEventHandler
--@ Scope=All
--@ Target=self
--@ EventName=TriggerEnterEvent
HandleTriggerEnterEvent
{
		-- Parameters
		local TriggerBodyEntity = event.TriggerBodyEntity
		--------------------------------------------------------
		self:SpeedUpFunction(TriggerBodyEntity) -- 바닥 트리거를 지나갈 때 함수 발동
		
}
--@ EndEntityEventHandler
