function weight(x)
    return x/1920*ScrW()
end

function height(y)
    return y/1080*ScrH()
end

surface.CreateFont("CatamaranEB25",{
    size=height(25),
    font = "Catamaran",
    weight = 800,
    antialias = true
})
surface.CreateFont("CatamaranB35",{
    size=height(35),
    font = "Catamaran",
    weight = 700,
    antialias = true
})
surface.CreateFont("CatamaranSB25",{
    size=height(25),
    font = "Catamaran",
    weight = 500,
    antialias = true
})
surface.CreateFont("CatamaranM20",{
    size=height(20),
    font = "Catamaran",
    weight = 400,
    extended = true,
    antialias = true
})

local profile = Material("loginui.png","noclamp smooth")
local points = Material("points.png","noclamp smooth")
local gray_clr = Color(49,47,49)
local dgray_clr = Color(30,30,30)
local sgray_clr = Color(71,70,71)
local blue_clr = Color(15,138,254)
local dblue_clr = Color(29,129,220)

local function DrawLoginUI()
    local user
    local pass
    local frame = vgui.Create("EditablePanel")
    frame:MakePopup()
    frame:SetPos(weight(758),height(170))
    frame:SetSize(weight(400),height(710))
    frame.Paint = function(self,w,h)
        draw.RoundedBox(15,0,0,w,h,gray_clr)
        draw.SimpleText("Welcome Back!","CatamaranB35",weight(193),height(235),color_white,1,1)
        draw.SimpleText("Log in to your existing account","CatamaranSB25",weight(196),height(265),color_white,1,1)
        surface.SetMaterial(profile)
        surface.SetDrawColor(color_white)
        surface.DrawTexturedRect(weight(150),height(75),weight(101),height(101))
        surface.SetMaterial(points)
        surface.SetDrawColor(color_white)
        surface.DrawTexturedRect(weight(354),height(23),weight(18),height(18))
        if user:IsHovered() or user:IsEditing() then
            user.alpha = Lerp(FrameTime()*5,user.alpha,1)
        else
            user.alpha = Lerp(FrameTime()*5,user.alpha,0)
        end
        draw.RoundedBox(5,weight(50),height(349),weight(300),height(61),sgray_clr)
        if user.alpha > 0 then
            draw.RoundedBox(5,weight(50),height(349),weight(300),height(61),Color(blue_clr.r,blue_clr.g,blue_clr.b,255*user.alpha))
        end
        draw.RoundedBox(5,weight(52),height(351),weight(294),height(57),gray_clr)
        if pass:IsHovered() or pass:IsEditing() then
            pass.alpha = Lerp(FrameTime()*5,pass.alpha,1)
        else
            pass.alpha = Lerp(FrameTime()*5,pass.alpha,0)
        end
        draw.RoundedBox(5,weight(50),height(428),weight(300),height(61),sgray_clr)
        if pass.alpha > 0 then
            draw.RoundedBox(5,weight(50),height(428),weight(300),height(61),Color(blue_clr.r,blue_clr.g,blue_clr.b,255*pass.alpha))
        end
        draw.RoundedBox(5,weight(52),height(430),weight(294),height(57),gray_clr)
    end
    user = vgui.Create("DTextEntry",frame)
    user:SetPos(weight(68),height(349))
    user:SetSize(weight(300),height(61))
    user:SetFont("CatamaranM20")
    user.alpha = 0
    user.Paint = function(self,w,h)
        self:DrawTextEntryText(color_white,blue_clr,color_white)
        if !self:IsEditing() and self:GetText() == "" then
            draw.SimpleText("Enter Username","CatamaranM20",weight(10),h/2,sgray_clr,0,1)
        end
    end
    pass = vgui.Create("DTextEntry",frame)
    pass:SetPos(weight(68),height(428))
    pass:SetSize(weight(300),height(61))
    pass:SetFont("CatamaranM20")
    pass.alpha = 0
    pass.Paint = function(self,w,h)
        self:DrawTextEntryText(color_white,blue_clr,color_white)
        if !self:IsEditing() and self:GetText() == "" then
            draw.SimpleText("Enter Password","CatamaranM20",weight(10),h/2,sgray_clr,0,1)
        end
    end
    local login = vgui.Create("DButton",frame)
    login:SetPos(weight(48),height(508))
    login:SetSize(weight(302),height(54))
    login:SetText("")
    login.lerp = 0
    login.activated = false
    login.DoClick = function(self)
        self.activated = true
    end
    login.Paint = function(self,w,h)
        if self.activated then
            self.lerp = Lerp(FrameTime()*10,self.lerp,1)
            timer.Simple(0.4,function()
                self.lerp = Lerp(FrameTime()*10,self.lerp,0)
                self.activated = false
            end)
        end
        draw.RoundedBox(15,0,0,w,h,blue_clr)
        draw.RoundedBox(15,0,0,w,h,Color(color_white.r,color_white.g,color_white.b,255*self.lerp))
        draw.SimpleText("LOG IN","CatamaranEB25",w/2,h/2,color_white,1,1)
        if self.lerp > 0 then
            draw.SimpleText("LOG IN","CatamaranEB25",w/2,h/2,Color(blue_clr.r,blue_clr.g,blue_clr.b,255*self.lerp),1,1) 
        end
    end
    local create = vgui.Create("DButton",frame)
    create:SetPos(weight(48),height(584))
    create:SetSize(weight(302),height(54))
    create:SetText("")
    create.lerp = 0
    create.activated = false
    create.DoClick = function(self)
        self.activated = true
    end
    create.Paint = function(self,w,h)
        if self.activated then
            self.lerp = Lerp(FrameTime()*10,self.lerp,1)
            timer.Simple(0.4,function()
                self.lerp = Lerp(FrameTime()*10,self.lerp,0)
                self.activated = false
            end)
        end
        draw.RoundedBox(15,0,0,w,h,gray_clr)
        draw.RoundedBox(15,0,0,w,h,Color(blue_clr.r,blue_clr.g,blue_clr.b,255*self.lerp))
        if self:IsHovered() then
            draw.RoundedBox(15,0,0,w,h,Color(dblue_clr.r,dblue_clr.g,dblue_clr.b,50))
        end
        draw.SimpleText("Create Account","CatamaranSB25",w/2,h/2,dblue_clr,1,1)
        if self.lerp > 0 then
            draw.SimpleText("Create Account","CatamaranSB25",w/2,h/2,Color(color_white.r,color_white.g,color_white.b,255*self.lerp),1,1) 
        end
    end
end

concommand.Add("openui", DrawLoginUI) -- Открывает меню