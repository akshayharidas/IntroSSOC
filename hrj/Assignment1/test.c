#include<stdio.h>
#include<string.h>
#include<ctype.h>
void main()
{
    char p[20];
    int key,i,enc;
    printf("Enter Plain text=");
    gets(p);
    printf("\n Enter Key=");
    scanf("%d",&key);

    for(i=0;i<strlen(p);i++)
    {
           p[i]=tolower(p[i]);
           enc=((p[i]-97)+key)%26;
           printf("%c",enc+97);
    }
}
