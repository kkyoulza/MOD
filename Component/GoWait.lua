GoWait{

		--@ BeginProperty
		--@ SyncDirection=None
		any Dialog = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity DialogUI = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity FaceUI = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity NameTxt = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity DialogTxt = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity GoBtn = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity CancelBtn = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=All
		Entity player = "nil"
		--@ EndProperty
		
		--@ BeginMethod
		--@ MethodExecSpace=ClientOnly
		void OnBeginPlay()
		{
		
				self.DialogUI = _EntityService:GetEntityByPath("/ui/DialogUI/Dialog")
				
				self.Dialog = _DataService:GetTable("GoWait")
				
				self.FaceUI = _EntityService:GetEntityByPath("/ui/DialogUI/Dialog/Face")
				
				self.DialogTxt = _EntityService:GetEntityByPath("/ui/DialogUI/Dialog/DialogTxt")
				
				self.GoBtn = _EntityService:GetEntityByPath("/ui/DialogUI/Dialog/GoBtn")
		}
		--@ EndMethod
		
		--@ BeginMethod
		--@ MethodExecSpace=All
		void ShowDialog()
		{
		
				local Speak = self.Dialog:GetCell(1,"Dialog")
				local FaceID = self.Dialog:GetCell(1,"ImageID")
				
				self.DialogTxt.TextComponent.Text = Speak
				
				if FaceID ~= nil then
					self.FaceUI.SpriteGUIRendererComponent.ImageRUID = FaceID
					self.FaceUI.Enable = true
				else
					self.FaceUI.Enable = false
				end
				
				self.DialogUI.Enable = true
				self.GoBtn.Enable = true
		
		}
		--@ EndMethod
		
		--@ BeginEntityEventHandler
		--@ Scope=All
		--@ Target=entity:eec128f2-5c59-4f8f-a46c-6c2ba88c5ff4
		--@ EventName=TouchEvent
		HandleTouchEvent
		{
				-- Parameters
				--------------------------------------------------------
				
				self:ShowDialog()
		
		}
		--@ EndEntityEventHandler
		
		--@ BeginEntityEventHandler
		--@ Scope=All
		--@ Target=entity:1f96e0d1-d646-4bd8-946f-29a27f3024bb
		--@ EventName=ButtonClickEvent
		HandleButtonClickEvent
		{
				-- Parameters
				local Entity = event.Entity
				--------------------------------------------------------
				self.DialogUI.Enable = false
				self.GoBtn.Enable = false
				
				self.Entity.MakeInstance:Move(self.player)
		
		
		}
		--@ EndEntityEventHandler
		
		--@ BeginEntityEventHandler
		--@ Scope=All
		--@ Target=service:UserService
		--@ EventName=UserEnterEvent
		HandleUserEnterEvent
		{
				-- Parameters
				local UserId = event.UserId
				--------------------------------------------------------
				self.player = _UserService:GetUserEntityByUserId(UserId)
		}
		--@ EndEntityEventHandler

}

		
