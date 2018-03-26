#include <stdio.h>

int tag[2][4];
int mru[4] = {1,1,1,1};

int main( )
{
   int addr;
   int hits, accesses;
	int i, j, t;
   FILE *fp;
   fp = fopen("trace.txt", "r");
   hits = 0;
   accesses = 0;
   while (fscanf(fp, "%x", &addr) > 0) 
	{
		accesses += 1;
		printf("%3d: 0x%08x ", accesses, addr);
		
		//right shift addr by 2 bits and bitwise AND with 3 = 0011
   	i = (addr >> 2) & 3;
		t = addr | 0xf;

		for(j = 0; j < 2; j++)
		{
			if(tag[j][i] == t)
			{
	  	      hits += 1;
	  	      printf("Hit%d ", i);
	  	      mru[i] = j;
	  	      break;
	  	   }
		}

		if(j == 2)
		{
	  	   printf("Miss ");
	  	   
			j = mru[i];
			if(j == 0)
				j = 1;
			else 
				j = 0;

			tag[j][i] = t;
	  	   mru[i] = j;
	  	}

		for(j = 0; j < 4; j++)
		{
			for(i = 0; i < 2; i++)
			{
				printf("0x%08x ", tag[i][j]);
			}
			printf("\t");
		}
		for(i = 0; i < 4; i++)
			printf("%d ", mru[i]);
		printf("\n");
   }
	printf("Hits = %d, Accesses = %d, Hit ratio = %f\n", hits, accesses, ((float)hits)/accesses);
   fclose(fp);
}
