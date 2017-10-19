
#include<stdio.h>


int main(int argc, char **argv)
{
    for (int i = 0; i < 3; ++i)
    {
	
        printf("argv[%d]: %s\n", i, argv[i]);
    }
}
