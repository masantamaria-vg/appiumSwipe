def calculate_start_point(rect, direction, axis, offset=80):
    x = 0
    y = 0
    if axis == "horizontal":
        y = (rect['y'] + rect['height']) // 2
        if direction == "left":
            x = (rect['x'] + rect['width']) - offset
        else:
            x = x + offset
    else:
        x = (rect['x'] + rect['width']) // 2
        if direction == "up":
            y = (rect['y'] + rect['height']) - offset
        else:
            y = y + offset
    return {'x': x, 'y': y}


def calculate_end_point(rect, direction, axis, offset=80):
    opposite_direction = ""
    match direction:
        case "left":
            opposite_direction = "right"
        case "right":
            opposite_direction = "left"
        case "up":
            opposite_direction = "down"
        case "down":
            opposite_direction = "up"
    end_point = calculate_start_point(rect, opposite_direction, axis, offset)
    return end_point


def calculate_end_offset(start_point, end_point):
    x_offset = end_point['x'] - start_point['x']
    y_offset = end_point['y'] - start_point['y']
    return {'x': x_offset, 'y': y_offset}
