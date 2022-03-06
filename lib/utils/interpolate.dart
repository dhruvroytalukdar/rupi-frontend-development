
// Function takes the height of the current screen as input and returns value of y for the circle designs.

double interpolate_value(double min_y,double max_y,double min_height,double max_height,double height){
  double height_diff = max_height - min_height;
  double y_diff = max_y - min_y;
  return min_y + y_diff * (height - min_height)/height_diff;
}