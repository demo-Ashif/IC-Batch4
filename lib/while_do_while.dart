void main() {
  int battery = 60;

  //Keyword - while
  while (battery > 0) {
    print('Device running ....');
    battery -= 10;
  }

  //do-while loop
  //Keyword - do

  int tries = 0;
  do {
    tries++;
    print('Attempt: $tries');
  } while (tries < 3);
}
