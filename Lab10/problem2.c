#include <stdio.h>
int tag[8];
int mru[8] = {7,6,5,4,3,2,1,0};

//brings the recently used index to front
//shift everything 1 place behind
void mruUpdate(int index) 
{
   int i;

   for (i = 0; i < 8; i++)
	{
		if (mru[i] == index)
			break;
	}

   while (i > 0) 
	{
		mru[i] = mru[i-1];
		i--;    
	}

   mru[0] = index;     
}

int main( )
{
	int addr;
	int i;
	int hits, accesses;
	FILE *fp;
	fp = fopen("trace.txt", "r");
	hits = 0;
	accesses = 0;
	while (fscanf(fp, "%x", &addr) > 0) 
	{
	  	accesses += 1;
	  	printf("%3d: 0x%08x ", accesses, addr);
		//Find addr in tag
	  	for (i = 0; i < 8; i++) 
		{
			//If present, increase hit and update most recently used index
	  	   if (tag[i] == addr) 
			{
	  	      hits += 1;
	  	      printf("Hit%d ", i);
	  	      mruUpdate(i);
	  	      break;
	  	   }
	  	}
		//if i reaches 8, means not present
		//update tag's least recently used index with the addr
		//make it most recently used
	  	if (i == 8) 
		{
	  	   printf("Miss ");
	  	   i = mru[7];
	  	   tag[i] = addr;
	  	   mruUpdate(i);
	  	}

		//Print tag and mru
	  	for (i = 0; i < 8; i++)
	  	   printf("0x%08x ", tag[i]);
	  	for (i = 0; i < 8; i++)
	  	   printf("%d ", mru[i]);
	  	printf("\n");
	}
	printf("Hits = %d, Accesses = %d, Hit ratio = %f\n", hits, accesses, ((float)hits)/accesses);
	fclose(fp); 
}