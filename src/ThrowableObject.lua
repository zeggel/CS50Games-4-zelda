ThrowableObject = Class{__includes = GameObject}

function ThrowableObject:init(def, x , y)
    GameObject.init(self, def, x, y)
    self.liftable = true
    self.thrown = false
end