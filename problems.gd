extends Label

# ラベルに表示する数値の範囲を設定
const MIN_VALUE = 2
const MAX_VALUE = 100

# 問題のランダムな数値を保持する変数
var random_number = 0

# ランダムな数字を生成してラベルに表示する関数
func show_random_number():
	random_number = randi_range(MIN_VALUE, MAX_VALUE)
	text = str(random_number)

# ノードがReady状態になったときに実行
func _ready():
	randomize()
	show_random_number()
