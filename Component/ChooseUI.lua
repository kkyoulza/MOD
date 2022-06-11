ChooseUI {

		--@ BeginProperty
		--@ SyncDirection=None
		Entity KerningBtn = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity OrbisBtn = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity HenysisBtn = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity ForkBtn = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity ChooseUI = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity MapName = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity Difficulty = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity BestRank = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity A_Item_img = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity B_Item_img = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity C_Item_img = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity A_Percent = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity B_Percent = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity C_Percent = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=All
		string WhatMap = ""Henysis""
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		any MapInfo = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity MapIcon = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=None
		Entity player = "nil"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=All
		number Rank_Henysis = "0"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=All
		number Rank_Kerning = "0"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=All
		number Rank_FolkTown = "0"
		--@ EndProperty
		
		--@ BeginProperty
		--@ SyncDirection=All
		number Rank_Orbis = "0"

		--@ EndProperty
		
		--@ BeginMethod
		--@ MethodExecSpace=ClientOnly
		void OnBeginPlay()
		{
		self.player = _UserService.LocalPlayer
		
		self.MapInfo = _DataService:GetTable("MapInfo")
		
		self.ChooseUI = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap")
		
		self.MapName = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/Place_Value")
		
		self.Difficulty = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/Difficulty_Value")
		
		self.MapIcon = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/MapIcon")
		
		self.BestRank = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/Time_Value")
		
		self.A_Item_img = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/Item_A")
		
		self.B_Item_img = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/Item_B")
		
		self.C_Item_img = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/Item_C")
		
		self.A_Percent = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/A_Percent")
		
		self.B_Percent = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/B_Percent")
		
		self.C_Percent = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/C_Percent")
		
		self.KerningBtn = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/Kerning")
		
		self.OrbisBtn = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/Orbis")
		
		self.HenysisBtn = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/Henysis")
		
		self.ForkBtn = _EntityService:GetEntityByPath("/ui/ChooseUI/ChooseMap/ForkTown")
		
		
		}
		--@ EndMethod
		
		--@ BeginMethod
		--@ MethodExecSpace=All
		void SetHenysis()
		{
		self.WhatMap = "Henysis" -- 어디로 이동할지?
		
		local Mname = self.MapInfo:GetCell(3,"MapName")
		local MDiff = self.MapInfo:GetCell(3,"Difficulty")
		
		local A_img = self.MapInfo:GetCell(3,"DropItem1_ID")
		local B_img = self.MapInfo:GetCell(3,"DropItem2_ID")
		local C_img = self.MapInfo:GetCell(3,"DropItem3_ID")
		
		local A_percentStr = self.MapInfo:GetCell(3,"DropItem1_Percent")
		local B_percentStr = self.MapInfo:GetCell(3,"DropItem2_Percent")
		local C_percentStr = self.MapInfo:GetCell(3,"DropItem3_Percent")
		
		-- local icon = self.MapInfo:GetCell(3,"Map")
		
		-- for문을 통해서 돌아가면서 id를 찾고, 그곳의 index를 가져와서 아래에서 최고기록을 가져온다.
		
		-- local BestTimeStr = 랭킹저장 DB:GetCell(해당 index, "BestTime")
		-- 각 맵 별로 DB를 따로 만들 예정 
		
		self.MapName.TextComponent.Text = Mname -- 맵 이름
		self.Difficulty.TextComponent.Text = MDiff -- 난이도
		self.A_Item_img.SpriteGUIRendererComponent.ImageRUID = A_img
		self.B_Item_img.SpriteGUIRendererComponent.ImageRUID = B_img
		self.C_Item_img.SpriteGUIRendererComponent.ImageRUID = C_img
		self.MapIcon.SpriteGUIRendererComponent.ImageRUID = "2116c81252f64e6580889e5905d9dedf"
		-- self.BestTime.TextComponent.Text = BestTimeStr
		
		self.A_Percent.TextComponent.Text = A_percentStr -- 확률
		self.B_Percent.TextComponent.Text = B_percentStr
		self.C_Percent.TextComponent.Text = C_percentStr
		
		if self.Rank_Henysis > 0 then
			self.BestRank.TextComponent.Text = tostring(math.floor(self.Rank_Henysis)).."등"
		else
			self.BestRank.TextComponent.Text = "기록 없음"
		end
		
		
		self.HenysisBtn.TextComponent.FontColor = Color.red -- 버튼을 눌렀을 때 선택된 버튼만 빨간색으로 세팅 
		self.OrbisBtn.TextComponent.FontColor = Color.white -- 나머지는 흰색으로 변경
		self.ForkBtn.TextComponent.FontColor = Color.white
		self.KerningBtn.TextComponent.FontColor = Color.white
		
		
		
		}
--@ EndMethod

--@ BeginMethod
--@ MethodExecSpace=All
void SetOrbis()
{
self.WhatMap = "Orbis" -- 어디로 이동할지?

local Mname = self.MapInfo:GetCell(2,"MapName")
local MDiff = self.MapInfo:GetCell(2,"Difficulty")

local A_img = self.MapInfo:GetCell(2,"DropItem1_ID")
local B_img = self.MapInfo:GetCell(2,"DropItem2_ID")
local C_img = self.MapInfo:GetCell(2,"DropItem3_ID")

local A_percentStr = self.MapInfo:GetCell(2,"DropItem1_Percent")
local B_percentStr = self.MapInfo:GetCell(2,"DropItem2_Percent")
local C_percentStr = self.MapInfo:GetCell(2,"DropItem3_Percent")

-- local icon = self.MapInfo:GetCell(2,"Map")

-- for문을 통해서 돌아가면서 id를 찾고, 그곳의 index를 가져와서 아래에서 최고기록을 가져온다.

-- local BestTimeStr = 랭킹저장 DB:GetCell(해당 index, "BestTime")
-- 각 맵 별로 DB를 따로 만들 예정 

self.MapName.TextComponent.Text = Mname -- 맵 이름
self.Difficulty.TextComponent.Text = MDiff -- 난이도
self.A_Item_img.SpriteGUIRendererComponent.ImageRUID = A_img
self.B_Item_img.SpriteGUIRendererComponent.ImageRUID = B_img
self.C_Item_img.SpriteGUIRendererComponent.ImageRUID = C_img
self.MapIcon.SpriteGUIRendererComponent.ImageRUID = "e8a2bf75d85c4796aabcbe1d8b505744"
-- self.BestTime.TextComponent.Text = BestTimeSt

self.A_Percent.TextComponent.Text = A_percentStr -- 확률
self.B_Percent.TextComponent.Text = B_percentStr
self.C_Percent.TextComponent.Text = C_percentStr

if self.Rank_Orbis > 0 then
	self.BestRank.TextComponent.Text = tostring(math.floor(self.Rank_Orbis)).."등"
else
	self.BestRank.TextComponent.Text = "기록 없음"
end

self.HenysisBtn.TextComponent.FontColor = Color.white
self.OrbisBtn.TextComponent.FontColor = Color.red -- 버튼을 눌렀을 때 선택된 버튼만 빨간색으로 세팅 
self.ForkBtn.TextComponent.FontColor = Color.white
self.KerningBtn.TextComponent.FontColor = Color.white



}
--@ EndMethod

--@ BeginMethod
--@ MethodExecSpace=All
void SetKerning()
{
self.WhatMap = "Kerning" -- 어디로 이동할지?

local Mname = self.MapInfo:GetCell(1,"MapName")
local MDiff = self.MapInfo:GetCell(1,"Difficulty")

local A_img = self.MapInfo:GetCell(1,"DropItem1_ID")
local B_img = self.MapInfo:GetCell(1,"DropItem2_ID")
local C_img = self.MapInfo:GetCell(1,"DropItem3_ID")

local A_percentStr = self.MapInfo:GetCell(1,"DropItem1_Percent")
local B_percentStr = self.MapInfo:GetCell(1,"DropItem2_Percent")
local C_percentStr = self.MapInfo:GetCell(1,"DropItem3_Percent")

-- local icon = self.MapInfo:GetCell(1,"Map")

-- for문을 통해서 돌아가면서 id를 찾고, 그곳의 index를 가져와서 아래에서 최고기록을 가져온다.

-- local BestTimeStr = 랭킹저장 DB:GetCell(해당 index, "BestTime")
-- 각 맵 별로 DB를 따로 만들 예정 

self.MapName.TextComponent.Text = Mname -- 맵 이름
self.Difficulty.TextComponent.Text = MDiff -- 난이도
self.A_Item_img.SpriteGUIRendererComponent.ImageRUID = A_img
self.B_Item_img.SpriteGUIRendererComponent.ImageRUID = B_img
self.C_Item_img.SpriteGUIRendererComponent.ImageRUID = C_img
self.MapIcon.SpriteGUIRendererComponent.ImageRUID = "8e49fb4d5b684a40a6ba1bd1e0f0e6dd"
-- self.BestTime.TextComponent.Text = BestTimeStr

self.A_Percent.TextComponent.Text = A_percentStr -- 확률
self.B_Percent.TextComponent.Text = B_percentStr
self.C_Percent.TextComponent.Text = C_percentStr

if self.Rank_Kerning > 0 then
	self.BestRank.TextComponent.Text = tostring(math.floor(self.Rank_Kerning)).."등"
else
	self.BestRank.TextComponent.Text = "기록 없음"
end

self.HenysisBtn.TextComponent.FontColor = Color.white -- 버튼을 눌렀을 때 선택된 버튼만 빨간색으로 세팅 
self.OrbisBtn.TextComponent.FontColor = Color.white -- 나머지는 흰색으로 변경
self.ForkBtn.TextComponent.FontColor = Color.white
self.KerningBtn.TextComponent.FontColor = Color.red



}


}
