extends Label

# 生成された数を格納するための変数
var target_label

func _ready():
	text = ""  # 初期のラベルテキストを空に設定
	# 親ノードのランダム生成用のLabelノードを取得
	target_label = get_parent().get_node("Label")

func _input(event):
	if event is InputEventKey and event.pressed:
		# 数字キーまたはアスタリスクが押された場合
		if event.unicode >= 48 and event.unicode <= 57 or event.unicode == 42:  # '*'も許可
			var char_pressed = char(event.unicode)
			text += char_pressed
		# バックスペースキーで一文字削除
		elif event.keycode == KEY_BACKSPACE:
			if text.length() > 0:
				text = text.substr(0, text.length() - 1)
		# Enterキーが押された場合、チェック
		elif event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			check_input()
			text = ""  # Labelのテキストをクリア

func _on_button_pressed() -> void:
	check_input()
	text = ""  # Labelのテキストをクリア

# 素因数分解の正解判定
func check_input():
	if is_correct_factorization():
		print("正解！")
		# 次の問題を表示
		target_label.show_random_number()
	else:
		print("不正解！")

# 入力が素因数分解の答えとして正しいかチェックする関数
func is_correct_factorization() -> bool:
	# "*"で分割して各要素を整数に変換して掛け算する
	var factors = text.split("*")
	var result = 1
	for factor in factors:
		if factor.is_valid_int():
			result *= int(factor)
		else:
			return false  # 無効な入力がある場合は不正解
	return result == int(target_label.text)
