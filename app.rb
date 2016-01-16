# require 'chunky_png_subimage'
# require 'chunky_png'
# require 'win32/screenshot'
require 'rumouse'

$screen_width = 1920
$screen_height = 1080

def trace_from_topright_corner
	while true
		print '$screen_width - ' + ($screen_width - cursor_position[0].to_i).to_s
		print ', ' + cursor_position[1].to_i
		puts
		sleep 2
	end
end

def trace_from_middle
	while true
		print '$screen_width/2 - ' + ($screen_width/2 - cursor_position[0].to_i).to_s
		print ', ' + '$screen_height/2 - ' + ($screen_height/2 - cursor_position[1].to_i).to_s
		puts
		sleep 2
	end
end
# trace_from_middle()
# trace
# Win32::Screenshot::Take.of(:desktop).write!("screen.png")
# pry
# img = ChunkyPNG::Image.from_file('screen.png')
# subimg = ChunkyPNG::Image.from_file('images/Jouer.png')
$positions = {
	play_button: [1377, 525],
	world: [$screen_width-420, 91],
	village: [$screen_width-383, 91],
	prevost: [$screen_width-336, 91],
	research: [$screen_width-289, 91],
	rank: [$screen_width-242, 91],
	quests: [$screen_width-180, 91],
	attacks: [$screen_width-140, 91],
	logs: [$screen_width-90, 91],
	factions: [$screen_width-40, 91]
}

$subtab_positions = [
	[$screen_width - 386, 130],
	[$screen_width - 332, 130],
	[$screen_width - 281, 130],
	[$screen_width - 233, 130],
	[$screen_width - 176, 130],
	[$screen_width - 128, 130],
	[$screen_width - 76, 130],
	[$screen_width - 35, 130]
]

$step_sleep = 1

def buy_peasants(few: 0, many: 0, alot: 0)
	mouse = RuMouse.new
	mouse.click(*$positions[:village])
	sleep $step_sleep
	mouse.click(*$subtab_positions[4])
	sleep $step_sleep
	few.times do |i|
		mouse.click($screen_width/2 - 448, $screen_height/2 - -26)
		sleep $step_sleep
	end
	many.times do |i|
		mouse.click($screen_width/2 - 399, $screen_height/2 - -26)
		sleep $step_sleep
	end
	alot.times do |i|
		mouse.click($screen_width/2 - 352, $screen_height/2 - -26)
		sleep $step_sleep
	end
end

def loop_tabs
	mouse = RuMouse.new
	mouse.click(*$positions[:village])
	sleep $step_sleep
	arr = $subtab_positions.clone.rotate(-1)
	while true
		arr.each do |p|
			prev = mouse.position
			mouse.click(*p)
			sleep 0.1
			mouse.move(prev[:x], prev[:y])


			#do stuff


			sleep 3
		end
	end
end

# buy_peasants(few: 1)
loop_tabs()



# buy_peasants(few: 3, many: 0, alot: 0)
