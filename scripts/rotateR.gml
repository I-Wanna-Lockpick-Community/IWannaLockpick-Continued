///rotateR(real,imaginary,powI);
switch argument2{
    case 0://i^0 = Multiply by 1
        return argument0;
    break;
    case 1://i^1 = Multiply by i
        return -argument1;
    break;
    case 2://i^2 = Multiply by -1
        return -argument0;
    break;
    case 3://i^3 = Multiply by -i
        return argument1;
    break;
}
