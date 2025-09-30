var dIndex, tempPow, lMX, lMY, i, ia, lX, lY, lX2, lY2, lC;
x -= 32
y -= 176
w = 5
h = 5
color = 9
colorSpend = 9
scrColorDoor()
scrColorDoor2()
c4 = make_color_hsv(hue, 180, 255)
c5 = make_color_hsv(hue, 230, 200)
c6 = make_color_hsv(hue, 255, 80)
c2 = c5
scrDrawDoorSpend()
scrDrawDoorRequire()
dIndex = 0
tempPow = 2
if (tempPow <= 1)
    dIndex = 6
else
    dIndex = 7
if (w > 1)
{
    draw_sprite_part_ext(sprDoorBig, dIndex, 16, 0, 16, 16, (x + 16), y, ((w - 1) * 2), 1, c_white, 1)
    draw_sprite_part_ext(sprDoorBig, dIndex, 16, 48, 16, 16, (x + 16), ((y + (32 * h)) - 16), ((w - 1) * 2), 1, c_white, 1)
}
if (h > 1)
{
    draw_sprite_part_ext(sprDoorBig, dIndex, 0, 16, 16, 16, x, (y + 16), 1, ((h - 1) * 2), c_white, 1)
    draw_sprite_part_ext(sprDoorBig, dIndex, 48, 16, 16, 16, ((x + (32 * w)) - 16), (y + 16), 1, ((h - 1) * 2), c_white, 1)
}
draw_sprite_part_ext(sprDoorBig, dIndex, 0, 0, 16, 16, x, y, 1, 1, c_white, 1)
draw_sprite_part_ext(sprDoorBig, dIndex, 48, 0, 16, 16, ((x + (32 * w)) - 16), y, 1, 1, c_white, 1)
draw_sprite_part_ext(sprDoorBig, dIndex, 0, 48, 16, 16, x, ((y + (32 * h)) - 16), 1, 1, c_white, 1)
draw_sprite_part_ext(sprDoorBig, dIndex, 48, 48, 16, 16, ((x + (32 * w)) - 16), ((y + (32 * h)) - 16), 1, 1, c_white, 1)
lMX = (x + (w * 16))
lMY = (y + (h * 16))
for (i = 0; i < 3; i += 1)
{
    ia = (90 + ((360 * i) / 3))
    lX = (lMX + lengthdir_x(20, ia))
    lY = (lMY + lengthdir_y(20, ia))
    lX2 = (lMX + lengthdir_x(20, (ia + 120)))
    lY2 = (lMY + lengthdir_y(20, (ia + 120)))
    draw_set_color(c4)
    draw_line_width((lX + 1), (lY + 1), (lX2 + 1), (lY2 + 1), 3)
    draw_set_color(c6)
    draw_line_width(lX, lY, lX2, lY2, 3)
    draw_set_color(c_white)
}
for (i = 3; i < 8; i += 1)
{
    ia = (270 + ((360 * (i - 3)) / 5))
    lX = (lMX + lengthdir_x(42, ia))
    lY = (lMY + lengthdir_y(42, ia))
    lX2 = (lMX + lengthdir_x(42, (ia + 72)))
    lY2 = (lMY + lengthdir_y(42, (ia + 72)))
    draw_set_color(c4)
    draw_line_width((lX + 1), (lY + 1), (lX2 + 1), (lY2 + 1), 3)
    draw_set_color(c6)
    draw_line_width(lX, lY, lX2, lY2, 3)
    draw_set_color(c_white)
}
for (i = 8; i < 14; i += 1)
{
    ia = (90 + ((360 * (i - 8)) / 6))
    lX = (lMX + lengthdir_x(64, ia))
    lY = (lMY + lengthdir_y(64, ia))
    lX2 = (lMX + lengthdir_x(64, (ia + 60)))
    lY2 = (lMY + lengthdir_y(64, (ia + 60)))
    draw_set_color(c4)
    draw_line_width((lX + 1), (lY + 1), (lX2 + 1), (lY2 + 1), 3)
    draw_set_color(c6)
    draw_line_width(lX, lY, lX2, lY2, 3)
    draw_set_color(c_white)
}
for (i = 0; i < 3; i += 1)
{
    lC = scrGetLockColor(oCol[i])
    ia = (90 + ((360 * i) / 3))
    lX = ((lMX - 16) + lengthdir_x(20, ia))
    lY = ((lMY - 16) + lengthdir_y(20, ia))
    drawTerminalOLock(i, lX, lY, lC)
    lX2 = ((lMX - 16) + lengthdir_x(20, (ia + 120)))
    lY2 = ((lMY - 16) + lengthdir_y(20, (ia + 120)))
}
for (i = 3; i < 8; i += 1)
{
    lC = scrGetLockColor(oCol[i])
    ia = (270 + ((360 * (i - 3)) / 5))
    lX = ((lMX - 16) + lengthdir_x(42, ia))
    lY = ((lMY - 16) + lengthdir_y(42, ia))
    drawTerminalOLock(i, lX, lY, lC)
}
for (i = 8; i < 14; i += 1)
{
    lC = scrGetLockColor(oCol[i])
    ia = (90 + ((360 * (i - 8)) / 6))
    lX = ((lMX - 16) + lengthdir_x(64, ia))
    lY = ((lMY - 16) + lengthdir_y(64, ia))
    drawTerminalOLock(i, lX, lY, lC)
}
x += 32
y += 176
w = 3
h = 4
