-- ********************************************************
-- ゲーム風に遷移する数値テキスト（全角）
-- ********************************************************
-- FROMからTOに、MOVE_TIME(ms)かけて遷移する数値テキスト
-- カンマ区切り有、全角に変換する
-- ********************************************************

-- 設定値
FROM = 0 TO = 9999
MOVE_TIME = 1000 -- 変化時間(ms)

-- 変化時間(F)を計算
move_frame = (obj.framerate / 1000) * MOVE_TIME
-- 1F当たりの変化量を計算
diff = (TO - FROM) / move_frame

-- 現在の表示量を設定
if obj.frame > move_frame then
  -- 変化フレーム数以上経過していたら常に変化後（TO）の値を表示
  amount = string.format("%d",to)
else
  -- そうでない場合、1F当たりの変化量*経過フレーム数で表示量を計算
  amount = string.format("%d",((diff * obj.frame) / 1) + from)
end

-- 全角変換用テキスト配列
table = {"０","１","２","３","４","５","６","７","８","９"}
comma = "，"
text = ""
-- 表示量テキスト桁数分繰り返す
for i = 1, string.len(amount) do
  -- 上からi桁目のテキスト
  ch = string.sub(amount, i, i)
  if tonumber(ch) ~= nil then
    -- tonumberできるテキストは全角に変換
    -- luaの配列は1始まりなので、0はtable[1]、1はtable[2]
    text = text .. table[ch+1]
  else
    -- tonumberしてnilが返る＝非numberテキストはそのまま
    text = text .. ch
  end
  if (string.len(amount) - i) % 3 == 0 and string.len(amount) ~= i then
    -- カンマが付く桁であり、最後の1桁でない場合
    text = text .. comma
  end
end
-- テキスト表示
mes(string.format("%s",text))

-- ********************************************************
-- ゲーム風に遷移する数値テキスト
-- ********************************************************
-- FROMからTOに、MOVE_TIME(ms)かけて遷移する数値テキスト
-- カンマ区切り有
-- ********************************************************

-- 設定値
FROM = 0 TO = 9999
MOVE_TIME = 1000 -- 変化時間(ms)

-- 変化時間(F)を計算
move_frame = (obj.framerate / 1000) * MOVE_TIME
-- 1F当たりの変化量を計算
diff = (TO - FROM) / move_frame

-- 現在の表示量を設定
if obj.frame > move_frame then
  -- 変化フレーム数以上経過していたら常に変化後（TO）の値を表示
  amount = string.format("%d",to)
else
  -- そうでない場合、1F当たりの変化量*経過フレーム数で表示量を計算
  amount = string.format("%d",((diff * obj.frame) / 1) + from)
end

text = ""
-- 表示量テキスト桁数分繰り返す
for i = 1, string.len(amount) do
  -- 上からi桁目のテキスト
  ch = string.sub(amount, i, i)
  text = text .. ch
  if (string.len(amount) - i) % 3 == 0 and string.len(amount) ~= i then
    -- カンマが付く桁であり、最後の1桁でない場合
    text = text .. comma
  end
end
-- テキスト表示
mes(string.format("%s",text))