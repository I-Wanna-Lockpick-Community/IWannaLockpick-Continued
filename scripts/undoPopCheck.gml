///undoPopCheck();
// Check the next iter value of the undo array

var matches = index == iter;
iter += 1;
if matches {
    willContinue = true;
    undoData[index] = value;
}
return matches;
