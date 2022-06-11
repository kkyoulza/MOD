--@ BeginMethod
--@ MethodExecSpace=All
void NoNuckBackMode(Entity player)
{
		if player.TriggerComponent.Enable == true then
			player.TriggerComponent.Enable = false
			player.AvatarRendererComponent:PlayEmotion(EmotionalType.Smile,3)
			player.AvatarRendererComponent:SetColor(1,0,0,1)
			player.ChatBalloonComponent.Message = "먼저 갑니다~~!"
			player.ChatBalloonComponent.Enable = true
			wait(2)
			player.ChatBalloonComponent.Enable = false
			player.AvatarRendererComponent:SetColor(1,1,1,1)
			player.TriggerComponent.Enable = true
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
		
		if TriggerBodyEntity.PlayerComponent ~= nil then
			self:NoNuckBackMode(TriggerBodyEntity)
		end


}
--@ EndEntityEventHandler
