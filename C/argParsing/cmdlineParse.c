#include <stdio.h>

int main ( int argc, char * argv[] )
{
  printf( "Number of args: %d\n",argc );

  if( argc < 5 )
  {
    printf("Usage: %s <one> <two> <three> <four>\n",argv[0]);
    return -1;
  }

  printf("argv[0]: %s\n",argv[0]);
  printf("argv[1]: %s\n",argv[1]);
  printf("argv[2]: %s\n",argv[2]);
  printf("argv[3]: %s\n",argv[3]);
  printf("argv[4]: %s\n",argv[4]);

  printf("Hello %s!\n",argv[1]);
  return 0;
}
