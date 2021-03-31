-- レイヤー0の赤い部分にレイヤー1の画像を置く
--
-- 全ピクセルを操作すると流石に重い。同じことをglslで出来ないか調べる
-- TODO：レイヤーサイズの取得方法を調べる。

local r = {};
local position = {
    x = 0,
    y = 0
};
local num = 0;

-- stepピクセル毎に色を取得
local step = 4;
for y = 0, height - 1, step do
    for x = 0, width - 1,step do
        local idx = y * width + x;
        r[idx] = (getColor(0, x, y)); --g以降を無視
        -- 赤色の中心を取得
        if r[idx] > 0.95 then
            position.x = position.x + x;
            position.y = position.y + y;
            num = num + 1;
        end
    end
end

fill(0, 1, 0, 0.8);
beginGroup()
move(position.x/num, position.y/num);
circle(200);
imageAlign("+x-y")
image(1,300,300)
endGroup()

println("OK")
