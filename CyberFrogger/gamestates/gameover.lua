gameover = {}

function gameover:draw()
	love.graphics.print("YOU LOOSE")
	love.graphics.print(score,nil,20)
	love.graphics.print("R to Retry",nil,40)
	love.graphics.print("Esc To Quit",nil,60)
end

function gameover:keyreleased(key, code)
    if key == 'r' then
        Gamestate.switch(game)
    end
    if key == 'space' then
        Gamestate.switch(menu)
    end
end